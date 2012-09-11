//
//  FirstTableViewController.m
//  PSTableViewSample
//
//  Created by Prince on 12/9/11.
//  Copyright (c) 2012年 Prince. All rights reserved.
//

#import "CustomStyleViewController.h"
#import "CellModel.h"

@interface CustomStyleViewController ()

@end

@implementation CustomStyleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)prepareData {
    self.dataArray = nil;
    self.dataArray = [NSMutableArray array];
    
    PSBaseTableListModel *sectionList = [[PSBaseTableListModel alloc] init];
    sectionList.cellClassName = @"CustomTableCell1";
    
    for (int i = 0; i < 10; i++) {
        CellModel *model = [[CellModel alloc] init];
        model.title = [NSString stringWithFormat:@"Custom Style #%i",i];
        model.description = [NSString stringWithFormat:@"Custom Style Description #%i",i];
        [sectionList.cellModels addObject:model];
    }
    
    [self.dataArray addObject:sectionList];
    [self refreshTableView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self prepareData];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableView

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}


#pragma mark - UITableViewDataSource
@end
