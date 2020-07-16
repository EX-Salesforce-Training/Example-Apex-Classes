// Inheritance
// 
// Here I am extending the abstract class of Feline, and 
// inheriting from it. I then also implement the interface
// of Predator.
public class HouseCat extends Feline implements Predator {
	string petName;
    integer petAge;
    // Constructor Overloading
    // 
    // I have multiple constructors that use different
    // Signatures, Apex knows which I am calling based upon
    // the arguments I pass when I initialize the class. 
    public HouseCat() {
		// Inherited property from Feline.
        hunger = 5;
        // Updating a static property.
        Feline.cats++;
        // Referencing a static property.
        system.debug(Feline.cats);
    }
    public HouseCat(string name) {
        // Constructor Chaining
        // 
        // We use This() syntax to call another constructor.
        // The constructor called is based on the arguments 
        // passed. It will call the constructor with the
        // matching Signature.
        this();
        petName = name;
    }
    public HouseCat(string name, integer age) {
        // Constructor chaining.
		this(name);
        // We can also use this.value to reference a value
        // within the class itself.
        this.petAge = age;
    }
    // Method Overriding
    // 
    // Here we override the virtual method from the Feline 
    // superclass with our own implementation.
    // Overriding is when we effectively replace an inherited
    // behavior with an implementation of our own.
    public override void MakeNoise() {
        // The Super keyword can be used to call the superclass
        // method. Here we use it to call the implementation in
        // the superclass from within our overriden version. 
        super.MakeNoise();
        system.debug('Meow');
    }
    // Method Overloading
    // 
    // Here we are overloading the MakeNoise method, just like 
    // how we overloaded our constructors.
    // We use the same method name, but provide different
    // Signatures. 
    public void MakeNoise(string noise) {
        system.debug(noise);
    }
    // Class Abstract Method Implementation
    // Here we provide the implementation for the abstract 
    // method of Fall from the super class.
    // Note: We need to use the override keyword here.
    public override void Fall() {
        if(hunger > 5) {
            system.debug('The cat falls gracefully.');
        } else {
            system.debug('The cat is malnourished and falls');
        }
    }
    // Interface Abstract Method Implementation
    // 
    // Here we are implementing the abstract methods from
    // the Predator interface. 
    // Note: We do not use the override keyword here.
    public void DigestMeat(){
        // Here we call a method inherited from the superclass.
        EatFood();
        system.debug(hunger);
        // Here we call a method inherited from the superclass.
        Move();
        system.debug(hunger);
        hunger++;
        system.debug(hunger);
    }
    
    public void StalkPrey() {
        // Here we call a method inherited from the superclass.
        Move();
    }
    
    // Inner classes
    // 
    // Inner classes allow us to declare classes within
    // our top level class. we can only go one level
    // deep, this our inner class cannot contain a 
    // inner class of its own.
    public class Mouse {
        
    }
}
