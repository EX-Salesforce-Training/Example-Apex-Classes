/*// Classes can be defined as with, without, and inherited sharing.
// Classes default to without sharing, and operate in system
// context.
//
// 'with sharing' declares the class will enforce record level
// security. This means it is operating in user context.
//
// 'without sharing' declares a class to not enforce record level
// sharing rules. this means it is operating in system context.
//
// 'inherited sharing' declares a class will inherit the sharing 
// rules of the class that called it. If it was not called by 
// another class, it defaults to 'with sharing'*/
public inherited sharing class ApexSecurity {
    /*// While the above keywords enforce record level security, they do not 
    // enforce field or object level security.
    // Thankfully we have other tools for this, such as the WITH SECURITY_ENFORCED clause.
    //
    // Using this clause, if the object or field is not accessible by the user it
    // will throw an error indicating insufficient permissions.*/
    List<Account> accountList = [SELECT Id, Name, AnnualRevenue FROM Account WITH SECURITY_ENFORCED];

    public void stripInaccessableMethod(){
        /*// We can also use the Security classes StripInaccessible method.
        // This strips any fields from the results the user lacks access to.*/
        SObjectAccessDecision securityDecision = Security.stripInaccessible(AccessType.READABLE, [SELECT Id, Name, AnnualRevenue FROM Account]);
        system.debug(securityDecision);
        /*// We can check CREATABLE, DELETABLE, and UPDATABLE too!*/
        List<Contact> bob = new List<Contact>();
        bob.add(new Contact(lastname='Smith', firstname='Bob'));
        /*// Imagine in this case the above contact is submitted, but the user doesn't have access to
        // firstname.*/
        SObjectAccessDecision securityDecisionTwo = Security.stripInaccessible(AccessType.CREATABLE, bob);
        /*// The new contact can be created, but the first name is stripped from the insert since the 
        // user doesn't have access to it.*/
        insert securityDecisionTwo.getRecords();
    }

    public void schemaClassExamples(){
        /*// We can also check if a user has specific access using the schema class.
        
        // In this example we see if they have access to the account object
        // before we query it.*/
        if(Schema.SObjectType.Case.isAccessible()){
            List<Case> caseList = [SELECT subject FROM case];
        }
        // We can also check for fields.
        if(Schema.SObjectType.Case.fields.status.isUpdateable()){
            // Logic here.
        }
    } 

}
