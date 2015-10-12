//
//  ViewController.m
//  BookOrganizer
//
//  Created by Silver on 2/3/14.
//  Copyright (c) 2014 AUB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//a private method
-(void)createBooks;
-(void)sortArray;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //fill the books array
    [self createBooks];
    results = [[NSArray alloc] initWithArray:MyBooks];
    self.navigationItem.title = @"Books";
    self.searchBar.placeholder = @"Search";
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonClicked:)];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.text = @"";
    [searchBar resignFirstResponder];
    results = MyBooks;
    [self.tableView reloadData];
}

//add a canele button to the search bar while editing
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
	searchBar.showsScopeBar = YES;
	[searchBar sizeToFit];
    
	[searchBar setShowsCancelButton:YES animated:YES];
    
	return YES;
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
	searchBar.showsScopeBar = NO;
	[searchBar sizeToFit];
    
	[searchBar setShowsCancelButton:NO animated:YES];
    
	return YES;
}

-(void)removeBook:(NSString*)bookName
{
    for (Book *temp in MyBooks) {
        if ([temp.bookName isEqual:bookName]) {
            [MyBooks removeObject:temp];
            break;
        }
    }
    [self sortArray];
    results = MyBooks;
    [self.tableView reloadData];
}
-(void)addNewBook:(Book*)newBook
{
    [MyBooks addObject:newBook];
    [self sortArray];
    results = MyBooks;
    [self.tableView reloadData];
}

-(void)addButtonClicked: (id)sender
{
    AddNewBooks *add = [[AddNewBooks alloc] init];
    add.delegate = self;
    [self.navigationController pushViewController:add animated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (results.count==0 && [_searchBar.text isEqual:@""])
        results = MyBooks;
    [self sortArray];
    return [results count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"TestCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"TestCell"];
    }
    Book *temp = [results objectAtIndex:indexPath.row];
    cell.textLabel.text = temp.bookName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", temp.bookAuthor];
    cell.textLabel.textColor = [UIColor greenColor];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.searchBar resignFirstResponder];
    Book *temp = [results objectAtIndex:indexPath.row];
    DetailView *details = [[DetailView alloc] initWithBook:temp];
    details.delegate = self;
    [self.navigationController pushViewController:details animated:YES];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    //supports searching by title and by book's author
    NSPredicate *predicate  = [NSPredicate predicateWithFormat:@"bookName contains[cd] %@ OR bookAuthor contains[cd] %@", searchText,searchText];
    results = [MyBooks filteredArrayUsingPredicate:predicate];
    [self sortArray];
    [self.tableView reloadData];
}

-(void)sortArray
{
    
    NSSortDescriptor * sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"bookName" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    results = [results sortedArrayUsingDescriptors:sortDescriptors];
}

-(void)createBooks
{
    Book *book1 = [[Book alloc] initWithNameAuthorYearCategory:@"Web Design" Author:@"Issa" Year:2011 Category:2];
    Book *book2 = [[Book alloc] initWithNameAuthorYearCategory:@"Algorithms And Data Structures" Author:@"joanna" Year:2014 Category:3];
    Book *book3 = [[Book alloc] initWithNameAuthorYearCategory:@"Building Java Programs" Author:@"Lydia" Year:2010 Category:3];
    Book *book4 = [[Book alloc] initWithNameAuthorYearCategory:@"AfterWords" Author:@"Lama" Year:2012 Category:3];
    Book *book5 = [[Book alloc] initWithNameAuthorYearCategory:@"Electronics" Author:@"Verjouhi Boudakian" Year:1999 Category:4];
    Book *book6 = [[Book alloc] initWithNameAuthorYearCategory:@"Linear Algebra" Author:@"Fatima Mroue" Year:2010 Category:3];
    Book *book7 = [[Book alloc] initWithNameAuthorYearCategory:@"Ios programing" Author:@"joanna" Year:2014 Category:2];
    Book *book8 = [[Book alloc] initWithNameAuthorYearCategory:@"A Sequence for Academic Writing" Author:@"Jasminna Najjar" Year:2011 Category:2];
    MyBooks = [[NSMutableArray alloc] initWithObjects:book1,book2,book3,book4,book5,book6,book7,book8,nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
