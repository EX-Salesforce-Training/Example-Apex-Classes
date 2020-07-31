public class ContactListController {
    public List<Contact> contactList {get;set;}
    public string bob {get;set;}
    public ContactListcontroller() {
        contactList = [SELECT firstname, lastname, account.name FROM Contact];
    }
    
    public void WhatAboutBob() {
        system.debug(bob);
        bob = 'Robert Robertson';
    }
    
    public void save()	{
        update contactList;
    }
        
        
    
}
