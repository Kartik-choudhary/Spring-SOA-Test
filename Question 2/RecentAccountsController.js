({
    doInit : function(component, event, helper) {
        component.set('v.columns', [
            { label: 'Name', fieldName: 'Name'},
            { label: 'Phone', fieldName: 'Phone' },
        ]);
            var action = component.get("c.fetchData");
            action.setCallback(this, function (response) {
                var state = response.getState();
                if (state === "SUCCESS") {
             		component.set('v.data',response.getReturnValue());
            	}
                else if (state === "INCOMPLETE") {
                }
                else if (state === "ERROR") {
                    var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                        console.log("Error message: " +
                                    errors[0].message);
                        }
                    } else {
                        console.log("Unknown error");
                    }
                }
 			});
			$A.enqueueAction(action);
	}
})