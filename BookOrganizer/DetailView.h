//
//  DetailView.h
//  BookOrganizer
//
//  Created by Silver on 2/3/14.
//  Copyright (c) 2014 AUB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Book.h"

//adhere to mvc modal to delete files
@protocol DetailViewDelegate
-(void)removeBook:(NSString*)bookName;
@end

@interface DetailView : UIViewController <UIAlertViewDelegate>
{
    Book *bookToView;
}


-(id)initWithBook:(Book*)book;

@property(weak,nonatomic) id<DetailViewDelegate>delegate;
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
@end
