package src.controller.templates.controller;

import src.controller.templates.state.*;

public interface Action {
    void doAction(Ctx ctx, ExtendedState state, String... args) throws Exception;
}
