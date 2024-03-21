public with sharing class OpportunityRESTResponse {

    public static String responseStatus;
    public static String message;

    public static Map<String, Object> parseResponse() {
        return new Map<String, Object>{
            'responseStatus' => responseStatus,
            'message'        => message
        }; 
    }
}