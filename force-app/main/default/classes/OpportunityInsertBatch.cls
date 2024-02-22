global class OpportunityInsertBatch implements Database.Batchable<sObject>{

    global List<Opportunity> oppToInsert = new List<Opportunity>();

    public OpportunityInsertBatch(List<Opportunity> oppToInser){
        this.oppToInsert = oppToInser;
    }
  
    global System.Iterable<sObject> start(Database.BatchableContext BC) {
        return this.oppToInsert;
    }

    global void execute(Database.BatchableContext BC, List<sObject> scope) {
        OpportunityService.insertRecords(scope);
    }
    
    global void finish(Database.BatchableContext BC) {}
}