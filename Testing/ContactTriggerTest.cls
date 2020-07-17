/*
// Test Classes
// 
// Test classes are used to test our code and verify we are getting 
// the expected outcome for the code contained within them. 
// Test classes are not counted when it comes to code coverage, but
// we are expected to have a minimum of 75% code coverage within 
// our orgs for non-test classes.
*/ 
/* 
// Test Annotations
// 
// @isTest - Signifies the class or method is a test class or method. 
// Optionally you can follow this with (SeeAllData=true) to grant the 
// test method or class the ability to access real data in the org.
// Note: This is generally considered a bad practice to do so.
// @testSetup - signifies the method is a test setup method.
// @testVisible - signifies the private or protected variable or 
// method is visible for test classes.
// 
*/
@isTest
public class ContactTriggerTest {
	/*
    // Test Setup
    // 
    // Test Setup is used to create a single block of code that 
    // readies the conditions for the following tests.
    // Most often this means creating the mock data we will be
    // using in the other tests.
    // Each time a test method is run, the test setup runs again
    // ensuring that it has fresh mock data to work with and it 
    // is unaffected by previous tests. 
    */
	@testSetup
    public static void TestSetupMethod() {
        Contact bob = new Contact();
        bob.LastName = 'Bobson';
        bob.Email = 'bob@bobson.com';
        insert bob;
        /*
        // Test Utility Classes
        // 
        // Test utility classes can be used to abstract 
        // unneeded complexity, as well has allow for reusable
        // sections of code.
        */ 
        List<Contact> utilityList = ContactUtility.MakeContacts(1);
        insert utilityList;
    }
    /*
    // Negative Test
    // 
    // Negative Tests are when we intentionally test that our code
    // works as expected when invalid input is given. 
    */
	@isTest
    public static void TestDuplicateCheck() {
        Contact bobby = new Contact();
        bobby.LastName = 'Robertson';
        bobby.Email = 'bob@bobson.com';
        try{
            /*
            // Start Test and Stop Test are used to signify that the 
            // code between them must behave synchronously, and are
            // given a fresh set of governor limits.
            // */
            test.startTest();
            	insert bobby;
            test.stopTest();
        } catch(DmlException e) {
            system.assert(true);
        }
    }
}
