// Triggers
// 
// Triggers act like stored procedures in databases. 
// They execute whenever a DML event takes place.
// We can use them to then execute relevant code 
// based on the context within which the trigger is 
// firing.
/* 
// Events:
// Insert - Whenever a new record is being saved to the database.
// Update - Whenever an existing record is being updated in the database.
// Delete - Whenever a record is being removed from the database.
// Undelete - Whenever a record is being restored from the recycle bin.
*/
/*
// Before - A before trigger operates on the context records before they 
// are saved to the database and may be manipulated and edited.
// After - An after trigger operates after the context records are saved 
// to the database and those records are now Read Only.
*/
/*
// Best Practices
// 
//  1: One Trigger per Object - We should only have a single trigger per salesforce object.
//  2: Logicless - We should keep business logic external to the trigger itself, and inside a handler class.
//  3: Bulkified - Triggers and handlers should always operate over multiple records.
//  4: Non-Recursive - A trigger and its handler(s) should not cause the same trigger to fire again.
*/
trigger ContactTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
	// 
    if(trigger.isBefore) {
        if(trigger.isInsert) {
            ContactTriggerHandler.ForInsertDuplicates(trigger.new);
        } else if(trigger.isUpdate) {
            
        } else if(trigger.isDelete) {
            
        }
        
    } else if(trigger.isAfter) {
        if(trigger.isInsert) {
            
        } else if(trigger.isUpdate) {
            
        } else if(trigger.isDelete) {
            
        } else if(trigger.isUndelete) {
            
        }
    } else {
        system.debug('Unknown Trigger Type');
    }
}
