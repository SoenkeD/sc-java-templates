package {{ .ImportRoot }}.controller;

public interface AfterReconcileHandler {
    boolean react(CtlRes res);
}