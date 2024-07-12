package src.controller.templates.controller;

import java.util.concurrent.TimeUnit;

public class Reconciler {
    private final Ctl ctl;
    private final long defaultBetweenReconcile;
    private final PanicHandler panicHandler;
    private final ErrorHandler errorHandler;
    private final AfterReconcileHandler afterReconcileHandler;

    public Reconciler(Ctl ctl, ReconcilerInput input) {
        this.ctl = ctl;

        this.defaultBetweenReconcile = input.getDefaultBetweenReconcile() > 0 ?
                input.getDefaultBetweenReconcile() : TimeUnit.SECONDS.toMillis(2);

        this.panicHandler = input.getPanicHandler() != null ?
                input.getPanicHandler() : new DefaultPanicHandler();

        this.errorHandler = input.getErrorHandler() != null ?
                input.getErrorHandler() : new DefaultErrorHandler();

        this.afterReconcileHandler = input.getAfterReconcileHandler() != null ?
                input.getAfterReconcileHandler() : new DefaultAfterReconcileHandler();
    }

    public void reconcile() throws CtlErr {
        while (true) {
            CtlRes res = null;
            try {
                res = ctl.run();
            } catch (CtlErr err) {
                if (err.getPanicErr() != null) {
                    boolean next = panicHandler.react(err.getPanicErr());
                    if (!next) return;
                }

                if (err.getStateErr() != null) {
                    boolean next = errorHandler.react(err);
                    if (!next) return;
                }
            }

            boolean nextReconcile = afterReconcileHandler.react(res);
            if (!nextReconcile) return;

            try {
                Thread.sleep(defaultBetweenReconcile);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
