public with sharing class OpportunityWrapper {
   
    public static void getOppToInsert(List<OpportunityRESTMapper> mapperList){
        
        List<Opportunity> oppTransformList = new List<Opportunity>();

        for(OpportunityRESTMapper oppMapper : mapperList){
            Opportunity opp = new Opportunity(
                Name = oppMapper.name,
                Amount = oppMapper.amount,
                Type = oppMapper.type,
                CloseDate = Date.today() + 7
            );

            oppTransformList.add(opp);
        }

        System.scheduleBatch(new OpportunityInsertBatch(oppTransformList), 'Job Doido 1', 0);
    }
}