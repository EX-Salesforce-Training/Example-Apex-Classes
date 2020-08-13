({
	// this is the function we bound to our event handler for the component event in the view
	handleCustomEvent : function(component, event, helper) {
        /* we can retrieve the information propagated in our event through use of the event.getParam method,
        which takes the name of an <aura:attribute> in the event file and returns the value that we assigned
        to that <aura:attribute> before we fired the event in the notifier component */
        let message = event.getParam("message");

        // assign the retrieved value to our <aura:attribute> that we displayed in the view
        component.set("v.messageFromEvent", message);
        
        // same thing here
        let numEventsFired = parseInt(component.get("v.eventsFired")) +1;
        component.set("v.eventsFired", numEventsFired);
	},
        
    // this is the function we bound to our event handler for the application event in the view
    handleCustomAppEvent : function(component, event, helper) {
        console.log('Starting handling of app event');
        
        /* we can retrieve the information propagated in our event through use of the event.getParam method,
        which takes the name of an <aura:attribute> in the event file and returns the value that we assigned
        to that <aura:attribute> before we fired the event in the notifier component */
        let message = event.getParam("message");
        
        // assign the retrieved value to our <aura:attribute> that we displayed in the view
        component.set("v.messageFromAppEvent", message);

        // same thing here
        let numAppEventsFired = parseInt(component.get("v.appEventsFired")) +1;
        component.set("v.appEventsFired", numAppEventsFired);
    }

})
