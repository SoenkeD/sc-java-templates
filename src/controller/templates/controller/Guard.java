package src.controller.templates.controller;

import src.controller.templates.state.ExtendedState;

public interface Guard {
    boolean doGuard(ExtendedState state, String... args);
}
