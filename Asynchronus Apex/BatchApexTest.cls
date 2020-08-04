///////////////////////////////////////////////////////////////
//
// Name: ApexBatchClassDemoTest
// Author: Ben Learn, Salesforce Team
// Description: Test class for example for use of the batchable interface
// 	and asynchonous apex.
//
///////////////////////////////////////////////////////////////
@isTest
private class BatchApexTest {
	@isTest
    static void testAccBatch(){
        // when we test batch Apex, we can perform at most one call to the batch class execute() method
        // so we'll create 200 test records and stick with the default batch size
        List<Account> testAccs = new List<Account>();
        for(Integer i = 0; i < 200; i++){
            testAccs.add(new Account(Name='Test ' + i));
        }
        insert testAccs;
        
        // any asynchronous calls made after Test.startTest() and before Test.stopTest() will be executed 
        // synchronously once we arrive at Test.stopTest()
        Test.startTest();
        
        // to execute our batch process, we simply instantiate it and call the Database.executeBatch() method
        // this method takes the instance of our batch class as a parameter
        // it can also optionally take a second parameter indicating the batch size
        //      the default for this value is 200 records, but we can have batches as large as 2,000 records and
        //      batches as small as one record
        BatchApex abcd = new Batchapex();
        Database.executeBatch(abcd);
        Test.stopTest();
        
        // assert that all accounts have been updated with the suffix 'Batch'
        Integer numMatching = [SELECT COUNT() FROM Account WHERE Name LIKE '%Batch'];
        System.assertEquals(200, numMatching);
        
    }
}
