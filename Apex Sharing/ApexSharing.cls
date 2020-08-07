public class ApexSharing {
    // Every object has a related share object, these are made automatically 
    // by salesforce whenever an object is made, or comes out of the box for 
    // standard objects. 
    
    public static void NewShare(Id recordID, id userOrGroupID) {
        // Standard objects are named ObjectShare
        AccountShare BobSharing = new AccountShare();
        // custom objects are the same, but with double underscores between
        // the object name and share. Similar to how our api names have 
        // __c.
        Mail__Share mailSharing = new Mail__Share();
        
        // Each share object has at least four fields
        // ParentID - This is the record we are creating a share record for.
        // 			  This establishes what we are sharing.
        // Note: All custom objects refer to this as ParentId. However,
        //       some standard objects, like AccountShare, will have 
        //       different fields or names. Be sure to use the console to
        //       check the fields on the object.
        bobSharing.AccountId = recordID;
        // This refers to who we are deciding to share the above record with.
        bobSharing.UserOrGroupId = userOrGroupID;
        // Access level to the desired record. 
        // Values include: Read
        // 				   Edit
        // 				   All (Cannot be assigned to a share, this is the owner's value)
        bobSharing.AccountAccessLevel = 'Read';
        // Rowcause, ort reason for sharing the record. Typically we will use manual
        // but could also choose to create custom causes, with the caveat that this
        // requires us to be more careful with when it is used and should have a method
        // created to remove this access as well.
        bobSharing.RowCause = Schema.AccountShare.RowCause.Manual;
        
    }
    
}
