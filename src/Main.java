package src;

import src.controller.templates.Initctl;
import src.controller.templates.controller.*;

public class Main {
    public static void main(String[] args) {

            Ctl ctl = Initctl.initCtl();
            Reconciler reconciler = new Reconciler(
                ctl, 
                new ReconcilerInput()
                );


            try {
                reconciler.reconcile();
            } catch (CtlErr e) {
                System.err.println(e);
            }
            
    }
}