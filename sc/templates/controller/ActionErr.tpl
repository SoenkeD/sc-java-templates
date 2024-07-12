package {{ .ImportRoot }}.controller;

public class ActionErr {
    private Exception err;
    private String action;

    public ActionErr(Exception err, String action) {
        this.err = err;
        this.action = action;
    }

    public Exception getErr() {
        return err;
    }

    public void setErr(Exception err) {
        this.err = err;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }
}
