package {{ .ImportRoot }}.controller;

public class DefaultPanicHandler implements PanicHandler {
    @Override
    public boolean react(PanicErr err) {
        return false;
    }
}