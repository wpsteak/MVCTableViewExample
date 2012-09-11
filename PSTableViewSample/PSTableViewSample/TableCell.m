//
//  TableCell.m
//  PSTableViewSample
//
//  Created by Prince on 12/9/11.
//  Copyright (c) 2012年 Prince. All rights reserved.
//

#import "TableCell.h"
#import "CellModel.h"

@implementation TableCell

- (void)setContent:(id)data {
    if (![data isKindOfClass:[CellModel class]]) {
        return ;
    }
    
    CellModel *model = (CellModel *)data;
    
    [self.textLabel setText:model.title];
}

@end
