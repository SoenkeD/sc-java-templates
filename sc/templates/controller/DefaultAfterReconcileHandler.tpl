package {{ .ImportRoot }}.controller;

public class DefaultAfterReconcileHandler implements AfterReconcileHandler {
    @Override
    public boolean react(CtlRes res) {
        return true;
    }
}