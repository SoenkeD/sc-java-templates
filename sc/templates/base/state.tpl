{{- $impRoot := replaceAll .ImportRoot "/" "." }}
package {{ $impRoot }}.state;

import java.util.*;

public class ExtendedState {
    private List<String> route;
    private Exception error;

    public ExtendedState() {
        this.route = new ArrayList<>();
    }

    public List<String> getRoute() {
        return route;
    }

    public void setRoute(List<String> route) {
        this.route = route;
    }

    public Exception getError() {
        return error;
    }

    public void setError(Exception error) {
        this.error = error;
    }
}
