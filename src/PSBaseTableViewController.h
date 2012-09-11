//
//  iPhoneBaseTableView.h
//  PSTableView
//
//  Created by Prince on 2011/10/31.
//  Copyright (c) 2011年 Prince. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSBaseTableListModel.h"

@protocol PSBaseTableViewProtocol
@required
- (void)refreshTableViewToTop:(BOOL)animated;
- (void)refreshTableView;
@optional
- (UIView *)customTableHeaderView;
- (UIView *)customTableFooterView;
- (UIView *)customSectionViewInSection:(NSInteger)section;
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface PSBaseTableViewController : UIViewController <PSBaseTableViewProtocol, UITableViewDelegate, UITableViewDataSource>{
	UITableView *_tableView;
    NSMutableArray *_dataArray;
}

@property (nonatomic,retain)UITableView *tableView;
@property (nonatomic,retain)NSMutableArray *dataArray;

- (void)refreshTableView;
- (UIView *)customTableHeaderView;
- (UIView *)customTableFooterView;
- (UIView *)customSectionViewInSection:(NSInteger)section;

- (PSBaseTableListModel *)getTableListModelInSection:(NSInteger)section;
- (NSMutableArray *)getCellModelListInSection:(NSInteger)section;
@end
