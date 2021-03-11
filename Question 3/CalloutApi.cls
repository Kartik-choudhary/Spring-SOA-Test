public class CalloutApi {
    
    public static void call(){
        HttpRequest req = new HttpRequest();
        req.setTimeout(12000);
        req.setEndpoint('https://postman-echo.com/get?foo1=bar1&foo2=bar2');
        req.setMethod('GET');
        req.setHeader('Content-Type', 'application/json');        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        system.debug('res.getBody()--'+res.getBody());
    }
}