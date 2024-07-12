package src.controller.templates.controller;

import src.controller.templates.state.ExtendedState;

public interface AfterStateHandler {
    boolean react(ExtendedState state);
}