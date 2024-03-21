@RestResource(urlMapping = '/Opportunity/*')
global with sharing class OpportunityREST {

    //TODO:substituir pelo obj de log
    private static Map<String, Object> errors = new Map<String, Object>();
    private static Map<String, Object> validated = new Map<String, Object>();

    //TODO:Tratar os responses de forma mais detalhada
    //TODO:melhorar o tratamento da lista vazia - relizar testes de response com lista vazia
    //TODO:melhorar a estrutura do response
    //TODO:criar objeto para salvar os logs
   
    @HttpPost
    global static String doPost() {

        List<OpportunityRESTMapper> oppMapper = OpportunityRESTMapper.parseOpportunityList(RestContext.request.requestBody.toString());

        if (oppMapper.isEmpty()){
            OpportunityRESTResponse.responseStatus = '400';
            OpportunityRESTResponse.message = 'Bad Request';
        } 

        if(!hasErrorWithOpp(oppMapper).isEmpty()){
            errors.put('total errors -> ', hasErrorWithOpp(oppMapper).size());
            errors.put('error_details', hasErrorWithOpp(oppMapper));

            //TODO:tratar response com os erros (quantidade e motivo - falta de campos)
        }

        try {
            OpportunityWrapper.transformRecords(OpportunityRESTHelper.validationFields(oppMapper).get('validated'));

            //TODO:tratar a resposta com o total validado e "inserido"
            validated.put('total validated ->', OpportunityRESTHelper.validationFields(oppMapper).get('validated').size());

            OpportunityRESTResponse.responseStatus = '200';
            OpportunityRESTResponse.message = 'OK - Oportunidades recebidas';
        } 
        catch (Exception ex) {
            OpportunityRESTResponse.responseStatus = '500';
            OpportunityRESTResponse.message = 'Erro interno: ' + ex.getMessage();
        }
        
        return JSON.serialize(OpportunityRESTResponse.parseResponse());
    }

    private static List<OpportunityRESTMapper> hasErrorWithOpp(List<OpportunityRESTMapper> oppMapper){
        return OpportunityRESTHelper.validationFields(oppMapper).get('error');
    }

    public without sharing class OpportunityRESTException extends Exception {}
}