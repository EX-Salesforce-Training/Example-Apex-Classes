@isTest
public class RestrictedUser {
    
	@isTest
    public Static Void runAsExample() {
        //We set up the user
        String uName = 'user' + Datetime.now().getTime() + '@harveyville.com';
        Profile p = [SELECT id 
                    FROM Profile
                    WHERE name='Standard User'];
        User u = new User(alias = 'testUser', email='testuser@harveyville.com',
                          emailencodingkey='UTF-8', lastname = 'Test', languagelocalekey='en_us',
                          timezonesidkey='america/new_york', localeSidKey='en_us', 
                          profileId=p.id, username=uName);

        System.RunAs(u) {
            System.debug(UserInfo.getUserName());
            System.debug(UserInfo.getProfileId());
            System.debug('We are running as if the above user.');
        }
    }
}
