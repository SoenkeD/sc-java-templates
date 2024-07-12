

package src.controller.templates.actions;

import java.util.HashMap;
import java.util.Map;

import src.controller.templates.controller.Action;

public class Actions {
	public static Map<String, Action> getActions() {
		Map<String, Action> actions = new HashMap<>();
		actions.put("AddMsgAction", new AddMsg());
		actions.put("PrintAction", new Print());
		actions.put("PrintMsgsAction", new PrintMsgs());

		return actions;
	}
}