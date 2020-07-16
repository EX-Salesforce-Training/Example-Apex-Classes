/* Abstract Class
// An abstract class can be extended, but not instantiated.
// Compare to: Final, Virtual.
// A final class, the default value, cannot be extended, 
// but can be instantiated.
// A virtual class can be both instantiated and extended.
*/
public abstract class Feline {
    
	string furType;
    string furColor;
    integer paws = 4;
    // Automatic property
    public integer hunger{get;set;}
    // static automatic property
    public static integer cats{get;set;}
    
    // Using a static initialization block to initialize 
    // static property.
    /*static {
        cats = 0;
    }
	*/
    // Virtual Method
    // Can be overriden.
    // Compare to: Final, Abstract.
    public virtual void MakeNoise() {
        system.debug('Roar');
    }
    // Final Method
    // Default
    // Final methods cannot be overriden.
    public void EatFood() {
        hunger++;
    }
    public void Move() {
        hunger--;
    }
    // Abstract Methods
    // Abstract methods do not contain a body, 
    // and must be implemented in the child.
    public abstract void Fall();
    
}
