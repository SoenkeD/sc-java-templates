package {{ .ImportRoot }}.controller;

public interface PanicHandler {
    boolean react(PanicErr err);
}
