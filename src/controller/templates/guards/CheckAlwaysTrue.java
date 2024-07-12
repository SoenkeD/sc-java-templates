
package src.controller.templates.guards;

import src.controller.templates.controller.Guard;
import src.controller.templates.state.ExtendedState;

public class CheckAlwaysTrue implements Guard {
    @Override
    public boolean doGuard(ExtendedState state, String... args) {
		return true;
    }
}
