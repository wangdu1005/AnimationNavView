//
//  ANVListViewController.m
//  AnimationNavView
//
//  Created by wangdu on 2018/11/11.
//  Copyright © 2018 zx. All rights reserved.
//

#import "ANVListViewController.h"
#import "GSKExampleDataCell.h"

#import "UINavigationController+Transparency.h"
#import "GSKExampleTableViewController.h"

@interface ANVListViewController () <GSKExampleDataCellDelegate>
@property (nonatomic) NSArray *exampleDatas;
@end

@implementation ANVListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"ANView";
    self.tableView.rowHeight = [GSKExampleDataCell height];
    
    [GSKExampleDataCell registerIn:self.tableView];
    
    GSKExampleData *nib = [GSKExampleData dataWithTitle:@"From a XIB"
                                      headerViewNibName:@"GSKNibStretchyHeaderView"];
    
    // Not working
    nib.headerViewInitialHeight = 200;
    
    self.exampleDatas = @[nib];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController gsk_setNavigationBarTransparent:NO animated:YES];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor blackColor]}];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.exampleDatas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GSKExampleDataCell *cell = [tableView dequeueReusableCellWithIdentifier:[GSKExampleDataCell reuseIdentifier]];
    cell.data = self.exampleDatas[indexPath.row];
    cell.delegate = self;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

#pragma mark - GSKExampleDataCellDelegate

- (void)exampleDataCellDidTapTableViewButton:(GSKExampleDataCell *)cell {
    GSKExampleTableViewController *viewController = [[GSKExampleTableViewController alloc] initWithData:cell.data];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
