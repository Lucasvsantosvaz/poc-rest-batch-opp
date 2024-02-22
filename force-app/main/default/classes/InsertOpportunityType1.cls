public with sharing class InsertOpportunityType1 implements IOpportunityInsert{

    private static final String STAGE_NAME = 'Prospecting';

    public static Opportunity insertOppt(Opportunity opp){
        opp.StageName = STAGE_NAME;

        return opp;
    }
}