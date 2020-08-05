////////////////////////////////////////////////////////////////
//
// Name: DynamicSOQLSOSL
// Author: Harvey Hill, Salesforce Team
// Date: 8/4/2020
// Description: Example uses of dynamic soql and sosl.
//
////////////////////////////////////////////////////////////////
public class DynamicSOQLSOSL {
    string soqlString {get;set;}
    string soslString {get;set;}
    public static string newQuery {get;set;}
    public string query {get;set;}
    public boolean name {get;set;}
    public boolean annualRevenue {get;set;}
    public boolean nameFields {get;set;}
    public boolean returnAccounts {get;set;}
    public boolean returnContacts {get;set;}
    
    public static void contactQuery(boolean phone, boolean email) {
        system.debug(phone +' ' + email);
        newQuery = 'SELECT firstname, lastname';
        system.debug(newQuery);
        if(phone == true && email == true) {
            newQuery += ', phone, email';
            system.debug(newQuery);
        } else if(phone == true) {
            newQuery += ', phone';
            system.debug(newQuery);
        } else if(email == true) {
            newQuery += ', email'; 
            system.debug(newQuery);
        }
        newQuery += ' FROM Contact';
        system.debug(newQuery);
        List<Contact> contactList = database.query(newQuery);
        system.debug(contactList);
        
    } 
    
    
    public void constructAQuery() {
        /*// Dynamic SOQL Query
        // So we can dynamically generate a query by doing the following:*/
    	soqlString = 'SELECT name, id, annualrevenue FROM Account WHERE Account.name = ' + '\''+query+'\'';
		List<Account> bobsAccount = [SELECT name, id, annualrevenue FROM Account WHERE Account.name = 'Bob'];
        id bobsId = [SELECT name, id, annualrevenue FROM Account WHERE Account.name = :query LIMIT 1].id;
        /*// This could also simply be done using :query in a regular soql query though.
        // Instead, we could construct it with a few more options.
        // 
        // We initialize it with a default, choosing to always return the id.*/
        soqlString = 'SELECT id';
        /*// We check to see if we want*/ 
        if(name == true)
            soqlString += ', name';
        if(annualRevenue == true)
            soqlString += ', annualRevenue';
        soqlString += 'FROM Account WHERE Account.name = ' + '\''+query+'\'';
        /*// Now we can choose at the time of execution which fields we will return.
        // 
        // Dynamic SOSL query
        // Likewise we can do the same thing here and construct a string we will pass into our query methods.*/
        /*soslString = 'FIND ' + '\''+query+'\'';
        if(nameFields == true)
            soslString += ' IN Name Fields';
        if(returnAccounts == true && returnContacts == true) {
            soslString += ' RETURNING Account(name, FORMAT(annualrevenue)), Contact(name, mailingState)';
        } else if(returnAccounts == true) {
            soslString += ' RETURNING Account(name, FORMAT(annualrevenue))';
        } else if(returnContacts == true) {
            soslString += ' RETURNING Contact(name, mailingState)';
        }*/
    }
    
    public void DynamicSOQL() {
        // execute the query we constructed above
        List<Account> soqlResult = database.query(soqlString);
    }
    
    public void DynamicSOSL() {
        // execute the query we constructed above
        List<List<SObject>> soslResult = search.query(soslString);
    }
}
