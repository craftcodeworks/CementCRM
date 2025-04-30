@istest
public class pushSalesOrdertoSAP_TriggerTest {

  @istest
    public static void doset(){
        APIDetail__c setting2 = new APIDetail__c(Name='SapDetails',End_Point__c = 'https://sclwd.mehtagroup.com:8003');
                     insert setting2;
        
        
        Order_Header__c obj1 =  new Order_Header__c();
        obj1.SFA_Order_ID__c = '3200000182';
        obj1.Distribution_Channel__c='Trade';
        obj1.Type__c = 'Normal';
        insert obj1;
        
        Order_Header__c obj =  new Order_Header__c();
        obj.SFA_Order_ID__c = '3200000182';
        obj.Distribution_Channel__c ='Non Trade';
        obj.Type__c = 'Normal';
        obj.Policy_Price__c = 100;
         obj.Agreed_Price__c = 200;
        obj.Billing_Price__c = 100;
        insert obj;
        
        Delivery_Schedule__c ddobj = new Delivery_Schedule__c();
        ddobj.Order_Id__c = obj.Id;
        ddobj.Order_Id__c = obj1.Id;
        insert ddobj;
        
        Test.setMock(WebServiceMock.class, new Push_Sales_Order_Creation_to_SAPmockImpl()); 

        Push_Sales_Order_Creation_to_SAP pushobj = new Push_Sales_Order_Creation_to_SAP();
        Push_Sales_Order_Creation_to_SAP.createCustomer(obj.id);
            
            
        
        
    }    

}