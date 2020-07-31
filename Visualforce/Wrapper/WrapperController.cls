public class WrapperController{
    public list<AccountSelectWrapper> wrapperList {get;set;}
    
    public WrapperController(){
        wrapperList = new list<AccountSelectWrapper>();
        
        for(Account theAccount: [select id, name, billingstate from Account]){
            AccountSelectWrapper newWrapper = new AccountSelectWrapper();
            newWrapper.thisAccount = theAccount;
            newWrapper.selected = false;
            wrapperList.add(newWrapper);
        }
    }
    
    
    public void changeBillingStateToVA(){
        list<Account> accountsToUpdate = new List<Account>();
        
        for(AccountSelectWrapper thisWrapper: wrapperList){
            if(thisWrapper.selected){
                thisWrapper.selected = false;
                Account accountToUpdate = thisWrapper.thisAccount;
                accountToUpdate.billingstate = 'VA';
                accountsToUpdate.add(accountToUpdate);
            }
        }
        
        update accountsToUpdate;
    }

    public class AccountSelectWrapper{
        public Account thisAccount {get;set;}
        public Boolean selected {get;set;}
    }   
}
