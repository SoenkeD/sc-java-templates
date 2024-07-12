package src.controller.templates.controller;

import java.util.*;

public class CtlRes {
    private final List<String> route;

    public CtlRes(List<String> route) {
        this.route = route;
    }

    public List<String> getRoute() {
        return this.route;
    }
}
