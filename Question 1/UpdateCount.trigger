trigger UpdateCount on Contact (after insert,after update,after delete,after undelete) {
    
    //providing account ids to the helper class for direct processing    
    List<Id> accLst=new List<Id>();
    
    if(trigger.isInsert || trigger.isUnDelete){  
        for(Contact con : trigger.new) {
            if(con.AccountId!=null){
                accLst.add(con.AccountId);
            }           
        }
        UpdateCountHelper.countUpdate(accLst);
    }
    
    else if(trigger.isUpdate){       
        for(Contact con : trigger.new) {           
            if(con.AccountId!=trigger.oldMap.get(con.Id).AccountId && con.AccountId!=NULL){
                accLst.add(con.AccountId);
            }                
        }
        UpdateCountHelper.countUpdate(accLst);
    }
    
    else if(trigger.isDelete){    
        for(Contact con : trigger.old) {
            if(con.AccountId!=null){
                accLst.add(con.AccountId);
            }
        }
        UpdateCountHelper.forDelete(accLst);
    }
    
}