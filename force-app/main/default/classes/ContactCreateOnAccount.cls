public class ContactCreateOnAccount {
    public static void createContact(Account acnt){
        
        Map<String, String> mapName = new Map<String, String>();
        Map<String, String> mapEmail = new Map<String, String>();
        List<String> phoneList = new List<String>();
        List<Contact_Of_Account__mdt> mdtList = [SELECT Email__c, Name__c, Phone__c FROM Contact_Of_Account__mdt];
        for(Contact_Of_Account__mdt cntmtd : mdtList){
            if(cntmtd.Phone__c != null){
                mapName.put(cntmtd.Phone__c, cntmtd.Name__c);
             }  
            if(cntmtd.Phone__c != null){
                mapEmail.put(cntmtd.Phone__c, cntmtd.Email__c);                
            }
            if(cntmtd.Phone__c != null){ 
                phoneList.add(cntmtd.Phone__c);                 
            }
        }
        List<Contact> cntList = new List<Contact>();
        for(Integer i = 0; i<acnt.Number_Of_Contact__c; i++){
            System.debug('-->'+i+' '+mapName.get(mdtList[i].Phone__c)+' -- '+mapEmail.get(mdtList[i].Phone__c));
            
            cntList.add(new Contact(AccountId = acnt.Id,LastName = mapName.get(mdtList[i].Phone__c),
                                    Phone = phoneList[i], Email = mapEmail.get(mdtList[i].Phone__c)));
        }
        if(cntList.size()>0 && cntList != null){
            INSERT cntList;
        }
    }
}