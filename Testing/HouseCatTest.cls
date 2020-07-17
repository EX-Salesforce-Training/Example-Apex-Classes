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
/*
// Testing Best Practices
//
// Test Single - test if it works in a single instance.
// Test Bulk - Test if it works over mutiple iterations.
// Test positive - Does it behave as expected when given expected parameters.
// Test Negative - Does it behave as expected when given unexpected parameters.
// Test Restricted User - Can a user gain access to data they are not supposed to be able to access.
*/
@isTest
public class HouseCatTest {
	/*
    // Positive Test
    // 
    // We are given it expected input and getting 
    // the correct expected outcome.
    */ 
    @isTest
    public static void TestHouseCatConstructor() {
        HouseCat spot = new HouseCat('spot', 3);
        system.assertEquals('spot', spot.petName);
        system.assertEquals(3, spot.petAge);
    }
    @isTest
    public static void TestDigestMeat() {
        HouseCat tabby = new HouseCat();
        integer hunger = tabby.hunger;
        system.debug(tabby.hunger);
        tabby.DigestMeat();
        system.assertEquals(hunger+1, tabby.hunger);
    }
    @isTest
    public static void TestMakeNoise() {
        HouseCat tabby = new HouseCat();
        HouseCat spot = new HouseCat();
        integer hungerTabby = tabby.hunger;
        integer hungerSpot = spot.hunger;
		tabby.MakeNoise();
        system.assert(tabby.noiseCheck);
        spot.MakeNoise('Hiss');
        system.assert(spot.noiseCheck);
    }
    @isTest
    public static void TestFall() {
        HouseCat spot = new HouseCat();
        spot.Fall();
        system.assert(spot.fallCheck);
    }
    @isTest
    public static void TestStalkPrey() {
        HouseCat spot = new HouseCat();
        integer hunger = spot.hunger;
        spot.StalkPrey();
        system.assertEquals(hunger-1, spot.hunger);
    }
}
