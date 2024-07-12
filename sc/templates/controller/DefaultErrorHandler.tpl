package {{ .ImportRoot }}.controller;

public class DefaultErrorHandler implements ErrorHandler {
    @Override
    public boolean react(CtlErr err) {
        return false;
    }
}