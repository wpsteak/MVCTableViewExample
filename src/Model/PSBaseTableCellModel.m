//
//  BaseTableCellModel.m
//  PSTableView
//
//  Created by Prince on 2011/10/31.
//  Copyright (c) 2011年 Prince. All rights reserved.
//

#import "PSBaseTableCellModel.h"

@implementation PSBaseTableCellModel 
@synthesize thumbUrlStr;
@synthesize title;
@synthesize description;
@synthesize selected;

- (void)importFromObject:(id)obj {}

- (id)valueForUndefinedKey:(NSString *)key {
    return nil;
}

@end
