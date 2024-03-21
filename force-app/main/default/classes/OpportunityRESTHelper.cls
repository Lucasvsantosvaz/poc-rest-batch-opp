public with sharing class OpportunityRESTHelper {
  
    public static Map<String, List<OpportunityRESTMapper>> validationFields(List<OpportunityRESTMapper> mapperList){

        List<OpportunityRESTMapper> oppError = new List<OpportunityRESTMapper>();
        List<OpportunityRESTMapper> oppValidated = new List<OpportunityRESTMapper>();

        for(OpportunityRESTMapper oppMapper : mapperList){
            if (String.isBlank(oppMapper.name)) {
                oppError.add(oppMapper);
            }
            else {
                oppValidated.add(oppMapper);
            }
        }

        return new Map<String, List<OpportunityRESTMapper>>{
            'error' => oppError,
            'validated' => oppValidated
        };
    }
}