// Objective C

// dispatch

dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
    //Background Thread
    dispatch_async(dispatch_get_main_queue(), ^(void){
        //Run UI Updates
    });
});



// global queue
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
    // block1
});


dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
    // block2
});

// wait until both the block1 and block2 are done before start block3
// how to do that?

dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
    // block3
});



// group
dispatch_group_t group = dispatch_group_create();

dispatch_group_enter(group);
dispatch_group_leave(group);

dispatch_group_notify(group, dispatch_get_main_queue(), ^{
	// main queue
});

dispatch_group_notify(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
	// global queue
});




// networking
NSURL *url = [NSURL URLWithString:@"give your url here"]
NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL: url];

//create the Method "GET" 
[urlRequest setHTTPMethod:@"GET"];

NSURLSession *session = [NSURLSession sharedSession];

NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest 
										  completionHandler:^(NSData *data, 
															  NSURLResponse *response, 
															  NSError *error) {

										  	NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
										  	if(httpResponse.statusCode == 200)
										  	{
										    	NSError *parseError = nil;
										    	NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data 
																							    		options:0
																							    		error:&parseError];
										  	}
										  }];
[dataTask resume];



