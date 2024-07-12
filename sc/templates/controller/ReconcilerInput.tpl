package {{ .ImportRoot }}.controller;

public class ReconcilerInput {
    private long defaultBetweenReconcile;
    private PanicHandler panicHandler;
    private ErrorHandler errorHandler;
    private AfterReconcileHandler afterReconcileHandler;

    public ReconcilerInput() {} // used for defaults

    public ReconcilerInput(long defaultBetweenReconcile, PanicHandler panicHandler, ErrorHandler errorHandler, AfterReconcileHandler afterReconcileHandler) {
        this.defaultBetweenReconcile = defaultBetweenReconcile;
        this.panicHandler = panicHandler;
        this.errorHandler = errorHandler;
        this.afterReconcileHandler = afterReconcileHandler;
    }

    public long getDefaultBetweenReconcile() {
        return defaultBetweenReconcile;
    }

    public void setDefaultBetweenReconcile(long defaultBetweenReconcile) {
        this.defaultBetweenReconcile = defaultBetweenReconcile;
    }

    public PanicHandler getPanicHandler() {
        return panicHandler;
    }

    public void setPanicHandler(PanicHandler panicHandler) {
        this.panicHandler = panicHandler;
    }

    public ErrorHandler getErrorHandler() {
        return errorHandler;
    }

    public void setErrorHandler(ErrorHandler errorHandler) {
        this.errorHandler = errorHandler;
    }

    public AfterReconcileHandler getAfterReconcileHandler() {
        return afterReconcileHandler;
    }

    public void setAfterReconcileHandler(AfterReconcileHandler afterReconcileHandler) {
        this.afterReconcileHandler = afterReconcileHandler;
    }
}

