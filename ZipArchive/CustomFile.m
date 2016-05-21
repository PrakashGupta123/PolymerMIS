//
//  CustomFile.m
//  iPadCustomDocumentApp
//
//  Created by Marin Todorov on 4/6/10.
//  Copyright 2010 Marin Todorov. All rights reserved.
//

#import "CustomFile.h"


@implementation CustomFile

@synthesize filePath, title, text, photo;

-(id)initWithFilePath:(NSString*)initPath
{
	self = [super init];
	if (self != nil) {
		
		//set the file path
		if (initPath != nil) {
			self.filePath = initPath;
		}
		
	}
	return self;
}

-(BOOL)loadFile
{
	//create a temp directory
	NSFileManager* fileManager = [NSFileManager defaultManager];
	
	NSString* documentsDir = [filePath stringByDeletingLastPathComponent];
	NSString *tmpPath = [documentsDir stringByAppendingPathComponent:@"tmp"];
	[fileManager createDirectoryAtPath:tmpPath attributes:nil];

	ZipArchive *zip = [[ZipArchive alloc] init];	
	
	BOOL result = NO;
	
	if([zip UnzipOpenFile:filePath]) {
		//zip file is there
		if ([zip UnzipFileTo:tmpPath overWrite:YES]) {
			//unzipped successfully
			NSLog(@"Archive unzip Success");
			result= YES;
		} else {
			NSLog(@"Failure To Extract Archive, maybe password?");
		}
	} else  {
		NSLog(@"Failure To Open Archive");
	}
	
	if (result==YES) {
		NSString* textFile = [tmpPath stringByAppendingPathComponent:@"texts.plist"];
		NSDictionary* texts = [NSDictionary dictionaryWithContentsOfFile:textFile];
		self.title = (NSString*)[texts objectForKey:@"title"];
		self.text  = (NSString*)[texts objectForKey:@"text"];
		
		NSString* tmpPhotoPath = [tmpPath stringByAppendingPathComponent:@"photo0.png"];
		
		if ( [fileManager fileExistsAtPath:tmpPhotoPath] ) {
			
			//We will use imageWithData because imageWithContentsOfFile won't load the contents of a file 
			//which's being deleted few lines later
			//try the next line (which fails to show the image in the app) yourself
			//self.photo0 = [UIImage imageWithContentsOfFile:tmpPhotoPath];
			
			//and this is the working line
			self.photo = [UIImage imageWithData: [NSData dataWithContentsOfFile:tmpPhotoPath] ];
			
		}

	}
	//do cleanup
	[fileManager removeItemAtPath:tmpPath error:NULL];
	//[zip release];

	return result;
}

-(void)saveFile
{
	//create a temp directory
	NSFileManager* fileManager = [NSFileManager defaultManager];

	NSString* documentsDir = [filePath stringByDeletingLastPathComponent];
	NSString *tmpPath = [documentsDir stringByAppendingPathComponent:@"tmp"];
	[fileManager createDirectoryAtPath:tmpPath attributes:nil];
	
	ZipArchive *zip = [[ZipArchive alloc] init];	
	[zip CreateZipFile2:self.filePath];
	
	//save the texts
	NSDictionary* texts = [NSDictionary dictionaryWithObjectsAndKeys:self.title,@"title",self.text,@"text",nil];
	NSString* textsFile = [tmpPath stringByAppendingPathComponent:@"texts.plist"];

	//save the image and add them to the zip file
	if (self.photo!=nil) {
		NSString* photoFile = [tmpPath stringByAppendingPathComponent:@"photo0.png"];
		NSData *imageData = [NSData dataWithData:UIImagePNGRepresentation(self.photo)];
		[imageData writeToFile:photoFile atomically:YES];
		[zip addFileToZip:photoFile newname:@"photo0.png"];
		[fileManager removeItemAtPath:photoFile error:NULL];
	}
	
	[texts writeToFile:textsFile atomically:YES];
	[zip addFileToZip:textsFile newname:@"texts.plist"];
	[fileManager removeItemAtPath:textsFile error:NULL];
	
	if( ![zip CloseZipFile2] )
	{
		// error handler here
		
	}
	
	[fileManager removeItemAtPath:tmpPath error:NULL];
	
	//[zip release];
}

@end
