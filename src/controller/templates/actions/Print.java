
package src.controller.templates.actions;

import src.controller.templates.controller.Action;
import src.controller.templates.state.Ctx;
import src.controller.templates.state.ExtendedState;

public class Print implements Action {
    @Override
    public void doAction(Ctx ctx, ExtendedState state, String... args) {
        System.out.println(args[0]);
    }
}
