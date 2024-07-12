{{- $impRoot := replaceAll .ImportRoot "/" "." }}
package {{ $impRoot }};

import {{ $impRoot }}.actions.Actions;
import {{ $impRoot }}.guards.Guards;
import {{ $impRoot }}.controller.*;
import {{ $impRoot }}.state.*;

public class Initctl {
	public static Ctl initCtl() {
		Ctl ctl = new Ctl(new ExtendedState(), new Ctx(), new ControllerSettings(new DefaultAfterStateHandler()));

		ctl.setActions(Actions.getActions());
		ctl.setGuards(Guards.getGuards());
		ctl.setStates(Sm.getStates());

		return ctl;
	}
}