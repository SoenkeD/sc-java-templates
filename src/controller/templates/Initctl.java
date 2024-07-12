
package src.controller.templates;

import src.controller.templates.actions.Actions;
import src.controller.templates.guards.Guards;
import src.controller.templates.controller.*;
import src.controller.templates.state.*;

public class Initctl {
	public static Ctl initCtl() {
		Ctl ctl = new Ctl(new ExtendedState(), new Ctx(), new ControllerSettings(new DefaultAfterStateHandler()));

		ctl.setActions(Actions.getActions());
		ctl.setGuards(Guards.getGuards());
		ctl.setStates(Sm.getStates());

		return ctl;
	}
}