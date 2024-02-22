public with sharing class InsertOpportunityType3 implements IOpportunityInsert {
   
    private static final String STAGE_NAME = 'Needs Analysis';

    public static Opportunity insertOppt(Opportunity opp){
        opp.StageName = STAGE_NAME;

        return opp;
    }
}