package src.controller.templates.controller;

public class DefaultErrorHandler implements ErrorHandler {
    @Override
    public boolean react(CtlErr err) {
        return false;
    }
}