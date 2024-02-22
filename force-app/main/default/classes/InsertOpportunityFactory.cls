public with sharing class InsertOpportunityFactory {

    
    public static Opportunity getOpp(Opportunity opp){

        Opportunity oppToReturn;

        switch on opp.Type {
            when 'Type1' {
                oppToReturn = InsertOpportunityType1.insertOppt(opp);
            }
            when 'Type2' {
                oppToReturn = InsertOpportunityType2.insertOppt(opp);
            }
            when 'Type3'{
                oppToReturn = InsertOpportunityType3.insertOppt(opp);
            }
        }

        return oppToReturn;
    }
}