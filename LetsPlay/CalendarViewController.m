//
//  SecondViewController.m
//  LetsPlay
//
//  Created by Felix Liu on 22/10/2015.
//  Copyright © 2015 Felix Liu. All rights reserved.
//

#import "CalendarViewController.h"
#import "WeiboStatus.h"
#import "WeiboStatusTableViewCell.h"

@interface CalendarViewController () <UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate> {
    UITableView *_tableView;
    NSMutableArray *_status;
    NSMutableArray *_statusCells;
}

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initData];
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark load data
- (void)initData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"StatusInfo" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    NSLog(@"current path %@",path);
    _status = [[NSMutableArray alloc]init];
    _statusCells = [[NSMutableArray alloc]init];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [_status addObject:[WeiboStatus statusWithDictionary:obj]];
        WeiboStatusTableViewCell *cell = [[WeiboStatusTableViewCell alloc]init];
        [_statusCells addObject:cell];
    }];
}

#pragma mark datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _status.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndentifier = @"UITableViewCellIndentifierKey1";
    WeiboStatusTableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[WeiboStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    WeiboStatus *status = _status[indexPath.row];
    cell.status = status;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeiboStatusTableViewCell *cell = _statusCells[indexPath.row];
    cell.status = _status[indexPath.row];
    return cell.height;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
