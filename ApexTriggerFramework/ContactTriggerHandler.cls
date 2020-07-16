// Trigger Handlers
// 
// Trigger handlers are apex classes intended to contain the business logic
// of our triggers. This allows triggers to remain 'Logicless' in order to 
// make them easier to understand, debug, and maintain.
public class ContactTriggerHandler {

    public static List<Contact> ForInsertDuplicates(List<Contact> newContacts) {
        // Step 1 - We extract the email from new contacts and store it in a set.
        // This will give us a collection of unique emails.
        
        // Declare our set collection.
        Set<String> newEmailSet = new Set<String>();
        // We loop through our trigger context records we called newContacts.
        for(Contact c: newContacts) {
            // Check to make sure the email isn't null.
            if(c.Email != null) {
                // Add the email to the set.
                newEmailSet.add(c.email);
            }
        }
		// Step 2 - We find duplicate contacts in the database based on the email set. 
		// We store these in a map using the email as the key, and the contact as the 
		// value.       
		
		// Declare our map collection.
        Map<String, Contact> existingContactMap = new Map<String, Contact>();
        // Find the duplicates using a SOQL Loop.
        for(contact existingContact: [SELECT id, name, email FROM contact WHERE email in :newEmailSet]) {
            // put the duplicates in the map.
            existingContactMap.put(existingContact.email, existingContact);
        }
		// Step 3 - Compare and addError if it is a duplicate.
		
        // We cycle through newContacts, our trigger context.
        for(contact newContact: newContacts) {
            // We attempt to store a contact using the email of the new contact.
            contact duplicateContact = existingContactMap.get(newContact.email);
            // If we successfully found a value in our map.
            if(duplicateContact != null) {
                // Add an error to it as a duplicate to prevent its insertion.
                newContact.addError('Email already exists in system. ' + duplicateContact.Name);
            }
        }
        
        return newcontacts;
    }
}
