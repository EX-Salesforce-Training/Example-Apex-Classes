/*///////////////////////////////////////////////////////////////
//
// Name: ApexEmailServiceDemo
// Author: Harvey Hill, Salesforce Team
// Description: Example for use of the messaging interface
// 	to handle incoming email.
//
///////////////////////////////////////////////////////////////
// All official examples use global, though I wasn't able to find any official documentation 
// stating it must be, I am assuming that to be the case.*/
global inherited sharing class ApexEmailServices implements Messaging.InboundEmailHandler{

    /*// Messaging.InbounEmail contains information related to the email body, subject, and attachments.ApexPages. 
    // Messaging.InboundEnvelope contains information regarding the envelope, such as the from address, and to address. */
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,
    Messaging.InboundEnvelope envelope) {
        
        // Storing the result of our action. 
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();

        // What we will check for in order to perform an action.
		String subjectContact = 'Create Contact';

        // If the subject, ignoring case sensitivity, is 'Create Contact', then do this.
		if(email.subject.equalsIgnoreCase(subjectContact))
		{
            // Create a new contact from the email body, in this case using it as the last name. 
			Contact c = new Contact();
			c.LastName = email.plainTextBody;
			insert c;

            /*// Save text attachments, if any. 
            // Text attachments are of any MIME type. 
        	for (Messaging.Inboundemail.TextAttachment textAttachment : email.textAttachments) {
          	Attachment attachment = new Attachment();

          	attachment.Name = textAttachment.fileName;
          	attachment.Body = Blob.valueOf(textAttachment.body);
          	attachment.ParentId = c.Id;
          	insert attachment;
        	}

        	// Save binary attachments, if any. 
            // Binary attachments can be pictures, videos, etc, but must be under 5mb in size. 
        	for (Messaging.Inboundemail.BinaryAttachment binaryAttachment : email.binaryAttachments) {
          	Attachment attachment = new Attachment();

          	attachment.Name = binaryAttachment.fileName;
          	attachment.Body = binaryAttachment.body;
          	attachment.ParentId = c.Id;
          	insert attachment;
        	}*/
		}
    // having completed the action, set to success and return. 
	result.success = true;
    return result;
    }
}
