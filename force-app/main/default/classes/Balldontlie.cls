public with sharing class Balldontlie {

    private String URL;

    public static final String REST_METHOD_GET = 'GET';
    public static final String REST_METHOD_POST = 'POST';
    public static final String REST_METHOD_PUT = 'PUT';

    public static final Integer RESPONSE_CODE_SUCCESS = 200;
    public static final Integer DEFAULT_TIMEOUT_TIME = 120000;
        
    public static final String SETTINGS_NAME_SANDBOX = 'DEV';
    public static final String SETTINGS_NAME_PRODUCTION = 'PRO';

    public static final String ERROR_MISSING_AUTH_SETTINGS = 'Missing auth settings for this environment.';

    public static final String GAMES_API_PATH = '/api/v1/games';

    public static BalldontlieSettings__c authSettings {
        get {
            if (authSettings == null) {
                authSettings = BalldontlieSettings__c.getInstance(Util.inSandbox() ? SETTINGS_NAME_SANDBOX : SETTINGS_NAME_PRODUCTION);
                if (authSettings == null) {
                    throw new BalldontlieException(ERROR_MISSING_AUTH_SETTINGS);
                }
            }
            return authSettings;
        }
        set;
    }

    public Balldontlie() {
    }

    
    public HttpRequest generateHttpRequest(String method, String endpoint, String serializedBody) {
        HttpRequest request = new HttpRequest();
        request.setTimeout(DEFAULT_TIMEOUT_TIME);
        request.setMethod(method);
        setRequestEndpoint(request, endpoint);
        if (String.isNotBlank(serializedBody)) {
            request.setBody(serializedBody);
        }
        return request;
    }

    private void setRequestEndpoint(HttpRequest request, String endpoint) {
        request.setEndpoint(authSettings.URL__c + endpoint);
    }

    public HttpRequest generateHttpRequest(String method, String endpoint) {
        return generateHttpRequest(method, endpoint, null);
    }

    public HttpResponse request(String method, String endpoint, String serializedBody) {
        return new Http().send(generateHttpRequest(method, endpoint, serializedBody));
    }

    public HttpResponse request(String method, String endpoint) {
        return new Http().send(generateHttpRequest(method, endpoint));
    }


}