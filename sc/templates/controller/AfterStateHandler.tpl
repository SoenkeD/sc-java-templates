package {{ .ImportRoot }}.controller;

import {{ .ImportRoot }}.state.ExtendedState;

public interface AfterStateHandler {
    boolean react(ExtendedState state);
}