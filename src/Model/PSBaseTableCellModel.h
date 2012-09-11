//
//  BaseTableCellModel.h
//  PSTableView
//
//  Created by Prince on 2011/10/31.
//  Copyright (c) 2011年 Prince. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSBaseTableCellModel : NSObject {
    NSString *thumbUrlStr;
    NSString *title;
    NSString *description;
    BOOL selected;
}

@property (nonatomic, strong)NSString *thumbUrlStr;
@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSString *description;
@property (nonatomic, assign)BOOL selected;

- (void)importFromObject:(id)obj; //from DB or API

@end
