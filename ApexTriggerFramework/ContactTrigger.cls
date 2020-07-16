/*
// Triggers
// 
// Triggers act like stored procedures in databases. 
// They execute whenever a DML event takes place.
// We can use them to then execute relevant code 
// based on the context within which the trigger is 
// firing.
*/ 
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
/*
// Contect Variables
// 
// Context variables are variables that exist within 
// triggers and contain the details relates to the 
// context in which the trigger was fired.
// 
// isExecuting - Returns true if the current context for the Apex code is a 
// trigger, not a Visualforce page, a Web service, or an executeanonymous() API call.
// 
// isInsert - Returns true if this trigger was fired due to an insert operation, 
// from the Salesforce user interface, Apex, or the API.
// 
// isUpdate - Returns true if this trigger was fired due to an update operation, 
// from the Salesforce user interface, Apex, or the API.
// 
// isDelete - Returns true if this trigger was fired due to a delete operation, 
// from the Salesforce user interface, Apex, or the API.
// 
// isBefore - Returns true if this trigger was fired before any record was saved.
// 
// isAfter - Returns true if this trigger was fired after all records were saved.
// 
// isUndelete - Returns true if this trigger was fired after a record 
// is recovered from the Recycle Bin. This recovery can occur after an 
// undelete operation from the Salesforce user interface, Apex, or the API.
// 
// new - Returns a list of the new versions of the sObject records. 
// This sObject list is only available in insert, update, and undelete 
// triggers, and the records can only be modified in before triggers.
// 
// newMap - A map of IDs to the new versions of the sObject records.
// This map is only available in before update, after insert, after update, 
// and after undelete triggers.
// 
// old - Returns a list of the old versions of the sObject records.
// This sObject list is only available in update and delete triggers.
//
// oldMap - A map of IDs to the old versions of the sObject records.
// This map is only available in update and delete triggers.
//
// operationType - Returns an enum of type System.TriggerOperation 
// corresponding to the current operation.
// Possible values of the System.TriggerOperation enum are: 
// 		BEFORE_INSERT, 
// 		BEFORE_UPDATE, 
// 		BEFORE_DELETE,
// 		AFTER_INSERT, 
// 		AFTER_UPDATE, 
// 		AFTER_DELETE,  
// 		AFTER_UNDELETE. 
// If you vary your programming logic based on different trigger types, 
// consider using the switch statement with different permutations of 
// unique trigger execution enum states.
//
// size - The total number of records in a trigger invocation, both old and new.
*/
trigger ContactTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
	// We check to determine the context in which we are operating my checking our context variable.
	// isBefore is a boolean that tells us if we are before the record is saved.
    if(trigger.isBefore) {
        // isInsert tells us if the triggering action was caused by a new record being inserted.
        if(trigger.isInsert) {
            // We call our handler and pass it the trigger.new. New is a list of the triggering records.
            ContactTriggerHandler.ForInsertDuplicates(trigger.new);
        // isUpdate tells us if the triggering action was caused by updating existing records.
        } else if(trigger.isUpdate) {
        // isDelete tells us if the triggering action was caused by deleting existing records.    
        } else if(trigger.isDelete) {
            
        }
    // isAfter is a boolean that tells us if we are after the record is saved.    
    } else if(trigger.isAfter) {
        if(trigger.isInsert) {
            
        } else if(trigger.isUpdate) {
            
        } else if(trigger.isDelete) {
        // isUndelete tells us if the triggering action was caused by restoring a deleted record.    
        } else if(trigger.isUndelete) {
            
        }
    } else {
        system.debug('Unknown Trigger Type');
    }
}
