({
	doInit : function(component, event, helper) {
        console.log('Function Called');
		let getContacts = component.get("c.getContacts");
        getContacts.setCallback(this, function(response) {

            if (response.getState() === "SUCCESS") {
 				console.log(response);
                component.set("v.contacts", response.getReturnValue());
            }
        });
        $A.enqueueAction(getContacts);
	}
})
