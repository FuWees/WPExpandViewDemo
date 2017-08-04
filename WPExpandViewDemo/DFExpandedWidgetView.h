//
//  DFExpandedWidgetView.h
//  TzyjMainProj
//
//  Created by wupeng on 2017/8/4.
//  Copyright © 2017年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DFExpandedWidgetView : UIView

@property (nonatomic, copy) void(^onClickExpandedBtnBlock)(NSInteger index);


- (instancetype)initWithFrame:(CGRect)frame Titles:(NSArray *)titles;

@end
