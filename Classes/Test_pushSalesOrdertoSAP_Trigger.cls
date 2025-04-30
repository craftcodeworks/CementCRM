@isTest
private class Test_pushSalesOrdertoSAP_Trigger {
    static testMethod void testTrigger() {
        // Create test data
        APIDetail__c setting2 = new APIDetail__c(Name='SapDetails',End_Point__c = 'https://sclwd.mehtagroup.com:8003');
                     insert setting2;
        Profile p = [SELECT Id FROM Profile LIMIT 1];
        User u = new User(ProfileId = p.Id, Username = 'testuser1223444@example.com', Email = 'testuser1223444@example.com',
                          Alias = 'tuser', EmailEncodingKey = 'UTF-8', LastName = 'Testing',
                          LanguageLocaleKey = 'en_US', Designation__c='CMO Accounts',LocaleSidKey = 'en_US', TimeZoneSidKey = 'America/Los_Angeles');
        insert u;

        Order_Header__c order = new Order_Header__c(Distribution_Channel__c = 'Trade', Type__c = 'Normal', Manual_calling_Order__c = false,Credit_Approved__c=true,Order_Credit_Status__c='B',Policy_Price__c=100,Agreed_Price__c=200,Billing_Price__c=100);
        insert order;

        
        Test.startTest();
        
        order.Status__c = 'Approved';
        order.Agreed_Price__c = 100;
        order.Policy_Price__c = 90;
        update order;
        Test.stopTest();

        
        Order_Header__c updatedOrder = [SELECT Id, SAP_Number__c FROM Order_Header__c WHERE Id = :order.Id];
        System.assertEquals(true, updatedOrder.SAP_Number__c);
    }
}