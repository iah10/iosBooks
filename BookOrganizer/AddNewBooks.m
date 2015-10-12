//
//  AddNewBooksDelegate.m
//  BookOrganizer
//
//  Created by Silver on 2/3/14.
//  Copyright (c) 2014 AUB. All rights reserved.
//

#import "AddNewBooks.h"

@interface AddNewBooks ()

@end

@implementation AddNewBooks

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Book Info";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonClicked:)];
    self.txtBookName.delegate = self;
    self.txtBookAuthor.delegate = self;
    self.txtYearOfPublication.delegate = self;
    self.txtCategory.delegate = self;
}

-(void)doneButtonClicked:(id)sender
{
    Book *newBook = [[Book alloc] init];
    if (  ![[self.txtBookName.text stringByTrimmingCharactersInSet:
             [NSCharacterSet whitespaceCharacterSet]] isEqual:@""]
        && ![[self.txtBookAuthor.text stringByTrimmingCharactersInSet:
              [NSCharacterSet whitespaceCharacterSet]] isEqual:@""]
        && ![self.txtYearOfPublication.text isEqual:@""]
        && ![self.txtCategory.text isEqual:@""])
    {
        newBook.bookName = [self.txtBookName.text stringByTrimmingCharactersInSet:
                            [NSCharacterSet whitespaceCharacterSet]];
        newBook.bookAuthor = [self.txtBookAuthor.text stringByTrimmingCharactersInSet:
                              [NSCharacterSet whitespaceCharacterSet]];
        newBook.publicationYear = [self.txtYearOfPublication.text integerValue];
        newBook.bookCategory = [self.txtCategory.text integerValue];
        [self.delegate addNewBook:newBook];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Some Fields are missing or has invalid input" delegate:self cancelButtonTitle:@"Fix" otherButtonTitles:nil, nil];
        [message show];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
