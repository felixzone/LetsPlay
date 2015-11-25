//
//  FirstViewController.m
//  LetsPlay
//
//  Created by Felix Liu on 22/10/2015.
//  Copyright © 2015 Felix Liu. All rights reserved.
//

#import "HomeViewController.h"
#import "KCContact.h"
#import "KCContactGroup.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *homeTableView;
@property (nonatomic, strong)NSMutableArray *contacts;
@property (nonatomic, strong)NSMutableArray *tableArray, *foodImageArray, *timeArray;
@property (nonatomic, strong)UITableViewCell *homeTableViewCell;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    
    if (self.homeTableView == nil) {
        self.homeTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    }
    
    self.homeTableView.dataSource = self;
    
    self.homeTableView.delegate = self;
    
    //[self.view addSubview:self.homeTableView];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark load data
-(void)initData {
    NSLog(@"begin init data");
    self.contacts = [[NSMutableArray alloc] init];
    
    KCContact *contract1 = [[KCContact alloc] initWithFirstName:@"felix" andLastName:@"liu" andPhoneNumber:@"13671720675"];
    KCContact *contract2 = [[KCContact alloc] initWithFirstName:@"fiona" andLastName:@"zhang" andPhoneNumber:@"18750590105"];
    KCContactGroup *group1 = [[KCContactGroup alloc] initWithName:@"f" andDetail:@"With names beginning with f" andContacts:[NSMutableArray arrayWithObjects:contract1,contract2, nil]];
    [self.contacts addObject:group1];
    
    KCContact *contract3 = [[KCContact alloc] initWithFirstName:@"menghua" andLastName:@"liu" andPhoneNumber:@"13671720675"];
    KCContact *contract4 = [[KCContact alloc] initWithFirstName:@"mengliang" andLastName:@"liu" andPhoneNumber:@"18750590105"];
    KCContactGroup *group2 = [[KCContactGroup alloc] initWithName:@"m" andDetail:@"With names beginning with m" andContacts:[NSMutableArray arrayWithObjects:contract3,contract4, nil]];
    [self.contacts addObject:group2];
    
    KCContact *contract5=[[KCContact alloc]initWithFirstName:@"Lee" andLastName:@"Terry" andPhoneNumber:@"18500131238"];
    KCContact *contract6=[[KCContact alloc] initWithFirstName:@"Lee" andLastName:@"Jack" andPhoneNumber:@"18500131239"];
    KCContact *contract7=[[KCContact alloc] initWithFirstName:@"Lee" andLastName:@"Rose" andPhoneNumber:@"18500131240"];
    KCContactGroup *group3=[[KCContactGroup alloc] initWithName:@"L" andDetail:@"With names beginning with L" andContacts:[NSMutableArray arrayWithObjects:contract5,contract6,contract7, nil]];
    [self.contacts addObject:group3];
    
    KCContact *contact8=[KCContact initWithFirstName:@"Wang" andLastName:@"Stephone" andPhoneNumber:@"18500131241"];
    KCContact *contact9=[KCContact initWithFirstName:@"Wang" andLastName:@"Lucy" andPhoneNumber:@"18500131242"];
    KCContact *contact10=[KCContact initWithFirstName:@"Wang" andLastName:@"Lily" andPhoneNumber:@"18500131243"];
    KCContact *contact11=[KCContact initWithFirstName:@"Wang" andLastName:@"Emily" andPhoneNumber:@"18500131244"];
    KCContact *contact12=[KCContact initWithFirstName:@"Wang" andLastName:@"Andy" andPhoneNumber:@"18500131245"];
    KCContactGroup *group4=[KCContactGroup initWithName:@"W" andDetail:@"With names beginning with W" andContacts:[NSMutableArray arrayWithObjects:contact8,contact9,contact10,contact11,contact12, nil]];
    [self.contacts addObject:group4];
    
    
    KCContact *contact13=[KCContact initWithFirstName:@"Zhang" andLastName:@"Joy" andPhoneNumber:@"18500131246"];
    KCContact *contact14=[KCContact initWithFirstName:@"Zhang" andLastName:@"Vivan" andPhoneNumber:@"18500131247"];
    KCContact *contact15=[KCContact initWithFirstName:@"Zhang" andLastName:@"Joyse" andPhoneNumber:@"18500131248"];
    KCContactGroup *group5=[[KCContactGroup alloc] initWithName:@"Z" andDetail:@"With names beginning with Z" andContacts:[NSMutableArray arrayWithObjects:contact13,contact14,contact15, nil]];
    [self.contacts addObject:group5];
    NSLog(@"end init data");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.contacts.count;
}

#pragma mark return the number of rows per group
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"numberOfRowsInSection %li", (long)section);
    KCContactGroup *group = self.contacts[section];
    return group.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cellForRowAtIndexPath indexPath(%li,%li)",indexPath.section,indexPath.row);
    KCContactGroup *group = self.contacts[indexPath.section];
    KCContact *contract = group.contacts[indexPath.row];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = [contract getName];
    cell.detailTextLabel.text = contract.phoneNumber;
    return cell;
}

#pragma mark return group title
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSLog(@"titleForHeaderInSection %li", section);
    KCContactGroup *group = self.contacts[section];
    return group.name;
    
}

#pragma mark return group detail
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    NSLog(@"titleForFooterInSection %li",section);
    KCContactGroup *group = self.contacts[section];
    return group.detail;
}

#pragma mark group index
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSLog(@"create index for group");
    NSMutableArray *index = [[NSMutableArray alloc] init];
    for (KCContactGroup *group in self.contacts) {
        [index addObject:group.name];
    }
    return index;
}

#pragma mark UITableViewDelegate
#pragma mark set the height for header
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    NSLog(@"set the height for header");
    if (section == 0) {
        return 50;
    }
    return 40;
}

#pragma mark set the height for row
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"set the height for row");
    return 80;
}

#pragma mark set the height for footer
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    NSLog(@"set the height for footer");
    return 40;
}

#pragma mark estimated height
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"set estimated height for row");
    return 40;
}


@end
