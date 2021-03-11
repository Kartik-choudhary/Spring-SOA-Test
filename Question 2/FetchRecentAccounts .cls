public class FetchRecentAccounts {
    @AuraEnabled
    public static list<Account> fetchData(){
        return new list<Account>([SELECT Name,Phone FROM Account ORDER BY CreatedDate DESC LIMIT 10]);
    }
}
