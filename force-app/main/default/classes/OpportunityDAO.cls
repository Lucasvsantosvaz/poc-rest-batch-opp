public with sharing class OpportunityDAO {

    //TODO: melhorar a forma de tratar erros e sucesso - provável com o obj de log

    public static void insertOpp(List<Opportunity> oppTpInsert) {

        Database.SaveResult[] saveResults = Database.insert(oppTpInsert, false, AccessLevel.USER_MODE);

        List<Id> successfulRecords = new List <Id>();
        List<Database.Error> failedRecordsErrors = new List<Database.Error>();

        for (Database.SaveResult saveResult: saveResults) {
            if (saveResult.isSuccess()) {
                successfulRecords.add(saveResult.getId());
            } 
            else {
                failedRecordsErrors.addAll(saveResult.getErrors());
            }
        }

        System.debug('Number of records saved successfully: ' + successfulRecords.size());
 
        for (Database.Error error : failedRecordsErrors) {
            System.debug('Failed Record Error: ' + error.getMessage());
        }
    }
}