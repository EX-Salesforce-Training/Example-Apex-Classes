///////////////////////////////////////////////////////////////////////////
//
// Author: Harvey Hill
// Date: 6/4/19
// Description: An example class showing a dynamic visualforce component.
//
///////////////////////////////////////////////////////////////////////////

//The class resembles a normal apex class to start.
public class DynamicController {
    public DynamicController() {    }

    // We define a method that is going to return the visualforce component we intend to use on our page, 
    // in this case a simple outputtext.
    public Component.Apex.OutputText getOutputText() {
        // We create the instance of output text we are going to work with.
        Component.apex.OutputText outputText = new Component.apex.OutputText();
        // I set up a simple logic test here to show how it can be 'dynamic'
        Time testTime = Time.newInstance(0,0,0,0);
        if(Datetime.now().time() > testTime) {
            // If it is after midnight, we will use this output for the component.
            outputText.value = 'It is after midnight.';
            return outputText; 
        } else {
            // If it is exactly midnight, we will use this value instead.
            outputText.value = 'It is midnight.';
            return outputText;
        }
    }
}
