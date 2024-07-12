package {{ .ImportRoot }}.controller;

import java.util.*;

public class CtlErr extends Exception {
    private StateErr stateErr;
    private PanicErr panicErr;
    private List<String> route;

    public CtlErr(StateErr stateErr, PanicErr panicErr, List<String> route) {
        this.stateErr = stateErr;
        this.panicErr = panicErr;
        this.route = route;
    }

    public StateErr getStateErr() {
        return stateErr;
    }

    public void setStateErr(StateErr stateErr) {
        this.stateErr = stateErr;
    }

    public PanicErr getPanicErr() {
        return panicErr;
    }

    public void setPanicErr(PanicErr panicErr) {
        this.panicErr = panicErr;
    }

    public List<String> getRoute() {
        return route;
    }

    public void setRoute(List<String> route) {
        this.route = route;
    }
}
