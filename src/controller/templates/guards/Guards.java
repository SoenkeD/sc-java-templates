

package src.controller.templates.guards;

import java.util.HashMap;
import java.util.Map;

import src.controller.templates.controller.Guard;

public class Guards {
	public static Map<String, Guard> getGuards() {
		Map<String, Guard> guards = new HashMap<>();
		guards.put("CheckAlwaysTrue", new CheckAlwaysTrue());

		return guards;
	}
}