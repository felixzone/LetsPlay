//
//  FirstViewController.m
//  LetsPlay
//
//  Created by Felix Liu on 22/10/2015.
//  Copyright © 2015 Felix Liu. All rights reserved.
//

#import "HomeViewController.h"
#import "KCContract.h"
#import "KCContractGroup.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *homeTableView;
@property (nonatomic, strong)NSMutableArray *contracts;
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
    self.contracts = [[NSMutableArray alloc] init];
    
    KCContract *contract1 = [[KCContract alloc] initWithFirstName:@"felix" andLastName:@"liu" andPhoneNumber:@"13671720675"];
    KCContract *contract2 = [[KCContract alloc] initWithFirstName:@"fiona" andLastName:@"zhang" andPhoneNumber:@"18750590105"];
    KCContractGroup *group1 = [[KCContractGroup alloc] initWithName:@"f" andDetail:@"With names beginning with f" andContracts:[NSMutableArray arrayWithObjects:contract1,contract2, nil]];
    [self.contracts addObject:group1];
    
    KCContract *contract3 = [[KCContract alloc] initWithFirstName:@"menghua" andLastName:@"liu" andPhoneNumber:@"13671720675"];
    KCContract *contract4 = [[KCContract alloc] initWithFirstName:@"mengliang" andLastName:@"liu" andPhoneNumber:@"18750590105"];
    KCContractGroup *group2 = [[KCContractGroup alloc] initWithName:@"m" andDetail:@"With names beginning with m" andContracts:[NSMutableArray arrayWithObjects:contract3,contract4, nil]];
    [self.contracts addObject:group2];
    
    KCContract *contract5=[[KCContract alloc]initWithFirstName:@"Lee" andLastName:@"Terry" andPhoneNumber:@"18500131238"];
    KCContract *contract6=[[KCContract alloc] initWithFirstName:@"Lee" andLastName:@"Jack" andPhoneNumber:@"18500131239"];
    KCContract *contract7=[[KCContract alloc] initWithFirstName:@"Lee" andLastName:@"Rose" andPhoneNumber:@"18500131240"];
    KCContractGroup *group3=[[KCContractGroup alloc] initWithName:@"L" andDetail:@"With names beginning with L" andContracts:[NSMutableArray arrayWithObjects:contract5,contract6,contract7, nil]];
    [self.contracts addObject:group3];
    
    KCContract *contact8=[KCContract initWithFirstName:@"Wang" andLastName:@"Stephone" andPhoneNumber:@"18500131241"];
    KCContract *contact9=[KCContract initWithFirstName:@"Wang" andLastName:@"Lucy" andPhoneNumber:@"18500131242"];
    KCContract *contact10=[KCContract initWithFirstName:@"Wang" andLastName:@"Lily" andPhoneNumber:@"18500131243"];
    KCContract *contact11=[KCContract initWithFirstName:@"Wang" andLastName:@"Emily" andPhoneNumber:@"18500131244"];
    KCContract *contact12=[KCContract initWithFirstName:@"Wang" andLastName:@"Andy" andPhoneNumber:@"18500131245"];
    KCContractGroup *group4=[KCContractGroup initWithName:@"W" andDetail:@"With names beginning with W" andContracts:[NSMutableArray arrayWithObjects:contact8,contact9,contact10,contact11,contact12, nil]];
    [self.contracts addObject:group4];
    
    
    KCContract *contact13=[KCContract initWithFirstName:@"Zhang" andLastName:@"Joy" andPhoneNumber:@"18500131246"];
    KCContract *contact14=[KCContract initWithFirstName:@"Zhang" andLastName:@"Vivan" andPhoneNumber:@"18500131247"];
    KCContract *contact15=[KCContract initWithFirstName:@"Zhang" andLastName:@"Joyse" andPhoneNumber:@"18500131248"];
    KCContractGroup *group5=[[KCContractGroup alloc] initWithName:@"Z" andDetail:@"With names beginning with Z" andContracts:[NSMutableArray arrayWithObjects:contact13,contact14,contact15, nil]];
    [self.contracts addObject:group5];
    NSLog(@"end init data");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.contracts.count;
}

#pragma mark return the number of rows per group
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"numberOfRowsInSection %li", (long)section);
    KCContractGroup *group = self.contracts[section];
    return group.contracts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cellForRowAtIndexPath indexPath(%li,%li)",indexPath.section,indexPath.row);
    KCContractGroup *group = self.contracts[indexPath.section];
    KCContract *contract = group.contracts[indexPath.row];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = [contract getName];
    cell.detailTextLabel.text = contract.phoneNumber;
    return cell;
}

#pragma mark return group title
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSLog(@"titleForHeaderInSection %li", section);
    KCContractGroup *group = self.contracts[section];
    return group.name;
    
}

#pragma mark return group detail
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    NSLog(@"titleForFooterInSection %li",section);
    KCContractGroup *group = self.contracts[section];
    return group.detail;
}

#pragma mark group index
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSLog(@"create index for group");
    NSMutableArray *index = [[NSMutableArray alloc] init];
    for (KCContractGroup *group in self.contracts) {
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
