package {{ .ImportRoot }}.controller;

public interface ErrorHandler {
    boolean react(CtlErr err);
}