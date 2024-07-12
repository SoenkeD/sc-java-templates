package {{ .ImportRoot }}.controller;

import java.util.*;

import {{ .ImportRoot }}.state.Ctx;
import {{ .ImportRoot }}.state.ExtendedState;

public class Ctl {
    private final Map<String, Action> actions = new HashMap<>();
    private final Map<String, Guard> guards = new HashMap<>();
    private final Map<String, State> states = new HashMap<>();
    
    private final Ctx ctx;
    private final ControllerSettings settings;

    private ExtendedState state;
    private String nextState;
    private PanicErr panic;

    public Ctl(ExtendedState state, Ctx ctx, ControllerSettings settings) {
        this.state = state;
        this.ctx = ctx;
        this.settings = settings;
    }

    public void init() {
        this.nextState = "StartState";
        this.state = new ExtendedState();
        this.panic = null;
    }

    public CtlRes run() throws CtlErr {
        init();

        while (!nextState.equals("EndState")) {
            StateErr stateErr = doNextState();

            if (panic != null) {
                throw new CtlErr(null, panic, state.getRoute());
            }

            if (stateErr != null) {
                System.out.print(stateErr.getActionErr().getErr());
            }

            boolean nextStateDecision = settings.getAfterState().react(state);
            if (!nextStateDecision) {
                Exception afterStateHandlerError = new Exception("AfterStateHandler: decided to not continue");
                throw new CtlErr(new StateErr(nextState, new ActionErr(afterStateHandlerError, "Test")), null, state.getRoute());

            }
        }

        state.getRoute().add("EndState");
        return new CtlRes(state.getRoute());
    }

    public StateErr doNextState() {
        State currentState = states.get(nextState);
        if (currentState == null) {
            return new StateErr(nextState, new ActionErr(new Exception("State not found: " + nextState),null));
        }

        for (StateAction stateAction : currentState.getActions()) {
            ActionErr actionErr = doAction(stateAction.getAction(), stateAction.getActionArgs());
            if (actionErr != null) {
                return new StateErr(nextState, actionErr);
            }
        }

        for (Transition transition : currentState.getTransitions()) {
            if (evaluateGuardCondition(transition.getGuard(), transition.getGuardArgs()) ^ transition.isNegation()) {
                if (transition.getAction() != null) {
                    ActionErr actionErr = doAction(transition.getAction(), transition.getActionArgs());
                    if (actionErr != null) {
                        return new StateErr(nextState, actionErr);
                    }
                }
               
                nextState = transition.getNext();
                return null;
            }
        }

        return new StateErr(nextState, new ActionErr(new Exception("No valid transition found: "), nextState));
    }

    private boolean evaluateGuardCondition(String guard, List<String> guardArgs) {

        if (guard == null || guard.equals("")) {
            return true;
        }

        Guard guardObj = guards.get(guard);
        if (guardObj == null) {
            return false;
        }
        
        return guardObj.doGuard(state, guardArgs.toArray(String[]::new));
    }
    

    private ActionErr doAction(String action, List<String> actionArgs) {
        Action actionObj = actions.get(action);
        if (actionObj == null) {
            return new ActionErr(new Exception("Action not found: " + action), action);
        }
        
        try {
            String[] args = (actionArgs == null) ? new String[0] : actionArgs.toArray(String[]::new);
            actionObj.doAction(ctx, state,args);
            return null;
        } catch (Exception e) {
            return new ActionErr(e, action);
        }
    }

    public Map<String, Action> getActions() {
        return actions;
    }

    public void setActions(Map<String, Action> actions) {
        this.actions.putAll(actions);
    }

    public Map<String, Guard> getGuards() {
        return guards;
    }

    public void setGuards(Map<String, Guard> guards) {
        this.guards.putAll(guards);
    }

    public Map<String, State> getStates() {
        return states;
    }

    public void setStates(Map<String, State> states) {
        this.states.putAll(states);
    }

    public ExtendedState getState() {
        return state;
    }

    public void setState(ExtendedState state) {
        this.state = state;
    }
}
