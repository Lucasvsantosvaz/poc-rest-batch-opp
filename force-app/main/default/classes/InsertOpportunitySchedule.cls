global class InsertOpportunitySchedule implements Schedulable {
   
    global void execute(SchedulableContext sc) {
        OpportunityREST.doPost();
    }
}