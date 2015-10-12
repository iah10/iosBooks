//
//  AddNewBooksDelegate.h
//  BookOrganizer
//
//  Created by Silver on 2/3/14.
//  Copyright (c) 2014 AUB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Book.h"

//mvc modal
@protocol AddNewBooksDelegate
-(void)addNewBook:(Book*)newBook;
@end

@interface AddNewBooks : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *txtBookName;
@property (strong, nonatomic) IBOutlet UITextField *txtBookAuthor;
@property (strong, nonatomic) IBOutlet UITextField *txtYearOfPublication;
@property (strong, nonatomic) IBOutlet UITextField *txtCategory;

@property (weak, nonatomic) id<AddNewBooksDelegate> delegate;

-(BOOL)textFieldShouldReturn:(UITextField *)textField;
@end
