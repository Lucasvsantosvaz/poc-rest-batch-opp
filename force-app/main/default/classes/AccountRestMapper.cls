public with sharing class AccountRestMapper {

    public String name; 
    public String industry; 
    public String type; 
    public String accountSource; 
    public Integer annualRevenue; 

     public static List<AccountRestMapper> parseList(String json) {
        return (List<AccountRestMapper>) System.JSON.deserialize(json, List<AccountRestMapper>.class);
    }
}