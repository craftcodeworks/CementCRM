@istest
public class CreateDealerOnboarding_Test {
    @IsTest 
    static  void doset1() {
        CreateDealerOnboarding cr=new  CreateDealerOnboarding();
        
        {Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator' limit 1];     
        User u = new user();
        u.LastName = 'Test Code Welcome';
        u.Email = 'test@gmail.com';
        u.Alias = 'Tcode';
        u.Username = 'sss0test000001@gmail.com';
        u.CommunityNickname = 'test1211';
        u.LocaleSidKey = 'en_US';
        u.TimeZoneSidKey = 'GMT';
        u.ProfileID = p.id;
        u.Designation__c = 'Sales Officer';
        u.LanguageLocaleKey = 'en_US';
        u.EmailEncodingKey = 'UTF-8';
        insert u;
         
         Brand__c br=new Brand__c();
         br.Name='test';
         insert br;
         
         City__c ci=new City__c();
         ci.Name='ZUNDAL';
         insert  ci;
                 
         District__c di=new District__c();
         di.Name='AMRELI-DIST';
         insert di;
         
         Taluka__c ti=new Taluka__c();
         ti.Name='test';
         insert ti;
               
         Region__c ri=new Region__c();
         ri.Name='test';
         insert ri;
         
         Zone__c zi=new Zone__c();
         zi.Name='test';
         insert zi;
         
         State__c si=new State__c();
         si.Name='test';
         insert si;
                 
         Country__c cit=new Country__c();
         cit.Name='test';
         insert cit;
         
         Area__c aa=new Area__c();
         aa.Name='AADHOI';
         aa.Area_Code__c='AADHOI';
         insert aa;
                
         Account onBoard = new Account();
         onBoard.Bank_Account_Holder_Name__c='dfdsf';
         onBoard.Bank_Account_No__c ='fsd';    
         onBoard.Bank_IFSC_Code__c ='gbbg';  
         onBoard.Name_of_Bank1__c='sdf';
         onBoard.Name_of_Bank2__c='vb';
         onBoard.Name_of_Bank3__c='vbc';
         onBoard.Name_of_Bank__c ='mgb';
         onBoard.Bank_IFSC_Code1__c ='vcivb';
         onBoard.Bank_IFSC_Code2__c ='nh';
         onBoard.Bank_IFSC_Code3__c ='mvb';
         onBoard.Bank_Address__c ='mvf';
         onBoard.Bank_Address1__c ='tesst';
         onBoard.Bank_Address2__c='Name';
         onBoard.Bank_Address3__c='Name';
         onBoard.Bank_Account_No_1__c ='Name';
         onBoard.Bank_Account_No_2__c='Name';
         onBoard.Bank_Account_No_3__c='Name';
         onBoard.Limit_If_Any_Obtained__c=123;
         onBoard.Limit_If_Any_Obtained1__c =456;
         onBoard.Limit_If_Any_Obtained2__c =789;
         onBoard.Limit_If_Any_Obtained3__c =452;
         onBoard.Segment__c  ='10'; 
         onBoard.TPCA_MO_ID__c       ='0019B000002R7wuQAC';
         onboard.Distributor_Channel__c = 'test';
         onBoard.Customer_Category_1__c ='CustomerCategory';
         onBoard.Enterprise__c  ='Enterprise';
         onBoard.SCL__c=true;
         onBoard.GSCL__c=true;
         onBoard.Brand__c  =br.id;
         onBoard.ownerid       =u.id;      
         onBoard.Bank_Account_Holder_Name1__c   ='BankAccountHolderName1';
         onBoard.Bank_Account_Holder_Name2__c   ='BankAccountHolderName2';
         onBoard.Bank_Account_Holder_Name3__c   ='BankAccountHolderName3';
         onBoard.Legal_Name__c       ='LegalName';
         onBoard.City_Lookup__c =ci.id;
         onBoard.District_Code__c =di.id;
         onBoard.Taluka_Code__c    =ti.id;
         onBoard.Region__c    =ri.id;
         onBoard.Zone__c    =zi.id;
         onBoard.State_Code__c    =si.id;
         onBoard.Country__c    =cit.id;
         onBoard.Email__c    ='test@gmail.com';      
         onBoard.Category__c='Dealer';
         onBoard.Name='as';
         insert onBoard;
         
         Approval_Matrix__c Approvalobj = new Approval_Matrix__c();
         if(Approvalobj != NULL){
             Approvalobj.OwnerId = u.Id;
             insert Approvalobj;}
         
         Test.startTest();
         StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
         mock.setStaticResource('mockservice');
         mock.setStatusCode(200);
         mock.setHeader('Content-Type', 'application/json');
         Test.setMock(HttpCalloutMock.class, mock);
      
        RestRequest request = new RestRequest();
        request.requestURI = '/services/apexrest/CreateDealerOnboarding';
        request.httpMethod = 'Post';
        request.addHeader('Content-Type', 'application/json');
        RestContext.request = request;
        String str = '{"BankAccountHolderName": "Test","BankAccountNo": "464346634","BankIFSCCode": "464346634","Nameofbank1":"abc","limitany1":"200000","limitany2":"150000","limitany3":"180000","limitany4":"10000","Amount":"880000","BillingStreet1":"test1","BillingStreet2":"test2","BillingStreet3":"test3","Exclusive":"true","PartyHaveSubdealerNetwork":"true","AdharNo":"2505500","PanNum":"95558","PinCode":"956788","DDNum":"25550","Mobile":"8378567890","ContactPersonName":"xyx","GSTSt":"8888","AnnualTurnover":"7888","ConsumptionPotentialofarea":"555","BusinessExpectedMonthly":"5858","StaffParticulers":"2","Ownfinanceforcementtrade":"575","Potentialforsidheecement":"111"}';
        request.requestBody= Blob.valueOf(str);
        CreateDealerOnboarding.Response resp =new CreateDealerOnboarding.Response(); 
        
        resp=CreateDealerOnboarding.doPost();	
        //System.assert(resp.Code.contains('0001'));
        Test.stopTest(); 
        }
    }
}