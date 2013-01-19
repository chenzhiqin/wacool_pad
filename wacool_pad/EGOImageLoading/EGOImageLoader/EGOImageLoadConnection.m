//
//  EGOImageLoadConnection.m
//  EGOImageLoading
//
//  Created by Shaun Harrison on 12/1/09.
//  Copyright (c) 2009-2010 enormego
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "EGOImageLoadConnection.h"


@implementation EGOImageLoadConnection
@synthesize imageURL=_imageURL, /*response=_response,*/ connectionDelegate=_connectionDelegate, timeoutInterval=_timeoutInterval;

#if __EGOIL_USE_BLOCKS
@synthesize handlers;
#endif

- (id)initWithImageURL:(NSURL*)aURL delegate:(id)delegate queue:(NSOperationQueue *)aQueue{
	if((self = [super init])) {
		_imageURL = aURL;
		self.connectionDelegate = delegate;
		_responseData = [[NSMutableData alloc] init];
		self.timeoutInterval = 30;
		queue = aQueue;
		
		#if __EGOIL_USE_BLOCKS
		handlers = [[NSMutableDictionary alloc] init];
		#endif
	}
	
	return self;
}

- (void)start {
//	NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:self.imageURL
//																cachePolicy:NSURLRequestReturnCacheDataElseLoad
//															timeoutInterval:self.timeoutInterval];
//	[request setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];  
//	_connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
//	[request release];
	
	_request = [ASIHTTPRequest requestWithURL:self.imageURL];
	[_request setTimeOutSeconds:30];
	[_request setNumberOfTimesToRetryOnTimeout:2];
	[_request setShouldContinueWhenAppEntersBackground:YES];
	[_request setDelegate:self];
	[_request startAsynchronous];
	
	
//	_request = [ASIHTTPRequest requestWithURL:self.imageURL];
//	[_request setDelegate:self];
//	[_request setDidFinishSelector:@selector(requestDone:)];
//	[_request setDidFailSelector:@selector(requestWentWrong:)];
//	[queue addOperation:_request];
	
}

- (void)cancel {
//	[_connection cancel];	
	[_request cancel];
}

- (NSData*)responseData {
	return _responseData;
}

//- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
//	if(connection != _connection) return;
//	[_responseData appendData:data];
//}
//
//- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
//	if(connection != _connection) return;
//	self.response = response;
//}
//
//- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
//	if(connection != _connection) return;
//
//	if([self.delegate respondsToSelector:@selector(imageLoadConnectionDidFinishLoading:)]) {
//		[self.delegate imageLoadConnectionDidFinishLoading:self];
//	}
//}
//
//- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
//	if(connection != _connection) return;
//
//	if([self.delegate respondsToSelector:@selector(imageLoadConnection:didFailWithError:)]) {
//		[self.delegate imageLoadConnection:self didFailWithError:error];
//	}
//}

#pragma mark -
#pragma asihttprequest
- (void)requestFinished:(ASIHTTPRequest *)request
{
	if(request != _request) return;
	
	_responseData = [request responseData];
	
	if([self.connectionDelegate respondsToSelector:@selector(imageLoadConnectionDidFinishLoading:)]) {
		[self.connectionDelegate imageLoadConnectionDidFinishLoading:self];
	}

}

- (void)requestFailed:(ASIHTTPRequest *)request
{
	if(request != _request) return;
	
	if([self.connectionDelegate respondsToSelector:@selector(imageLoadConnection:didFailWithError:)]) {
		[self.connectionDelegate imageLoadConnection:self didFailWithError:[request error]];
	}
}

- (void)dealloc {
//	self.response = nil;
	self.connectionDelegate = nil;
	
	#if __EGOIL_USE_BLOCKS
	handlers = nil;
	#endif
}

@end
