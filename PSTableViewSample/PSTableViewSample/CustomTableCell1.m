//
//  CustomTableCell1.m
//  PSTableViewSample
//
//  Created by Prince on 12/9/11.
//  Copyright (c) 2012年 Prince. All rights reserved.
//

#import "CustomTableCell1.h"
#import "CellModel.h"

@interface CustomTableCell1 () {
    UILabel *_titleLabel;
    UILabel *_descriptionLabel;
}

@end

@implementation CustomTableCell1

-(void)prepareControl {
    self.backgroundColor = [UIColor lightGrayColor];
    self.selectionStyle = UITableViewCellSelectionStyleGray;
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 17, 300, 20)];
    [_titleLabel setBackgroundColor:[UIColor clearColor]];
    [_titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [_titleLabel setTextColor:[UIColor colorWithRed:26/255 green:26/255 blue:26/255 alpha:1.0f ]];
    [_titleLabel setShadowColor:[UIColor whiteColor]];
    [_titleLabel setShadowOffset:CGSizeMake(1, 1)];
    
    _descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 38, 300, 20)];
    [_descriptionLabel setBackgroundColor:[UIColor clearColor]];
    [_descriptionLabel setFont:[UIFont systemFontOfSize:10.0f]];
    [_descriptionLabel setTextColor:[UIColor colorWithRed:112/255 green:112/255 blue:112/255 alpha:1.0f ]];
    [_descriptionLabel setShadowColor:[UIColor whiteColor]];
    [_descriptionLabel setShadowOffset:CGSizeMake(1, 1)];
        
    [self addSubview:_titleLabel];
    [self addSubview:_descriptionLabel];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self prepareControl];
    }
    return self;
}

- (void)setContent:(id)data {
    if (![data isKindOfClass:[CellModel class]]) {
        return ;
    }
    
    CellModel *model = (CellModel *)data;
    
    [_titleLabel setText:model.title];
    [_descriptionLabel setText:model.description];
}

@end
