
package src.controller.templates.state;

import java.util.*;

public class ExtendedState {
    private List<String> route;
    private Exception error;

    private String msg;

    public ExtendedState() {
        this.route = new ArrayList<>();
        this.msg = "";
    }

    public List<String> getRoute() {
        return route;
    }

    public void setRoute(List<String> route) {
        this.route = route;
    }

    public Exception getError() {
        return error;
    }

    public void setError(Exception error) {
        this.error = error;
    }

    public void addMsg(String msg) {
        if (!this.msg.equals("")) {
            this.msg += " ";
        }

        this.msg += msg;
    }

    public String getMsg() {
        return this.msg;
    }
}
