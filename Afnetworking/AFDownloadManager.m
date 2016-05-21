//
//  AFDownloadManager.m
//  AFDownload
//
//  Created by B.H.Liu on 12-12-14.
//  Copyright (c) 2012年 Appublisher. All rights reserved.
//

#import "AFDownloadManager.h"
#import "AFURLConnectionOperation.h"
#import "ZipArchive.h"


@interface AFDownloadManager ()

@property (nonatomic,strong) AFHTTPClient *client;

@end

static AFDownloadManager* _manager;

@implementation AFDownloadManager

+ (AFDownloadManager*)sharedManager
{
    @synchronized(self)
    {
        if (_manager == nil)
        {
            _manager = [[super alloc] init];
        }
    }
    return _manager;
}

- (id) init
{
    self = [super init];
    if (self != nil)
    {
        self.client = [[AFHTTPClient alloc] init];
        self.operations = [NSMutableArray array];
        
        if ([[NSUserDefaults standardUserDefaults] objectForKey:USERDEFAULT_DOWNLOADS])
        {
            NSArray *array = [NSArray array];
            [[NSUserDefaults standardUserDefaults] setObject:array forKey:USERDEFAULT_DOWNLOADS];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }
    return self;
}


- (NSString*) fileNameForResourceAtURL:(NSString*)url
{
    NSArray *parts = [url componentsSeparatedByString:@"/"];
    NSString *searchKeyword = [parts lastObject];
    
    NSString * fileName = url;
    if ([url hasPrefix:@"http://"]) fileName = [url substringFromIndex:[@"http://" length]];
    else if ([url hasPrefix:@"https://"]) fileName = [url substringFromIndex:[@"https://" length]];
    
    fileName = [fileName stringByReplacingOccurrencesOfString:@"/" withString:@"__"];
    
    NSRange rangeOfYourString = [fileName rangeOfString:searchKeyword];
    
    if(rangeOfYourString.location == NSNotFound)
    {
        // error condition — the text searchKeyword wasn't in 'string'
    }
    else{
        //    NSLog(@"range position %u", rangeOfYourString.location);
    }
    
//    NSString *downloadFileName = [fileName substringFromIndex:rangeOfYourString.location+searchKeyword.length];
  //  fileName=[NSString  stringWithFormat:@"%@.zip",downloadFileName];

    NSString *downloadFileName = [fileName substringFromIndex:rangeOfYourString.location];

    fileName=[NSString  stringWithFormat:@"%@",downloadFileName];

    return  fileName;
}

- (void)buildNewRequestWithURL:(NSString *)url shouldResume:(BOOL)shouldResume isExcutableInBackground:(BOOL)isExcutableInBackground
{
   
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [[paths objectAtIndex:0] stringByAppendingPathComponent:[self fileNameForResourceAtURL:url]];
    NSURL *newUrl = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:newUrl
                                             cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                         timeoutInterval:500.0];
    
    NSMutableDictionary *syncUrlDic=[[NSUserDefaults standardUserDefaults] valueForKey:@"downloadPrcnt"];
    
    AFDownloadRequestOperation *operation = [[AFDownloadRequestOperation alloc] initWithRequest:request targetPath:path shouldResume:YES ];
    //    operation.outputStream = [NSOutputStream outputStreamToFileAtPath:path append:NO];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Successfully downloaded file to %@", path);
        
        [self.operations removeObject:operation];
        
        if(  [self.operations count]==0)
            [[NSNotificationCenter defaultCenter] postNotificationName:@"DownloadCompleted" object:self];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"UploadDownloadCompleted" object:self];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        //  NSLog(@"Error: %@", self.operations);
        [self.operations removeObject:operation];
        
        if(  [self.operations count]==0)
            [[NSNotificationCenter defaultCenter] postNotificationName:@"DownloadCompleted" object:self];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"UploadDownloadCompleted" object:self];

    }];
    
    if (isExcutableInBackground)
    {
        __weak AFDownloadRequestOperation *_operation = operation;
        [_operation  setShouldExecuteAsInfiniteBackgroundTaskWithExpirationHandler:^BOOL(void)
         {
             // if ([array indexOfObject:_operation.request.URL.absoluteString] == NSNotFound)
             if ([syncUrlDic indexOfAccessibilityElement:_operation.request.URL.absoluteString] == NSNotFound)
                 
             {
                 // NSLog(@"BackgroundTaskWithExpirationHandler infinite till operation done");
                 return YES;
             }
             else
             {
                 //NSLog(@"BackgroundTaskWithExpirationHandler finite when operation is done");
                 return NO;
             }
         }];
    }
    else
    {
        [operation setShouldExecuteAsBackgroundTaskWithExpirationHandler:^void
         {
             NSLog(@"BackgroundTaskWithExpirationHandler");
         }];
    }
    
    [self.client enqueueHTTPRequestOperation:operation];
    
    [self.operations addObject:operation];
    
}

