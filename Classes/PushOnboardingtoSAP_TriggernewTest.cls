@istest
public class PushOnboardingtoSAP_TriggernewTest {
 @istest
    public static void doset1(){
         APIDetail__c setting2 = new APIDetail__c(Name='SapDetails',End_Point__c = 'https://sclwd.mehtagroup.com:8003');
                     insert setting2;
        
        Account accobj = new Account();
        accobj.name = 'test';
        accobj.Enterprise__c='Both';
        accobj.Exclusive__c=True;
        accobj.Onboarding__c = true;
        accobj.Status__c='Approved';
        
        insert accobj;
        Account accobj1 = new Account();
        accobj1.name = 'Nidhi';
        accobj1.Enterprise__c='Both';
        accobj1.Exclusive__c=false;
        insert accobj1;
        
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('mockservice');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json');
        Test.setMock(HttpCalloutMock.class, mock);
       
         Test.startTest();
            Test.setMock(WebServiceMock.class, new pushonboardingtoSAPwebservicemockImpl()); 
        
            Test.setMock(WebServiceMock.class, new pushonboardingtoSAPwebservicemockImpl()); 
        PushCustomerOnboardingMay.createCustomer(accobj.id);
        
        
        
        
        
        
    }
}