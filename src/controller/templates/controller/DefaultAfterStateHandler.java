package src.controller.templates.controller;

import src.controller.templates.state.ExtendedState;

public class DefaultAfterStateHandler implements AfterStateHandler {
    @Override
    public boolean react(ExtendedState state) {
        return true;
    }
}
