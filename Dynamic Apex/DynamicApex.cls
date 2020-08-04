// In this example we want to create a data factory for cases
// and we need to generate new cases. 
// For this purpose we want to make sure we are assigning
// an assortment of all possible values for case status.
public with sharing class DynamicApex {
    
    public String caseStatus {get;set;}
    
    public DynamicApex() {

    }

    /*// This method simply hardcodes the values
    // Should they ever change, the code will 
    // either break or be limited in its options 
    // to those hardcoded in.*/
    public void NonDynamic(Integer numToMake){
        List<Case> caseList = new List<Case>();
        for(integer i =0; 0<numToMake; i++){
            Case newCase = new Case();
            newCase.Origin = 'Web';
            integer status = 1;
            if(status == 1){
                newCase.status = 'New';
                caseList.add(newCase);
                status=2;
            }else if(status == 2){
                newCase.status = 'Working';
                caseList.add(newCase);
                status=3;
            }else if(status == 3){
                newCase.status = 'Escalated';
                caseList.add(newCase);
                status=4;
            }else{
                newCase.status = 'Closed';
                caseList.add(newCase);
                status=1;
            }
        }
        insert caseList;

    }

    /*// This method is more dynamic, but still critically flawed.
    // We are potentially getting many possible status, but we 
    // don't know that every status has an existing case to query.*/
    public void semidynamic(Integer numToMake){
        List<Case> caseList = [SELECT status FROM case];
        list<Case> insertList = new List<Case>();
        Set<String> statusValues = new Set<String>();

        for(Case c:caseList){
            statusValues.add(c.status);
        }

        List<String> statusList = new List<String>();
        statusList.addAll(statusValues);
        
        while(insertList.size()<numToMake){
            for(integer i = 0; i<statusList.size(); i++){
                if(insertList.size()<numToMake){
                    Case newCase = new Case(status = statusList[i], origin = 'Web');
                    insertList.add(newCase);
                }
            }
        }
        insert insertList;
    }

    // So how do we do this in a dynamic way?
    public void dynamic(Integer num){
        // We need a list to store our cases in.
        List<Case> caseList = new List<Case>();
        // We want to get the describe information, this contains information on
        // the field, which is a picklist.
        Schema.DescribeFieldResult fieldResult = case.status.getdescribe();
        /*// Now that we have the information about the field, let us get the
        // specific information we want, in this case the picklist values.
        // Note: Picklist values have a label and a value, so in this case
        // we need to store the information as a Schema.PicklistEntry
        // which will contain both the label and values.*/
        List<Schema.PicklistEntry> picklistValues = fieldResult.getPicklistValues();
        for(integer i = 0; i < num; i++){
            // Now we are going to loop through all of the values, and for 
            // each one insert a new case that has that value.
            for(Schema.PicklistEntry value : picklistValues){
                Case newCase = new Case();
                /*// Now we need to assign the value to the case we are making.
                // We cannot simply work directly with the Schema.PicklistEntry,
                // instead we use the getValue method to get the string value of
                // the picklist value. We could also use getLabel() to get the
                // label instead should we want it.*/
                newCase.status = value.getValue();
                newCase.Origin = 'Web';
                caseList.add(newCase);
            }
        }
        insert caseList;
    }

}
