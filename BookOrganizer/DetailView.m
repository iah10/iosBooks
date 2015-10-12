//
//  DetailView.m
//  BookOrganizer
//
//  Created by Silver on 2/3/14.
//  Copyright (c) 2014 AUB. All rights reserved.
//

#import "DetailView.h"

@interface DetailView ()

@end

@implementation DetailView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithBook:(Book *)book
{
    if (self = [super init])
    {
        bookToView = book;
        //name Label
        UILabel *LblBookName = [[UILabel alloc] initWithFrame:CGRectMake(65, 206, 230, 30)];
        LblBookName.text = bookToView.bookName;
        [LblBookName  setAutoresizingMask:UIViewContentModeScaleAspectFill];
        [LblBookName  setLineBreakMode:UILineBreakModeClip];
        LblBookName .adjustsFontSizeToFitWidth=YES;//This is main for shrinking font
        [self.view addSubview:LblBookName];
        //Author Label
        UILabel *LblBookAuthor = [[UILabel alloc] initWithFrame:CGRectMake(65, 279, 230, 30)];
        LblBookAuthor.text = bookToView.bookAuthor;
        [LblBookAuthor setAutoresizingMask:UIViewContentModeScaleAspectFill];
        [LblBookAuthor setLineBreakMode:UILineBreakModeClip];
        LblBookAuthor.adjustsFontSizeToFitWidth=YES;//This is main for shrinking font
        [self.view addSubview:LblBookAuthor];
        //Year Of publication Label
        UILabel *LblYearOfPubl = [[UILabel alloc] initWithFrame:CGRectMake(65, 357, 230, 30)];
        LblYearOfPubl.text = [NSString stringWithFormat: @"%d", (int)bookToView.publicationYear];
        [self.view addSubview:LblYearOfPubl];
        //category Label
        UILabel *LblBookCategory = [[UILabel alloc] initWithFrame:CGRectMake(65, 420, 230, 30)];
        LblBookCategory.text =[NSString stringWithFormat: @"%d", (int)bookToView.bookCategory];
        [self.view addSubview:LblBookCategory];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Book Detail";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(trashButtonClicked:)];
}

-(void)trashButtonClicked:(id)sender
{
    //ask for confirmation
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Delete" message:@"Are You sure you want to Delete this Book ?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Delete", nil];
    [message show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex ==alertView.cancelButtonIndex) {
        
    }else if (buttonIndex ==alertView.firstOtherButtonIndex){
        [self.delegate removeBook:bookToView.bookName];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
