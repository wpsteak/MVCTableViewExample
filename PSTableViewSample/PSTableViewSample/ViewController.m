//
//  ViewController.m
//  PSTableViewSample
//
//  Created by Prince on 12/9/11.
//  Copyright (c) 2012年 Prince. All rights reserved.
//

#import "ViewController.h"
#import "CellModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)prepareData {
    self.dataArray = nil;
    self.dataArray = [NSMutableArray array];
    
    PSBaseTableListModel *sectionList = [[PSBaseTableListModel alloc] init];
    sectionList.cellClassName = @"TableCell";
 
    for (int i = 0; i < 10; i++) {
        CellModel *model = [[CellModel alloc] init];
        model.title = [NSString stringWithFormat:@"Build-in Style #%i",i];
        [sectionList.cellModels addObject:model];
    }

    [self.dataArray addObject:sectionList];    
    [self refreshTableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self prepareData];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}



@end
