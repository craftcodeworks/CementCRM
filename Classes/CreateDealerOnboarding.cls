@RestResource(urlMapping='/CreateDealerOnboarding/')
global class CreateDealerOnboarding {
    
    global class Response {    
        global string id;
        global string code;
        global string message;
    }
    
    @HttpPost 
    global static Response doPost(){
        
        List<String> item= new List<String>();
        Response response = new Response();
        
        restrequest req = RestContext.request;
       // List<user> u= [select id from user where name  like '%Administrator%' limit 1];
        onBoardWrpr onBrdWrppr = parse(req.requestBody.toString());
        
        //Dealer_On_boarding__c onBoard = new Dealer_On_boarding__c();
        Account onBoard = new Account();
        
        onBoard.Bank_Account_Holder_Name__c=onBrdWrppr.BankAccountHolderName;
        onBoard.Bank_Account_No__c =onBrdWrppr.BankAccountNo;    
        onBoard.Bank_IFSC_Code__c =onBrdWrppr.BankIFSCCode;  
        onBoard.Name_of_Bank1__c=onBrdWrppr.Nameofbank1;
        onBoard.Name_of_Bank2__c=onBrdWrppr.Nameofbank2;
        onBoard.Name_of_Bank3__c=onBrdWrppr.Nameofbank3;
        onBoard.Name_of_Bank__c =onBrdWrppr.Nameofbank;
        onBoard.Bank_IFSC_Code1__c =onBrdWrppr.IFSCBank1;
        onBoard.Bank_IFSC_Code2__c =onBrdWrppr.IFSCBank2;
        onBoard.Bank_IFSC_Code3__c =onBrdWrppr.IFSCBank3;
        onBoard.Bank_Address__c =onBrdWrppr.BankAddress;
        onBoard.Bank_Address1__c =onBrdWrppr.BankAddress1;
        onBoard.Bank_Address2__c=onBrdWrppr.BankAddress2;
        onBoard.Bank_Address3__c=onBrdWrppr.BankAddress3;
        onBoard.Bank_Account_No_1__c =onBrdWrppr.BankAcc1;
        onBoard.Bank_Account_No_2__c=onBrdWrppr.BankAcc2;
        onBoard.Bank_Account_No_3__c=onBrdWrppr.BankAcc3;
        if(onBrdWrppr.limitany1 != null && onBrdWrppr.limitany1 !=''){
        onBoard.Limit_If_Any_Obtained__c =Decimal.valueof(onBrdWrppr.limitany1);}
        if(onBrdWrppr.limitany2 !=null && onBrdWrppr.limitany2 !=''){
            onBoard.Limit_If_Any_Obtained1__c =Decimal.valueof(onBrdWrppr.limitany2);}
            if(onBrdWrppr.limitany3 !=null && onBrdWrppr.limitany3 !=''){
                onBoard.Limit_If_Any_Obtained2__c =Decimal.valueof(onBrdWrppr.limitany3);}
                if(onBrdWrppr.limitany4 !=null && onBrdWrppr.limitany4 !='') {
                    onBoard.Limit_If_Any_Obtained3__c =Decimal.valueof(onBrdWrppr.limitany4);}
                
        onBoard.Bank_Account_Holder_Name1__c   =onBrdWrppr.BankAccountHolderName1;
        onBoard.Bank_Account_Holder_Name2__c   =onBrdWrppr.BankAccountHolderName2;
        onBoard.Bank_Account_Holder_Name3__c   =onBrdWrppr.BankAccountHolderName3;
        onBoard.Legal_Name__c       =onBrdWrppr.LegalName;
        if(onBrdWrppr.ParentCode != null && onBrdWrppr.ParentCode !=''){
            onBoard.Parentid      =onBrdWrppr.ParentCode;}
        if(onBrdWrppr.TPCA != null && onBrdWrppr.TPCA !=''){
            onBoard.TPCA_MO_ID__c       =onBrdWrppr.TPCA;}
        onBoard.Distribution_Channel__c       =onBrdWrppr.DistributionChannel;
        onboard.Distributor_Channel__c = onBrdWrppr.DistributionChannel;
        if(onBrdWrppr.DistributionChannel=='Trade'){
           onBoard.Segment__c  ='10'; 
        } else
        {
            onBoard.Segment__c  ='20'; 
            
        }
         
        onBoard.Customer_Category_1__c =onBrdWrppr.CustomerCategory;
        onBoard.Enterprise__c  =onBrdWrppr.Enterprise;
        if(onBrdWrppr.Enterprise=='BOTH')
        {
            onBoard.SCL__c=true;
            onBoard.GSCL__c=true;
        }
       if(onBrdWrppr.Enterprise=='SCL')
       {
           onBoard.SCL__c=true;
       }
          if(onBrdWrppr.Enterprise=='GSCL')
       {
           onBoard.GSCL__c=true;
       }
        if(onBrdWrppr.Brand != null && onBrdWrppr.Brand != '')
        onBoard.Brand__c  =onBrdWrppr.Brand;
        if(onBrdWrppr.User != null && onBrdWrppr.User!= '')
        onBoard.ownerid       =onBrdWrppr.User;
       if(onBrdWrppr.GSTSt != null && onBrdWrppr.GSTSt !=''){
           onBoard.GST_Number_State__c       =onBrdWrppr.GSTSt;}
        onBoard.Address1__c       =onBrdWrppr.BillingStreet1;
        onBoard.Address2__c       =onBrdWrppr.BillingStreet2;
        onBoard.Address3__c       =onBrdWrppr.BillingStreet3;
        if(onBrdWrppr.City != null && onBrdWrppr.City != ''){
            onBoard.City_Lookup__c =onBrdWrppr.City;}
        if(onBrdWrppr.District != null && onBrdWrppr.District != ''){
            onBoard.District_Code__c =onBrdWrppr.District;}
        
        if(onBrdWrppr.Taluka!=null && onBrdWrppr.Taluka!='')
        {onBoard.Taluka_Code__c    =onBrdWrppr.Taluka;}
        
        if(onBrdWrppr.Region!=null && onBrdWrppr.Region!=''){
            onBoard.Region__c    =onBrdWrppr.Region;}
        
        if(onBrdWrppr.Zone!=null && onBrdWrppr.Zone!=''){
            onBoard.Zone__c    =onBrdWrppr.Zone;}
        if(onBrdWrppr.State!=null && onBrdWrppr.State!=''){
            onBoard.State_Code__c    =onBrdWrppr.State;}
        if(onBrdWrppr.Country !=null && onBrdWrppr.Country!=''){
            onBoard.Country__c    =onBrdWrppr.Country;}
        onBoard.Email__c    =onBrdWrppr.Email;
        onBoard.Contact_Person__c    =onBrdWrppr.ContactPersonName;
        onBoard.Dealer_Contact_Number__c    =onBrdWrppr.Mobile;
        onBoard.Alternative_Mobile__c    =onBrdWrppr.AlternativeMobile;
          if(onBrdWrppr.DDNumScl != null && onBrdWrppr.DDNumScl !=''){
              onBoard.D_D_No_Instrument_No__c  =onBrdWrppr.DDNumScl;}
         onBoard.D_D_No_Instrument_No_GSCL__c  =onBrdWrppr.DDNumGscl;
        onBoard.Form_of_Organization__c  =onBrdWrppr.FormOfOrganization;
        //onBoard.Date__c    =Date.valueof(onBrdWrppr.Date1);
        if(onBrdWrppr.Amount != null && onBrdWrppr.Amount !=''){
            onBoard.D_D_Amount__c    =Decimal.valueof(onBrdWrppr.Amount);}
        onBoard.Weekly_Off_day__c    =onBrdWrppr.WeeklyOffDay;
        onBoard.Present_Business__c    =onBrdWrppr.PresentBusiness;
         if(onBrdWrppr.AnnualTurnover != null && onBrdWrppr.AnnualTurnover !=''){
             onBoard.Annual_TurnOver__c    =Decimal.valueof(onBrdWrppr.AnnualTurnover);}
        if(onBrdWrppr.Ownfinanceforcementtrade != null && onBrdWrppr.Ownfinanceforcementtrade !=''){
            onBoard.Own_Finance_for_Cement_Trade__c    =Decimal.valueof(onBrdWrppr.Ownfinanceforcementtrade);}
       if(onBrdWrppr.StaffParticulers != null && onBrdWrppr.StaffParticulers !=''){
           onBoard.Staff_Particulers__c    =Decimal.valueof(onBrdWrppr.StaffParticulers);}
        if(onBrdWrppr.BusinessExpectedMonthly != null && onBrdWrppr.BusinessExpectedMonthly !=''){
            onBoard.If_Appointed_Business_Expected_Monthly__c    =Decimal.valueof(onBrdWrppr.BusinessExpectedMonthly);}
           if(onBrdWrppr.ConsumptionPotentialofarea != null && onBrdWrppr.ConsumptionPotentialofarea !=''){
               onBoard.Consumption_Potential_of_area_MT_Month__c    =Decimal.valueof(onBrdWrppr.ConsumptionPotentialofarea);}
       if(onBrdWrppr.Potentialforsidheecement != null && onBrdWrppr.Potentialforsidheecement !=''){
           onBoard.Potential_for_SIDHEE_Cement_in_area__c    =Decimal.valueof(onBrdWrppr.Potentialforsidheecement);}
        onBoard.Remark__c    =onBrdWrppr.Remarks;
        if(onBrdWrppr.Anniversary != null && onBrdWrppr.Anniversary !='')
        onBoard.Anniversary__c    =Date.valueof(onBrdWrppr.Anniversary);
        if(onBrdWrppr.DOB != null && onBrdWrppr.DOB != '')
        onBoard.DOB__c    =Date.valueof(onBrdWrppr.DOB);
        //onBoard.GST_Class_Code__c    =onBrdWrppr.GSTClassCode;
        onBoard.TAN_Number__c    =onBrdWrppr.TANNumber;
        //onBoard.TCS_Number_Class__c    =onBrdWrppr.TCSNumberClass;
        //onBoard.TDS_NO_ASSEESEETYPE__c    =onBrdWrppr.TDSNOASSEESEETYPE;
        //onBoard.TDS_Number__c    =onBrdWrppr.TDSNumber;
        //onBoard.TDS_Number_Class__c    =onBrdWrppr.TDSNumberClass;
        if(onBrdWrppr.Exclusive != null && onBrdWrppr.Exclusive != '')
        onBoard.Exclusive__c    =Boolean.valueof(onBrdWrppr.Exclusive);
        //onBoard.Customer_Registration_Date__c    =Date.valueof(onBrdWrppr.CustomerRegistrationDate);
        //onBoard.Customer_Separation_Held_Dt__c    =Date.valueof(onBrdWrppr.CustomerSeparationHeldDt);
        //onBoard.Separation_Held_Reason__c    =onBrdWrppr.SeparationHeldReason;
        onBoard.Aadhar_No__c    =onBrdWrppr.AdharNo;
        onBoard.PAN_Number__c    =onBrdWrppr.PanNum;
        if(onBrdWrppr.Area!= null && onBrdWrppr.Area!='' ){
            onBoard.Area__c    =onBrdWrppr.Area;}
        system.debug('testha'+onBrdWrppr.PinCode);
        onBoard.Postal_Code__c   =onBrdWrppr.PinCode;
        onBoard.Category__c    =onBrdWrppr.Category;
      
      /*  if(onBrdWrppr.Category =='MO' || onBrdWrppr.Category =='TPCA')
        {
            if(u.size()>0 )
            onBoard.OwnerId = u[0].Id;
        }  */
        onBoard.Reason_for_Dealership_in_that_Area__c   =onBrdWrppr.ReasonforDealership;
        onBoard.Does_The_Party_Have_Sub_Dealer_Network__c=Boolean.valueof(onBrdWrppr.PartyHaveSubdealerNetwork);
        onBoard.GSTIN__c  =onBrdWrppr.GstNum;
        //onBoard.Address1__c  =onBrdWrppr.Address1;
        //onBoard.Address2__c  =onBrdWrppr.Address2;
        onBoard.Name  =onBrdWrppr.Name1;
        onBoard.Business_Reference_1_Name__c  =onBrdWrppr.BusinessReference1Name;    
        onBoard.Business_Reference_2_Name__c  =onBrdWrppr.BusinessReference2Name;
        onBoard.Business_Reference_1_Phone__c  =onBrdWrppr.BusinessReference1Phone;
        onBoard.Business_Reference_2_Phone__c  =onBrdWrppr.BusinessReference2Phone;
        onboard.Onboarding__c = onBrdWrppr.Onboarding;
        if(onBrdWrppr.Tzone !=null && onBrdWrppr.Tzone != '')
        onboard.Transport_Zone__c = onBrdWrppr.Tzone;
        onboard.Credit_Days__c = onBrdWrppr.CreditDays;
        if(onBrdWrppr.SecurityGSCL != null && onBrdWrppr.SecurityGSCL != '')
        onboard.Security_Deposit_GSCL__c = decimal.valueOf(onBrdWrppr.SecurityGSCL);
        if(onBrdWrppr.SecuritySCL != null && onBrdWrppr.SecuritySCL != '')
        onboard.Security_Deposit_SCL__c = decimal.valueOf(onBrdWrppr.SecuritySCL);
         if(onBrdWrppr.LiftingTarget != null && onBrdWrppr.LiftingTarget != '')
          onboard.Lifting_target_of_dealer_MT__c =decimal.valueOf(onBrdWrppr.LiftingTarget);
        onboard.Performance_review_plan_after__c=onBrdWrppr.PerformanceReview;
        if(onBrdWrppr.MonetaryExposure!= null && onBrdWrppr.MonetaryExposure != '')
            onboard.Monetary_Exposure_Limit__c = decimal.valueOf(onBrdWrppr.MonetaryExposure);
        
        onboard.Authorised_Person__c = onBrdWrppr.AuthorisedPerson;
        if(onBrdWrppr.Division!=null && onBrdWrppr.Division!='')
        onboard.Division__c = onBrdWrppr.Division;
        onboard.X10_Cr_turnover_declaration__c = onBrdWrppr.Cr;
        onboard.SEZ_customer__c = onBrdWrppr.SEZCustomer;
        onboard.Blank_Cheque_GSCL_Instrument_N_Bank_Name__c = onBrdWrppr.ChequeGSCL;
        onboard.Blank_Cheque_SCL_Instrument_No_Bank_Name__c = onBrdWrppr.ChequeSCL;
           list<Approval_Matrix__c> am = new list<Approval_Matrix__c>();
 
    //System.debug('**** 0 userids id : '+oppo.ownerid);
    
       am=[select rh__c, ba__c, fh__c, ZH__c from approval_matrix__c where ownerid=:onBrdWrppr.User];
        if(am.size()>0){
     onboard.RH__c=am[0].rh__c;
     onboard.Branch_Accountant__c=am[0].ba__c;
     onboard.Functional_Head__c=am[0].fh__c;
            onboard.ZH__c = am[0].ZH__c;
        }
        try{
            insert onBoard;
            response.code = '0001';
            response.message = 'On-Boarding Created Successfully';
            response.id = onBoard.id;
            return response;
        }
        catch(Exception e){
            response.code = '0002';
            response.message = 'Some Problem Occur'+e;
            system.debug('<<test>>'+ e.getMessage());
            return response;
        }
    }
    
    public class onBoardWrpr{
        
        String BankAccountHolderName;
        String BankAccountNo;
        String BankIFSCCode;
        String Nameofbank1;
        String Nameofbank2;
        String Nameofbank3;      
        String IFSCBank1;
        String IFSCBank2;
        String IFSCBank3;
        String BankAddress;
        String BankAddress1;
        String BankAddress2;
        String BankAddress3;
        String BankAcc1;
        String BankAcc2;
        String BankAcc3;
        String limitany1;
        String limitany2;
        String limitany3;
        String limitany4;
        String BankAccountHolderName1;
        String BankAccountHolderName2;
        String BankAccountHolderName3;  
        String Category;      
        String BusinessReference1Name;   
        String BusinessReference1Phone;   
        String BusinessReference2Name;
        String BusinessReference2Phone;
        String AdharNo;
        String AnnualTurnover;
        String Area;
        //String SeparationHeldReason;
        //String CustomerSeparationHeldDt;
        //String CustomerRegistrationDate;
        String Exclusive;
        //String TDSNumberClass;
        //String TDSNumber;
        //String TDSNOASSEESEETYPE;
        //String TCSNumberClass;
        //String TANNumber;
        //String GSTClassCode;
        String DOB;
        String Anniversary;
        String Remarks;
        String Potentialforsidheecement; 
        String ConsumptionPotentialofarea;
        String BusinessExpectedMonthly;
        String StaffParticulers;
        String Ownfinanceforcementtrade;
        String ReasonforDealership;
        String PartyHaveSubdealerNetwork;
        String PresentBusiness;
        String WeeklyOffDay;
        String Amount;
        String Date1;
        
        String AlternativeMobile;
        String Mobile;
        String ContactPersonName;
        //String ContactPersonNo;
        String Email;
        String Country;
        String State;
        String Zone;
        String Region;
        String District;
        String Taluka;
        String City;
        String PinCode;
        String BillingStreet1;
        String BillingStreet2;
        String BillingStreet3;
        String PanNum;
        String GSTSt;
        String GstNum;
        String Brand;
        String Enterprise;
        String User;
        String Employee;
        String CustomerCategory;
        String DistributionChannel;
        String TPCA;
        String ParentCode;
        String LegalName;
        String Nameofbank;
        String Address1;
        String Address2;
        String Name1;
        boolean Onboarding;        
        String Tzone;
        String CreditDays;
        String SecurityGSCL;
        String SecuritySCL;
        String LiftingTarget;
        String PerformanceReview;
        String MonetaryExposure;
        String DDNumScl;
        String DDNumGscl;
        String TANNumber;
        String FormOfOrganization;
        String AuthorisedPerson;
         String Division;
         boolean SEZCustomer;
         boolean Cr;
        String ChequeSCL;
        String ChequeGSCL;
    }
    public static onBoardWrpr parse(String json)
    {
        return (onBoardWrpr) System.JSON.deserialize(json, onBoardWrpr.class);
    }
}