//
//  Book.h
//  BookOrganizer
//
//  Created by Silver on 2/3/14.
//  Copyright (c) 2014 AUB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject
{
    NSString *bookName;
    NSString *bookAuthor;
    NSInteger *publicationYear;
    NSInteger *bookCategory;
}
@property NSString* bookName;
@property NSString* bookAuthor;
@property NSInteger *publicationYear;
@property NSInteger *bookCategory;

-(id)initWithNameAuthorYearCategory:(NSString*)name Author:(NSString*) author Year:(NSInteger*)year Category:(NSInteger*)category;

@end
