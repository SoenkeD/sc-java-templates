package {{ .ImportRoot }}.controller;

import {{ .ImportRoot }}.state.*;

public interface Action {
    void doAction(Ctx ctx, ExtendedState state, String... args) throws Exception;
}
