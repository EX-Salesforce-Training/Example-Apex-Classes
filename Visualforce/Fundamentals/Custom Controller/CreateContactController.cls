public class CreateContactController {
    //public string fname {get;set;}
    //public string lname {get;set;}
    //public string phone {get;set;}
    //public string email {get;set;}
    public string updateText {get;set;}
    
    public Contact bob {get;set;}
    
    public CreateContactController() {
        bob = new Contact();
    }
    
    public void save() {
        //if(lname != null){
            //bob.FirstName = fname;
            //bob.LastName = lname;
            //bob.phone = phone;
            //bob.Email = email;
            insert bob;
            updateText = 'Contact saved!';
        //} else {
        //    updateText = 'Last Name Required';
        //}
    }

}
