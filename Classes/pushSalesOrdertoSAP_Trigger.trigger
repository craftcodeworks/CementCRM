trigger pushSalesOrdertoSAP_Trigger on Order_Header__c (after insert,after update) {
    Id idd=UserInfo.getUserId();
    String proid = [select id,profileid from user where id=:idd].profileid;
    String proname = [select id,name from profile where id=:proid].name;
    
    
    if(trigger.isinsert && trigger.isAfter){
        
        Order_Header__c ticket;
        System.debug('testt');
        
        for(Order_Header__c so: trigger.new){
            ticket = so;
            
            
            if(so.Distribution_Channel__c == 'Trade' && so.Type__c == 'Normal' ){
                Push_Sales_Order_Creation_to_SAP.createCustomer(so.id);
                
            }
            if(so.Distribution_Channel__c == 'Non Trade' && so.Policy_Price__c <= so.Agreed_Price__c  && so.Type__c == 'Normal' ){
                
                Push_Sales_Order_Creation_to_SAP.createCustomer(so.id);   
            }
            
       /*     if(so.Order_No_SAP__c !=NULL && so.Order_No_SAP__c !='' )
            {
                
                
                if(!System.isFuture() && !System.isBatch()){
                    Optimizer_OrderDetails.getOrder(so.Id);
                    
                }
                else{
                    
                    
                }
            }*/
            
            
        }
        
      
        
    }
    
    if(trigger.isupdate && proname != 'Integration User' && trigger.old!=trigger.new){
        
        boolean flag = false;
        Set<ID> Lins = new Set<ID>();
        for(Order_Header__c sc : Trigger.new){
            system.debug('testharjeet'+sc);
            system.debug('testharjeet'+sc.Agreed_Price__c);
            system.debug('testharjeet'+sc.Policy_Price__c);
            if( sc.SAP_Number__c ==false  &&  sc.Policy_Price__c > sc.Agreed_Price__c && sc.Status__c=='Approved' && sc.Order_Date__c == sc.Approved_Date__c && sc.Billing_Price__c!=0 ){
                Push_Sales_Order_Creation_to_SAP.createCustomer(sc.Id);
                
            }
          /*  if(sc.Distribution_Channel__c == 'Trade' && sc.Type__c == 'Normal'){
                if(System.isFuture() || System.isBatch()){
                    
                }
                else{
                Push_Sales_Order_Creation_to_SAP.createCustomer(sc.id);
                
                }}
            if(sc.Distribution_Channel__c == 'Non Trade' && sc.Policy_Price__c <= sc.Agreed_Price__c  && sc.Type__c == 'Normal'){
                if(System.isFuture() || System.isBatch()){
                    
                }
                else{
                Push_Sales_Order_Creation_to_SAP.createCustomer(sc.id);   
                }}
            
            */
            
            
            
            
            
            if(sc.Cancel__c == True && sc.Order_Cancellation_Reason__c != '' && sc.Order_Cancellation_Reason__c!= null)
            {
                
                
                if(System.isFuture() || System.isBatch()){
                    
                }
                else{
                    Lins.add(sc.Id);
                    Push_SalesOrder_Change_New_to_SAP.createCustomer(Lins);
                }
            }
            
            
            
       /*     if(sc.Type__c == 'Sales Return' && sc.Status__c=='Approved')
            {
                
                
                if(System.isFuture() || System.isBatch()){
                    
                }
                else{
                    
                    Push_SalesorderreturnCallLatest.createCustomer(sc.Id);
                }
            }
            
            ///////////////////////////////////////////////////////////////            
            if(sc.Type__c == 'Diversion Order' || (sc.Type__c == 'Diversion Return' && sc.Status__c=='Approved'))
            {
                
                
                if(System.isFuture() || System.isBatch()){
                    
                }
                else{
                    
                    Push_SalesorderDiversionSeptLat.createCustomer(sc.Id);
                }
            }*/
            
            
            ////////////////////// 
            
          /*  if(sc.Order_No_SAP__c != null  )
            {
                
               
                if(!System.isFuture() && !System.isBatch()){
                    Optimizer_OrderDetails.getOrder(sc.Id);    
                }
                
                
                    
                
                else{
                    
                    
                }
            }*/
            
        }
        
        
        flag = true;
        
        
        
    }}