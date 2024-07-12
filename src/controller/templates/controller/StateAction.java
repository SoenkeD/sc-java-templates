package src.controller.templates.controller;

import java.util.List;

public class StateAction {
    private String action;
    private List<String> actionArgs;

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
}
