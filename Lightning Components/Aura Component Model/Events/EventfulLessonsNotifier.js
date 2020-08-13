({
	fireCustomEvent : function(component, event, helper) {
        /* again, before we can fire the event, we have to retrieve it
        
        for component events, we do so through the component.getEvent(eventName) method */
        let customEvent = component.getEvent("customEvent");
                
        /* the remainder of the steps for preparing and firing a component event are the same as those for firing an application
        event */
        customEvent.setParams({
            "message" : "Component Event Fired."
        });
        customEvent.fire();
	}

})
