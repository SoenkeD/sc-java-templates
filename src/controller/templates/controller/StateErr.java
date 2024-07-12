package src.controller.templates.controller;

public class StateErr {
    private String state;
    private ActionErr actionErr;

    public StateErr(String state, ActionErr actionErr) {
        this.state = state;
        this.actionErr = actionErr;
    }

    public String getState() {
        return state;
    }

    public ActionErr getActionErr() {
        return actionErr;
    }

    public void setState(String state) {
        this.state = state;
    }

    public void setActionErr(ActionErr actionErr) {
        this.actionErr = actionErr;
    }
}
