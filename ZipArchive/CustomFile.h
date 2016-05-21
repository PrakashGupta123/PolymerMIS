//
//  CustomFile.h
//  iPadCustomDocumentApp
//
//  Created by Marin Todorov on 4/6/10.
//  Copyright 2010 Marin Todorov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZipArchive.h"

#define kFileExtension @"mtt"

@interface CustomFile : NSObject {

	NSString* filePath;
	
	//the file contents	
	NSString* title;
	NSString* text;
	UIImage* photo;
	
}

@property (nonatomic, retain) NSString* filePath;
@property (nonatomic, retain) NSString* title;
@property (nonatomic, retain) NSString* text;
@property (nonatomic, retain) UIImage* photo;

-(id)initWithFilePath:(NSString*)initPath;

-(BOOL)loadFile;
-(void)saveFile;

@end
