//
//  BaseTableModel.m
//  PSTableView
//
//  Created by Prince on 2011/10/31.
//  Copyright (c) 2011年 Prince. All rights reserved.
//

#import "PSBaseTableListModel.h"

@implementation PSBaseTableListModel
@synthesize cellModels;
@synthesize cellClassName;

- (id)init{
    self = [super init];
    if (self) {
        self.cellModels = [NSMutableArray array];
    }
    return self;
}

- (void)dealloc {
    self.cellModels = nil;
    self.cellClassName = nil;
}
@end
