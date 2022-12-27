trigger createContact on Account (after insert) {
    if(Trigger.isInsert){
        for(Account acc : trigger.new){
            if(acc.Number_Of_Contact__c != null){
                 ContactCreateOnAccount.createContact(acc);
            }
        }
    }
    
}