{{- $impRoot := replaceAll .ImportRoot "/" "." }}

package {{ $impRoot }}.guards;

import java.util.HashMap;
import java.util.Map;

import {{ $impRoot }}.controller.Guard;

public class Guards {
	public static Map<String, Guard> getGuards() {
		Map<String, Guard> guards = new HashMap<>();

		{{- range $guard, $guardCode := .Guards }}
		guards.put("{{ $guard }}", new {{ $guard }}());
		{{- end }}

		return guards;
	}
}