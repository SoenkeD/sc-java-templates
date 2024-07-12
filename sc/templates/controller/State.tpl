package {{ .ImportRoot }}.controller;

import java.util.*;

public class State {
    private List<StateAction> actions = new ArrayList<>();
    private List<Transition> transitions = new ArrayList<>();

    public List<StateAction> getActions() {
        return actions;
    }

    public void setActions(List<StateAction> actions) {
        this.actions = actions;
    }

    public List<Transition> getTransitions() {
        return transitions;
    }

    public void setTransitions(List<Transition> transitions) {
        this.transitions = transitions;
    }
}
