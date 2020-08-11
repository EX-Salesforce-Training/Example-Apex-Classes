({
    // this function calls our Apex controller function that returns a list of the Ids of all open cases
	doInit : function(component, event, helper) {
        
        /*// here, we grab the getMyOpenCases method from our Apex controller
        // because we're in the JS controller, the c value provider refers to the Apex controller
        // since we declare the Apex controller in the view, we use the component.get method to find it
        // so our code is telling the system "retrieve the Apex method named getMyOpenCases, you can find it in the
        // Apex class for our component, which we declared in the component file" */
        let getMyOpenCases = component.get("c.getMyOpenCases");
        
        /*// since getMyOpenCases doesn't have any parameters, we skip to setting the callback function
		//
        // A callback function is a function that's executed after another function returns
		//
        // Here, we're saying "after this (which refers to the myOpenCases variable holding the getMyOpenCases Apex
        // method reference) function returns, execute this callback function" */
        getMyOpenCases.setCallback(this, function(response) {
            /*// Our server response contains a single JSON object, which we'll parse here
            // the getState() method returns the state of the request, here we're checking for a successful request 
            */
            if (response.getState() === "SUCCESS") {
                /*// if our request was successful, we want to assign the returned list of Ids to our cases attribute
                // in the view by using the getReturnValue() method
				//
                // the return value is simply the value that gets returned by our return statement in our Apex method
                */
                component.set("v.cases", response.getReturnValue());
            }
        });
        
        /*// The last step is to enqueue the action
        //
        // If we don't enqueue it, it'll never make the call because we 
        // haven't told it to do that before this point
		//
        // once our asynchronous server call is executed and returns, the callback function we defined with 
        // the setCallback() method will execute */
        $A.enqueueAction(getMyOpenCases);
	},
    
    handleClick : function(component, event, helper) {
        helper.helperMethod(component);
    },
    
    createContact : function(component, event, helper) {
        let newContact = component.get('v.newContact');
        helper.helperContact(component, newContact);
    },
})
