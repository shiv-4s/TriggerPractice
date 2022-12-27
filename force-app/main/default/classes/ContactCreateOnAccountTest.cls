@isTest
public class ContactCreateOnAccountTest {
     @testSetup static void setupRecord() {
        List<Contact> cntList = new List<Contact>();
       for(Integer i=1; i<=5; i++){
           Account acc = new Account();
           Contact cnt = new Contact();
           cnt.LastName = 'TestCnt ' + i;
           cnt.AccountId = acc.Id;
           cntList.add(cnt);
       }
       INSERT cntList;
   }
    @isTest
    public static void CreateOnAccountTest(){
        Account acnt = new Account();
        ContactCreateOnAccount.createContact(acnt);
    }

}