// Interfaces
// 
// We declare our interface here, using the interface keyword instead of class.
public interface Predator {
    // We provide the signatures of abstract methods 
    // to be implemented by classes implementing this 
    // interface.
    // Note: We do not use the abstract keyword 
    // inside an interface.
    void DigestMeat();
    
    void StalkPrey();
}