- (void) unzipFile:(id)path
{
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *zippedDirectoryPath = documentsDirectory ;
    
    [fileManager createDirectoryAtPath:zippedDirectoryPath withIntermediateDirectories:YES attributes:nil error:nil];
    
    //unzip the files
    ZipArchive *zip = [[ZipArchive alloc] init];
    if ( [zip UnzipOpenFile:path] )
    {
        [zip UnzipFileTo:zippedDirectoryPath overWrite:YES];
    }
    [zip UnzipCloseFile];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"DownloadCompleted" object:self];
}

- (void)invokeAllSuspendedDownloadRequests
{
    
    NSMutableDictionary *syncUrlDic=[[NSUserDefaults standardUserDefaults] valueForKey:@"downloadPrcnt"];
    
    for (NSString *requestURL in syncUrlDic.allValues)
    {
        //  if ([array indexOfObject:requestURL]!=NSNotFound) continue;
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path = [[paths objectAtIndex:0] stringByAppendingPathComponent:[self fileNameForResourceAtURL:requestURL]];
        
        if(! [[NSFileManager defaultManager] fileExistsAtPath:path])
        {
            NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:requestURL]];
            
            AFDownloadRequestOperation *operation = [[AFDownloadRequestOperation alloc] initWithRequest:request targetPath:[self fileNameForResourceAtURL:request.URL.absoluteString] shouldResume:YES];
            // operation.outputStream = [NSOutputStream outputStreamToFileAtPath:path append:NO];
            
            [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                //  NSLog(@"Successfully downloaded file to %@", [self fileNameForResourceAtURL:request.URL.absoluteString]);
                
                
                //remove the completed request
                [self.operations removeObject:operation];
                // [NSThread detachNewThreadSelector:@selector(unzipFile:) toTarget:self withObject:path];
                
                if(  [self.operations count]==0)
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"DownloadCompleted" object:self];
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                //  NSLog(@"Error: %@", error);
                [self.operations removeObject:operation];
                
                if(  [self.operations count]==0)
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"DownloadCompleted" object:self];
            }];
            
            [operation setShouldExecuteAsBackgroundTaskWithExpirationHandler:^(void)
             {
                 // NSLog(@"BackgroundTaskWithExpirationHandler");
             }];
            
            [self.client enqueueHTTPRequestOperation:operation];
            
            [self.operations addObject:operation];
            
            //whether to start an operation might be controlled by a viewController
        }
    }
}

- (NSArray*)onGoingOperations
{
    return self.operations;
}

- (void)pauseAllDownloads
{
    for (AFDownloadRequestOperation *operation in self.operations)
    {
        [operation pause];
    }
}

- (void)resumeAllDownloads
{
    for (AFDownloadRequestOperation *operation in self.operations)
    {
        [operation resume];
    }
}

- (void)cancelAllDownloads
{
    for (AFDownloadRequestOperation *operation in self.operations)
    {
        [operation cancel];
    }
    
    [self.operations removeAllObjects];
}


- (void)resumeDownloadAtIndex:(int)index
{
    [(AFDownloadRequestOperation *)self.operations[index] resume];
}


- (void)pauseDownloadAtIndex:(int)index
{
    [(AFDownloadRequestOperation *)self.operations[index] pause];
}


- (void)cancelDownloadAtIndex:(int)index
{
    [(AFDownloadRequestOperation *)self.operations[index] cancel];
}

@end
