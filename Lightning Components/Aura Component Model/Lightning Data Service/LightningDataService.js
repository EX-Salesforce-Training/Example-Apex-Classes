({
	DisplayChange : function(component, event, helper) {
		  let display = component.get('v.display');
      component.set('v.display', !display);
	}
})
