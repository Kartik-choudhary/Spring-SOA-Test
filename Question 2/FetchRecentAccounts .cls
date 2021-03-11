public class FetchRecentAccounts {
	  @AuraEnabled
    public static list<Account> fetchData(){
        list<Account> toReturn=new list<Account>();
        toReturn = [SELECT Name,Phone FROM Account ORDER BY CreatedDate DESC LIMIT 10];
       	return toReturn;
    }
}