{{- $impRoot := replaceAll .ImportRoot "/" "." }}
package {{ $impRoot }}.guards;

import {{ $impRoot }}.controller.Guard;
import {{ $impRoot }}.state.ExtendedState;

{{ .Code }}