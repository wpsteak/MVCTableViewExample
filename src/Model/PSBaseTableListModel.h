//
//  BaseTableModel.h
//  PSTableView
//
//  Created by Prince on 2011/10/31.
//  Copyright (c) 2011年 Prince. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSBaseTableListModel : NSObject {
    NSMutableArray  *cellModels;
    NSString        *cellClassName;
}

@property (nonatomic, retain)NSMutableArray *cellModels;
@property (nonatomic, retain)NSString       *cellClassName;

@end
