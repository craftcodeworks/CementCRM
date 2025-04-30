trigger PushOnboardingtoSAP_Triggernew on Account (after insert,after update) {
         if(trigger.isinsert){
 
    Account ticket;
    System.debug('testt');
 
    for(Account so: trigger.new){
        If(so.Onboarding__c== true && so.Status__c=='Approved'){
        ticket = so;
        //pushonboardingtoSAP.createCustomer(so.id);
         PushCustomerOnboardingMay.createCustomer(so.id);   
        system.debug('Order'+ticket);}
    }
    
       } 
    
   
    if(trigger.isupdate){
    set<id> salst=new set<id>();
    string accorg;
    string idacc;
    boolean flag = false;
    list<Account>llst = new list<Account>();    
  
    for(Account sc : Trigger.new){
         if(sc.nm__c==false && sc.Onboarding__c== true && sc.Status__c=='Approved' &&  trigger.old!=trigger.new)
        {
           
        idacc=sc.id;
        }
       }
    system.debug('hgg'+accorg);
if(idacc != null )
{
     flag = true;
    PushCustomerOnboardingMay.createCustomer(idacc);
    //pushonboardingtoSAP.createCustomer(idacc);
    // update idacc;
}
       
    }
    
    
  


}