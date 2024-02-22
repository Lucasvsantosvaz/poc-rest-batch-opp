public with sharing class OpportunityService {
   
    public static void insertRecords(List<Opportunity> oppTpInsert){
        
        for(Opportunity opp : oppTpInsert){
            InsertOpportunityFactory.getOpp(opp);
        }
        OpportunityDAO.insertOpp(oppTpInsert);
    }
}