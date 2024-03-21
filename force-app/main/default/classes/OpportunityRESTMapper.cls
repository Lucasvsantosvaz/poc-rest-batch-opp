public with sharing class OpportunityRESTMapper {
   
    public String name;
    public Decimal amount;
    public String type; 
    public String closeDate;

    public static List<OpportunityRESTMapper> parseOpportunityList(String json) {
        return (List<OpportunityRESTMapper>) System.JSON.deserialize(json, List<OpportunityRESTMapper>.class);
    }
}