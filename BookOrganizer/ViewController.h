//
//  ViewController.h
//  BookOrganizer
//
//  Created by Silver on 2/3/14.
//  Copyright (c) 2014 AUB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Book.h"
#import "AddNewBooks.h"
#import "DetailView.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate
,AddNewBooksDelegate,DetailViewDelegate>
{
    NSMutableArray *MyBooks;
    NSArray *results;
}
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

//delagate methods for adding and removig books
-(void)removeBook:(NSString*)bookName;
-(void)addNewBook:(Book*)newBook;

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText;
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;

@end
