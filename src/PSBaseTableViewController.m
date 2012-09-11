//
//  iPhoneBaseTableView.m
//  PSTableView
//
//  Created by Prince on 2011/10/31.
//  Copyright (c) 2011年 Prince. All rights reserved.
//

#import "PSBaseTableViewController.h"
#import "PSBaseTableCellModel.h"
#import "PSBaseTableCell.h"
#import "PSBaseTableViewDataModelProtocol.h"

@interface UIView (BaseTableViewDataModelProtocol) <PSBaseTableViewDataModelProtocol> 
@end

@implementation UIView (BaseTableViewDataModelProtocol)
- (void)setContent:(id)data{}
@end

@implementation PSBaseTableViewController
@synthesize tableView = _tableView;
@synthesize dataArray = _dataArray;

- (void)dealloc {
    NSLog(@"dealloc");
    self.tableView.tableHeaderView = nil;
    self.tableView.tableFooterView = nil;
    self.tableView = nil;
    self.dataArray = nil;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Prepare Data

- (void)setData:(id)data {}

- (void)refreshTableView {
    [self.tableView reloadData];
}

- (void)refreshTableViewToTop:(BOOL)animated {
    [self.tableView reloadData];
    [self.tableView setContentOffset:CGPointMake(0, 0) animated:animated];
}

- (UIView *)customTableHeaderView {  //TableView.headerView
    return nil;
}

- (UIView *)customTableFooterView {  //TableView.footerView
    return nil;
}

- (UIView *)customSectionViewInSection:(NSInteger)section {
    return nil;
}

#pragma mark - Get Info

- (PSBaseTableListModel *)getTableListModelInSection:(NSInteger)section {
    return [self.dataArray objectAtIndex:section];
}

- (NSMutableArray *)getCellModelListInSection:(NSInteger)section {
    PSBaseTableListModel *bookList = (PSBaseTableListModel *)[self.dataArray objectAtIndex:section];    
    return bookList.cellModels;
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [_tableView setTableHeaderView:self.customTableHeaderView];
    [_tableView setTableFooterView:self.customTableFooterView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.tableView];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark - UITableViewDataSource
#pragma mark Section

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    UIView *sectionView = [self customSectionViewInSection:section];
    CGFloat height = sectionView ? CGRectGetHeight(sectionView.bounds) + 5.0f : 0.0f;
    return height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    PSBaseTableListModel *model = [self.dataArray objectAtIndex:section];
    UIView *sectionView = [self customSectionViewInSection:section];
    if ([sectionView respondsToSelector:@selector(setContent:)]) {
        [sectionView setContent:model];
    }

    return sectionView;
}

#pragma mark Cell

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    PSBaseTableListModel *model = [self.dataArray objectAtIndex:section];
    return [model.cellModels count];
}

#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PSBaseTableListModel *model = [self getTableListModelInSection:indexPath.section];
    PSBaseTableCellModel *cellModel = [model.cellModels objectAtIndex:indexPath.row];
    
    NSString *cellClassName = model.cellClassName;
    Class cellClass = NSClassFromString(cellClassName);
    if (!cellClass) {
        cellClass = NSClassFromString(@"UITableViewCell");
        cellClassName = @"UITableViewCell";
    }
    
    id cell = [tableView dequeueReusableCellWithIdentifier:cellClassName];
    if (!cell) {
        cell = (PSBaseTableCell *)[[NSClassFromString(cellClassName) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellClassName];
    }
    
    if ([cell respondsToSelector:@selector(setContent:)]) {
        [cell setContent:cellModel];
    }
    
    return cell;
}

@end
