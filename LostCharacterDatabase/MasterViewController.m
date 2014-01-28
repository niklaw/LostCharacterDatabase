//
//  ViewController.m
//  LostCharacterDatabase
//
//  Created by Nicholas Petersen on 1/28/14.
//  Copyright (c) 2014 Nicholas Petersen. All rights reserved.
//

#import "MasterViewController.h"
@import CoreData;

@interface MasterViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation MasterViewController
{
    
    NSMutableArray *lostCharacters;
    __weak IBOutlet UITextField *myTextField;
    __weak IBOutlet UITableView *myTableView;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    lostCharacters = [NSMutableArray new];
    [self load];

    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return lostCharacters.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"***%@", lostCharacters);
    UITableViewCell *cell = [myTableView dequeueReusableCellWithIdentifier:@"LostID"];
    NSDictionary *lostDictionary = lostCharacters[indexPath.row];
    
    cell.textLabel.text = [lostDictionary valueForKey:@"actor"];
    cell.detailTextLabel.text = [lostDictionary valueForKey:@"passenger"];
    return cell;
}

-(void)load
{
    NSURL *plist = [[self documentsDirectory] URLByAppendingPathComponent:@"lost.plist"];
    lostCharacters = [NSMutableArray arrayWithContentsOfURL:plist];
    NSLog(@"Fuck you %@", lostCharacters);
    
}

-(NSURL*)documentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]lastObject];
}



@end
