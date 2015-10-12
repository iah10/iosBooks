//
//  Book.m
//  BookOrganizer
//
//  Created by Silver on 2/3/14.
//  Copyright (c) 2014 AUB. All rights reserved.
//

#import "Book.h"

@implementation Book


@synthesize bookName;
@synthesize bookAuthor;
@synthesize bookCategory;
@synthesize publicationYear;

-(id)initWithNameAuthorYearCategory:(NSString*)name Author:(NSString*) author Year:(NSInteger*)year Category:(NSInteger*)category
{
    if(self = [super init])
    {
        bookName = name;
        bookAuthor = author;
        publicationYear = year;
        bookCategory = category;
    }
    return self;
}
@end
