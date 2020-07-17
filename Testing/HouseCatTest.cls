@isTest
public class HouseCatTest {
	
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
