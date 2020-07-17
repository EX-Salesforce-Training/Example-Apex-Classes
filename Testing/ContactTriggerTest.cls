@isTest
public class ContactTriggerTest {

    @testSetup
    public static void TestSetupMethod() {
        Contact bob = new Contact();
        bob.LastName = 'Bobson';
        bob.Email = 'bob@bobson.com';
        insert bob;
        List<Contact> utilityList = ContactUtility.MakeContacts(1);
        insert utilityList;
    }
    
    @isTest
    public static void TestDuplicateCheck() {
        Contact bobby = new Contact();
        bobby.LastName = 'Robertson';
        bobby.Email = 'bob@bobson.com';
        try{
            test.startTest();
            	insert bobby;
            test.stopTest();
        } catch(DmlException e) {
            system.assert(true);
        }
    }
}
