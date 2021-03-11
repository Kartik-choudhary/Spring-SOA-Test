public class UpdateCountHelper {
    
    public static void countUpdate(list<id> accLst){      
        list<aggregateresult> countResult=[SELECT count(id),AccountId FROM contact WHERE AccountId in : accLst group by AccountId];       
        list<Account> toUpdate=new list<Account>();
        for(aggregateresult agg : countResult){
            toUpdate.add(new Account(id=(id)agg.get('AccountId'),Number_of_Contacts__c=(integer)agg.get('expr0')));
        }
        update toUpdate;
    }    
    
    public static void forDelete(list<id> accLst) {      
        list<Account> accounts=[SELECT Id,(SELECT id FROM contacts) FROM Account WHERE Id in : accLst];		
        for(Account acc : accounts){            
            if(acc.contacts!=null){
                acc.Number_of_Contacts__c = acc.contacts.size();
            }   
            else{
                acc.Number_of_Contacts__c = 0;
            }           
        }
        update accounts;
    }    
}