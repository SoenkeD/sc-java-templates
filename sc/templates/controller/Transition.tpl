package {{ .ImportRoot }}.controller;

import java.util.*;

public class Transition {
    private String guard;
    private List<String> guardArgs = new ArrayList<>();
    private String action;
    private List<String> actionArgs = new ArrayList<>();
    private String next;
    private boolean negation;
    private TransitionType type;

    public String getGuard() {
        return guard;
    }

    public void setGuard(String guard) {
        this.guard = guard;
    }

    public List<String> getGuardArgs() {
        return guardArgs;
    }

    public void setGuardArgs(List<String> guardArgs) {
        this.guardArgs = guardArgs;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public List<String> getActionArgs() {
        return actionArgs;
    }

    public void setActionArgs(List<String> actionArgs) {
        this.actionArgs = actionArgs;
    }

    public String getNext() {
        return next;
    }

    public void setNext(String next) {
        this.next = next;
    }

    public boolean isNegation() {
        return negation;
    }

    public void setNegation(boolean negation) {
        this.negation = negation;
    }

    public TransitionType getType() {
        return type;
    }

    public void setType(TransitionType type) {
        this.type = type;
    }
}
