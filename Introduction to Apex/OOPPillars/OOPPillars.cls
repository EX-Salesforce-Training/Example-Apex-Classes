// Class types
// 
// We can have Abstract, Final, and Virtual classes.
// Abstract classes can contain methods and variables
// to be inherited by a subclass, but cannot be
// instantiated
// Final classes cannot be extended or inherited from
// and is the default. We do not declare this with a 
// keyword
// Virtual classes can be extended or inherited from,
// as well as being able to be instantiated.
global abstract class OOPPillars {

    // Access Modifiers
    // 
    // Global: Accessible anywhere in the org.
    // Public: Accessible anywhere in the same namespace.
    // Protected: Accessible by class and subclasses.
    // Private: Accessible by class.
    global string globalVariable = 'Global';
    public string firstPillar = 'Encapsulation';
    public string secondPillar = 'Abstraction';
    public string thirdPillar = 'Inheritance';
    public string fourthPillar = 'Polymorhism';
    protected integer oneToOneHundred = 1;
    // Properties
    // 
    // Properties supply their own basic getters and setters
    // If we do not modify them, we call them Automatic Properties.
    // However, we can choose to modify the get and set 
    // methods should we wish to.
    private integer easyPeasy {get;set{easyPeasy = value;}}
    string currentPillar;
    
    
    // Constructor
    public OOPPillars() {
        // We make use of abstraction to hide the unneeded 
        // complexity of the following method.
		ModCurrentPillar(firstPillar);        
        system.debug(currentPillar);
        // Here we use abstraction to once again hide the 
        // unneeded complexity, this time using a utility 
        // or helper class.
        currentPillar = ModPillar.setCurrentPillar(secondPillar);
        system.debug(currentPillar);
    }
    
    // Getter
    // 'Gets' the value stored in a variable and returns it.
    public string getFirstPillar() {
		return firstPillar;        
    }
    // Setter
    // Sets the value of a variable.
    public void setFirstPillar(string s) {
        if(s == 'Encapsulation')
            firstPillar = s;
    }
    
    // Setter for oneToOneHundred
    public void setOneToOneHundred(integer i) {
        if(i > 0 && i < 101) {
            oneToOneHundred = i;
        }
    }
    
    public void ModCurrentPillar(string s) {
        currentPillar = s;
    }
    
}
