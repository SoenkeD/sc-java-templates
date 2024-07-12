package {{ .ImportRoot }}.controller;

import {{ .ImportRoot }}.state.ExtendedState;

public class DefaultAfterStateHandler implements AfterStateHandler {
    @Override
    public boolean react(ExtendedState state) {
        return true;
    }
}
