//
//  BaseTableCell.h
//  PSTableView
//
//  Created by Prince on 2011/10/31.
//  Copyright (c) 2011年 Prince. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSBaseTableViewDataModelProtocol.h"

@interface PSBaseTableCell : UITableViewCell <PSBaseTableViewDataModelProtocol>

- (void)setContent:(id)data;

@end
