@RestResource(urlMapping = '/Opportunity/*')
global with sharing class OpportunityREST {

    private static String RESPONSE_BODY;
    private static final String EMPTY_LIST_ERROR = 'Empty List - OpportunityRESTMapper';
   
    @HttpPost
    global static String doPost() {

        List<OpportunityRESTMapper> oppMapper = OpportunityRESTMapper.parseOpportunityList(RestContext.request.requestBody.toString());

        if (oppMapper.isEmpty()) throw new OpportunityRESTException(EMPTY_LIST_ERROR);

        try {
            OpportunityWrapper.getOppToInsert(oppMapper);
            RESPONSE_BODY = 'Opportunities included';
        } 
        catch (Exception ex) {
            RESPONSE_BODY = String.valueOf(ex.getMessage());
        }
        
        return RESPONSE_BODY;
    }

    public without sharing class OpportunityRESTException extends Exception {}
}