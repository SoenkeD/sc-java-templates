{{- $impRoot := replaceAll .ImportRoot "/" "." }}

package {{ $impRoot }}.actions;

import java.util.HashMap;
import java.util.Map;

import {{ $impRoot }}.controller.Action;

public class Actions {
	public static Map<String, Action> getActions() {
		Map<String, Action> actions = new HashMap<>();

		{{- range $action, $actionCode := .Actions }}
		actions.put("{{ $action }}Action", new {{ $action}}());
		{{- end }}

		return actions;
	}
}