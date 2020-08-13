({
	fireAppEvent : function(component, event, helper) {
        /* before we can fire the event, we have to retrieve it
        we do so through $A.get("e.namespace:eventName") for application events 
                the e stands for event and the A is a global namespace that contains many system-defined
                functions and classes we use in Aura components
                
        in this case, we are retrieving the event named EventfulLessonsCustomApplicationEvent located in the default c namespace

        if we were retrieving a component event, we would use component.getEvent("eventName") */
        let appEvent = $A.get("e.c:EventfulLessonsCustomApplicationEvent");

        /* as we said in the exAppEvent.evt file, events are our main method of propagating information from
        child components to parent components

        here, we're setting the values of the <aura:attribute> tags in our event file through the setParams
        method, which takes a JS object literal whose keys are the names of the <aura:attribute> tags
        in quotes and whose values are the information we wish to propagate by way of those
        <aura:attribute> tags */
        appEvent.setParams({"message" : "Application Event Fired!"});

        // the last step is to actually fire the event, using the fire() method
        appEvent.fire();
        console.log('Fired App Event');
	}

})
