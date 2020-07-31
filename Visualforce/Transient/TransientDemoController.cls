public class TransientDemoController {

    DateTime nonTransientVariable;
    transient DateTime transientVariable;

    public String getNonTransientVariable() {
        if (nonTransientVariable == null) nonTransientVariable = System.now();
        return '' + nonTransientVariable;
    }

    public String getTransientVariable() {
        if (transientVariable == null) transientVariable = System.now();
        return '' + transientVariable;
    }
    
    public void refresh(){
    
    }
}
