package src.controller.templates.controller;

public class ControllerSettings {
    private AfterStateHandler afterState;

    public ControllerSettings(AfterStateHandler afterState) {
        this.afterState = afterState;
    }

    public AfterStateHandler getAfterState() {
        return afterState;
    }

    public void setAfterState(AfterStateHandler afterState) {
        this.afterState = afterState;
    }
}
