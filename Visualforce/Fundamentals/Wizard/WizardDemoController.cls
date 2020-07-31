public class WizardDemoController {
    public string name {get;set;}
    public string email {get;set;}
    public string phone {get;set;}
    
    public pagereference page1_next(){
        return page.WizardDemo2;
    }
    public pagereference page2_next(){
        return page.WizardDemo3;
    }
    public pagereference page3_next(){
        return page.WizardDemo4;
    }
    public pagereference page2_previous(){
        return page.WizardDemo1;
    }
    public pagereference page3_previous(){
        return page.WizardDemo2;
    }
    public pagereference page4_previous(){
        return page.WizardDemo3;
    }
    public pagereference saveContact(){
        contact newContact = new Contact();
        newContact.lastname = name;
        newContact.email = email;
        newContact.phone = phone;
        insert newContact;
        return (new ApexPages.StandardController(newContact)).view();
    }
}
