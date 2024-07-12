
package src.controller.templates;

import java.util.*;

import src.controller.templates.controller.*;

public class Sm {

	static Map<String, State> getStates() {
		Map<String, State> states = new HashMap<>();

		State DemoState= new State();

    StateAction DemoState0Action = new StateAction();
    DemoState0Action.setAction("AddMsgAction");

    ArrayList<String> DemoState0ActionArgs = new ArrayList<>();
        DemoState0ActionArgs.add("Hello");

    DemoState0Action.setActionArgs(DemoState0ActionArgs);

    DemoState.getActions().add(DemoState0Action);

    StateAction DemoState1Action = new StateAction();
    DemoState1Action.setAction("AddMsgAction");

    ArrayList<String> DemoState1ActionArgs = new ArrayList<>();
        DemoState1ActionArgs.add("World1");

    DemoState1Action.setActionArgs(DemoState1ActionArgs);

    DemoState.getActions().add(DemoState1Action);

    StateAction DemoState2Action = new StateAction();
    DemoState2Action.setAction("AddMsgAction");

    ArrayList<String> DemoState2ActionArgs = new ArrayList<>();
        DemoState2ActionArgs.add("!");

    DemoState2Action.setActionArgs(DemoState2ActionArgs);

    DemoState.getActions().add(DemoState2Action);

    Transition DemoState0Transition = new Transition();DemoState0Transition.setGuard("CheckAlwaysTrue");

        ArrayList<String> DemoState0GuardArgs = new ArrayList<>();

        DemoState0Transition.setGuardArgs(DemoState0GuardArgs);DemoState0Transition.setAction("PrintAction");

        ArrayList<String> DemoState0TransActionArgs = new ArrayList<>();
            DemoState0TransActionArgs.add("Go to BurnState");

        DemoState0Transition.setActionArgs(DemoState0TransActionArgs);DemoState0Transition.setNext("BurnState");DemoState0Transition.setNegation(false);
    DemoState0Transition.setType(TransitionType.NORMAL);
    DemoState.getTransitions().add(DemoState0Transition);

    Transition DemoState1Transition = new Transition();DemoState1Transition.setNext("EndState");DemoState1Transition.setNegation(false);
    DemoState1Transition.setType(TransitionType.HAPPY);
    DemoState.getTransitions().add(DemoState1Transition);

states.put("DemoState", DemoState);



		State EndState= new State();

states.put("EndState", EndState);



		State BurnState= new State();

    StateAction BurnState0Action = new StateAction();
    BurnState0Action.setAction("PrintAction");

    ArrayList<String> BurnState0ActionArgs = new ArrayList<>();
        BurnState0ActionArgs.add("Got messages");

    BurnState0Action.setActionArgs(BurnState0ActionArgs);

    BurnState.getActions().add(BurnState0Action);

    StateAction BurnState1Action = new StateAction();
    BurnState1Action.setAction("PrintMsgsAction");

    ArrayList<String> BurnState1ActionArgs = new ArrayList<>();

    BurnState1Action.setActionArgs(BurnState1ActionArgs);

    BurnState.getActions().add(BurnState1Action);

    Transition BurnState0Transition = new Transition();BurnState0Transition.setNext("EndState");BurnState0Transition.setNegation(false);
    BurnState0Transition.setType(TransitionType.HAPPY);
    BurnState.getTransitions().add(BurnState0Transition);

states.put("BurnState", BurnState);



		State StartState= new State();

    Transition StartState0Transition = new Transition();StartState0Transition.setGuard("CheckAlwaysTrue");

        ArrayList<String> StartState0GuardArgs = new ArrayList<>();

        StartState0Transition.setGuardArgs(StartState0GuardArgs);StartState0Transition.setNext("DemoState");StartState0Transition.setNegation(false);
    StartState0Transition.setType(TransitionType.NORMAL);
    StartState.getTransitions().add(StartState0Transition);

    Transition StartState1Transition = new Transition();StartState1Transition.setNext("EndState");StartState1Transition.setNegation(false);
    StartState1Transition.setType(TransitionType.ERROR);
    StartState.getTransitions().add(StartState1Transition);

    Transition StartState2Transition = new Transition();StartState2Transition.setNext("EndState");StartState2Transition.setNegation(false);
    StartState2Transition.setType(TransitionType.HAPPY);
    StartState.getTransitions().add(StartState2Transition);

states.put("StartState", StartState);



		return states;
	} 
}

