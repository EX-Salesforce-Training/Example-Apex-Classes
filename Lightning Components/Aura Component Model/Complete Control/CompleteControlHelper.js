({
	helperMethod : function(component) {
		let bool = component.get("v.clicked");
        component.set("v.clicked", !bool);
	},
    
    helperContact : function(component, newContact) {
		let saveContact = component.get('c.SaveContact');
        console.log('Attempting to save ' + JSON.stringify(newContact));
        saveContact.setParams({
            "con": newContact
        });
        saveContact.setCallback(this, function(response){
            alert("Saved")
            component.set("v.newContact", response);
        });
        $A.enqueueAction(saveContact);

    }
})
