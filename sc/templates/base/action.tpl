{{- $impRoot := replaceAll .ImportRoot "/" "." }}
package {{ $impRoot }}.actions;

import {{ $impRoot }}.controller.Action;
import {{ $impRoot }}.state.Ctx;
import {{ $impRoot }}.state.ExtendedState;

{{ .Code }}