public class FutureMethod {
	// To make an asynchronous method we declare it with the @future annotation
    @future
    // future methods must be static and return nothing.
    public static void AsyncMethod() {
        // Perform process
    }
    
    // If we want to use our future method to make a callout, we have to set callout=true on our annotation.
    @future(callout=true)
    public static void AsyncCalloutMethod() {
        system.debug('Called Method');
        // Perform external service callout.
		// We instantiate a new Http object.
        Http httpCallout = new Http();
        system.debug('New Http');
        
        // We instantiate a new HttpRequest
        HttpRequest httpReq = new HttpRequest();
        system.debug('New HttpRequest');
        // We define where we are sending it. Here I use a servive
        // that allows me to make a fake database. Note that we must first white list any url we wish to make a
        // callout to by adding it in our Remote Site Settings
        httpReq.setEndpoint('https://my-json-server.typicode.com/harveyhill/04Nov19/posts');
        system.debug('Set Endpoint');
        // We define what we are doing with it. In this case GET.
        // GET, requests a designated resource.
        // 		Idempotent
        // 			Idempotency relates to operations that when run multiple times 
        // 			will not change the result. Making multiple identical requests 
        // 			will result in the same effect as if making one request.
        // We could also use:
        // POST, Allows a client to create a new resource or replace an existing one.
        // 		Not Idempotent
        // PUT, Allows a client to create a new resource or replace an existing one.
        // 		Idempotent
        // DELETE, removes the designated resource.
        // 		Idempotent
        // TRACE, echoes back to the client whatever string was sent to the server, 
        // 	used for debugging. However, there are security risks associated with exposing this.
        // 		Idempotent
        // CONNECT, starts two-way communications with the requested resource.
        // 	It can be used to open a tunnel.
        // 		Not Idempotent
        // HEAD, requests the headers that are returned if the specified resource would be 
        // 	requested with an HTTP GET method. Such a request can be done before deciding 
        // 	to download a large resource to save bandwidth, for example.
        // 		Idempotent
        // OPTIONS, used to describe the communication options for the target resource. 
        // 	The client can specify a URL for the OPTIONS method, 
        // 	or an asterisk (*) to refer to the entire server.
        // 		Idempotent
        httpReq.setMethod('GET');
        system.debug('Set Method');
        // Now we send the request
        HttpResponse httpRes = httpCallout.send(httpReq);
        system.debug('Sent');
        // Here I am doing some code just as an example callback.
        // Here we check the result, and do something as a result.
        // First, we check for the status code.
        // 		Status Codes:
        // 		100, informational
	    //      	100: Continue
		//		200, Success
    	//			200: Ok
    	//			201: Created
    	//			204: No Content
		//		300, Redirect
    	//			300: Multiple Choices
    	//			301: Moved Permanently
    	//			307: Temporary Redirect
		//		400, Client side error
    	//			400: Bad Request
    	//			401: Unauthorized
    	//			403: Forbidden
    	//			404: Page Not Found
		//		500, Server side error.
    	//			500: Internal Server Error
    	//			502: Bad Gateway
        if(httpRes.getStatusCode() == 200) {
            List<Object> responseBody = (List<Object>) JSON.deserializeUntyped(httpRes.getBody());
            System.debug('Recieved the following: ');
            for(Object o : responseBody) {
                System.debug(o);
            }
        //If it isn't a success, tell us what it is.
        } else {
            System.debug('The GET request returned a response with status code ' + httpRes.getStatusCode());
        }
        
        // If it wasn't an asynchronous method we could also return the response, a string.
        // return httpRes.getBody();

    }
}
