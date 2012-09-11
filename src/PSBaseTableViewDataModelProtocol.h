//
//  BaseViewProtocol.h
//  PSTableView
//
//  Created by Prince on 2011/11/1.
//  Copyright (c) 2011年 Prince. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PSBaseTableViewDataModelProtocol <NSObject>
@required
- (void)setContent:(id)data;
@optional
@end