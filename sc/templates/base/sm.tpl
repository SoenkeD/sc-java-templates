{{- $impRoot := replaceAll .ImportRoot "/" "." }}
package {{ $impRoot }};

import java.util.*;

import {{ $impRoot }}.controller.*;

public class Sm {

	static Map<String, State> getStates() {
		Map<String, State> states = new HashMap<>();
		
		{{- range $idx, $state := .States }}

		{{ $state }}

		{{- end }}

		return states;
	} 
}

