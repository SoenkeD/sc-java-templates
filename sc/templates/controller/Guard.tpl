package {{ .ImportRoot }}.controller;

import {{ .ImportRoot }}.state.ExtendedState;

public interface Guard {
    boolean doGuard(ExtendedState state, String... args);
}
