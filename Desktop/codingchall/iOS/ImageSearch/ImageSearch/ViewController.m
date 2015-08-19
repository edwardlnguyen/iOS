//
//  ViewController.m
//  ImageSearch
//
//  Created by edward nguyen on 8/15/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize navBar,searchField,alert,imageArray,tableView,cellHeight;



- (void) executeImageSearch:(NSString*)searchQuery{
  NSString* APIKEY = @"t7dpmz4mqnbp6t39afzfzye8";
  NSString* APISECRET = @"Gf7ucF4ahnS9jG2YCZ75hXMFCMhbyagHKSWSyKSSsvCJt";
  ConnectSdk *connectSDK = [[ConnectSdk alloc] initWithApiKey:APIKEY andApiSecret:APISECRET];
  //use API for query:
  NSDictionary *imagesResponse = [[[[connectSDK Search] Images] withPhrase:searchQuery] Execute];
  NSDictionary* images = [imagesResponse valueForKeyPath:@"images"];
  //generate array containing UIImages
  self.imageArray = [[NSMutableArray alloc]init];
  for (id obj in images){
    NSString*urlStr = [[[obj valueForKey:@"display_sizes"]valueForKey:@"uri"]objectAtIndex:0];
    NSURL *url = [NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [self.imageArray addObject:url];
  }
   [tableView reloadData];
}

//handle messages from tableview:
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  if (self.imageArray == nil) {
    return 0;
  } else {
    return [self.imageArray count];
  }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  return self.cellHeight;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  if (self.imageArray == nil){
    return nil;
  }
  
  NSURL *url = [self.imageArray objectAtIndex:indexPath.row];
  ISTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
  if (cell == nil) {
    cell = [[ISTableViewCell alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width,self.cellHeight)
                                   initWithStyle:UITableViewCellStyleDefault
                                 reuseIdentifier:@"cell"];
  }
  Class classCmp = NSClassFromString(@"UIImageView");
  for (id subview in [cell subviews]) {
    if ([subview class] == classCmp){
      [subview setImageWithURL:url];
      return cell;
    }
  }
  return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  if([searchField isFirstResponder]){
    [searchField resignFirstResponder];
    return;
  }
  UITableViewCell *thisCell = [tableView cellForRowAtIndexPath:indexPath];
  CustomIOSAlertView *imageAlert = [[CustomIOSAlertView alloc]init];
  UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 290, 500)];
  UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 270, 480)];
  [imageView setImageWithURL:[imageArray objectAtIndex:indexPath.row]];
  [demoView addSubview:imageView];
  [imageAlert setContainerView:demoView];
  [imageAlert show];
}


//handle messages from searchField:
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
  if ([searchField.text isEqualToString:@""]){
    //show alert
    [self.alert show];
  } else {
    //do image search after spellchecking
    [self executeImageSearch:[self doSpellChecking:[textField text]]];
    [self.searchField resignFirstResponder];
  }
  return YES;
}

//do some simple "spellchecking" (honestly, using a library is more efficient, but whatever)
- (NSString*) doSpellChecking: (NSString*)badStr{
  //1)split badStr into  NSMutableArray
  //2)for each object in NSMutableArray:
  //2a)remove non letter characters (because the prompt says so)
  //2b)take into account swapped adjacent letters (i.e. "teh"  vs "the")
  //2c)take into account missing letters (i.e. "th"   vs "the")
  //2d)take into account excess letters  (too complicated) (i.e. "twoo" vs "two")
  
  //1)
  NSArray *array = [badStr componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
  array = [array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF != ''"]];
  NSMutableArray *mutableArray = [[NSMutableArray alloc]init];
  //2)
  for (int i = 0; i<[array count]; i++) {
    //2a)
    [mutableArray addObject:[[[array objectAtIndex:i] componentsSeparatedByCharactersInSet:[[NSCharacterSet letterCharacterSet] invertedSet]] componentsJoinedByString:@""]];
  }
  
  //collect good string from finished NSMutableArray and return
  NSMutableString *goodStr = [[NSMutableString alloc]init];
  for (int i = 0;i < [mutableArray count]; i++) {
    [goodStr appendString:[mutableArray objectAtIndex:i]];
    [goodStr appendString:@" "];
  }
  return [NSString stringWithString:goodStr];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.cellHeight = 200;
  self.alert = [[UIAlertView alloc]initWithTitle:@"Opps!" message:@"Please enter a search for images!" delegate:nil cancelButtonTitle:@"Cool, Thanks!" otherButtonTitles:nil];
  self.searchField = [[UITextField alloc]initWithFrame:CGRectMake(0,0,self.navigationController.navigationBar.frame.size.width, 21.0)];
  [self.searchField setBorderStyle:UITextBorderStyleRoundedRect];
  [self.searchField setClearButtonMode:UITextFieldViewModeAlways];
  [self.searchField setDelegate:self];
  self.navigationItem.titleView = self.searchField;
  [self.tableView setDelegate:self];
  [self.tableView setDataSource:self];
  [searchField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
