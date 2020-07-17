@isTest
public class ContactUtility {
    
    public static List<Contact> MakeContacts(integer numberOfContacts) {
        List<Contact> newContacts = new List<Contact>();
        for(integer i = 0; i < numberOfContacts; i++) {
            Contact newCon = new Contact();
            newCon.lastname = 'testcon'+i;
        }
        return newContacts;
    }

}
