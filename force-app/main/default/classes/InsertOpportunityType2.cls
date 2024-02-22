public with sharing class InsertOpportunityType2 implements IOpportunityInsert {
   
    private static final String STAGE_NAME = 'Qualification';

    public static Opportunity insertOppt(Opportunity opp){
        opp.StageName = STAGE_NAME;

        return opp;
    }
}