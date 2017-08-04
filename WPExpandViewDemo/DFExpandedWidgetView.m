//
//  DFExpandedWidgetView.m
//  TzyjMainProj
//
//  Created by wupeng on 2017/8/4.
//  Copyright © 2017年 Jason. All rights reserved.
//

#import "DFExpandedWidgetView.h"

#define Expanded_Main_Width 20
#define Expanded_Index_Width 60
#define Expanded_Index_Height 20
#define Expanded_Mian_Space 3
#define Expanded_Index_Space 6

@interface DFExpandedWidgetView ()

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) NSMutableArray *indexBtns;


@end

@implementation DFExpandedWidgetView

- (instancetype)initWithFrame:(CGRect)frame Titles:(NSArray *)titles{
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, Expanded_Main_Width + Expanded_Mian_Space + (Expanded_Index_Width + Expanded_Index_Space)*titles.count, Expanded_Index_Height)];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.indexBtns = [[NSMutableArray alloc] initWithCapacity:titles.count];
        self.titles = titles;
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    UIButton *expandedBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, Expanded_Main_Width, Expanded_Main_Width)];
    expandedBtn.backgroundColor = [UIColor lightGrayColor];
    expandedBtn.layer.cornerRadius = 5;
    [expandedBtn setTitle:@"》" forState:UIControlStateNormal];
    [expandedBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [expandedBtn addTarget:self action:@selector(expandClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:expandedBtn];
    
    for (int i = 0; i < self.titles.count; i++) {
        UIButton *indexBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, Expanded_Index_Width, Expanded_Index_Height)];
        indexBtn.tag = i;
        indexBtn.backgroundColor = [UIColor lightGrayColor];
        indexBtn.layer.cornerRadius = 5;
        [indexBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        indexBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [indexBtn setTitle:self.titles[i] forState:UIControlStateNormal];
        [indexBtn addTarget:self action:@selector(onClickIndexBtn:) forControlEvents:UIControlEventTouchUpInside];
        indexBtn.hidden = YES;
        [self.indexBtns addObject:indexBtn];
        [self addSubview:indexBtn];
    }
    
    
}

- (void)onClickIndexBtn:(UIButton *)btn{
    self.onClickExpandedBtnBlock(btn.tag);
    
}

- (void)expandClick:(UIButton *)btn{
    if ([btn.titleLabel.text isEqualToString:@"》"]) {
        [btn setTitle:@"《" forState:UIControlStateNormal];
        [self showIndexButton];
    }
    else{
        [btn setTitle:@"》" forState:UIControlStateNormal];
        [self hideIndexButton];
    }
}

- (void)showIndexButton{
    for (int i = 0; i < self.indexBtns.count; i++) {
        UIButton *indexBtn = self.indexBtns[i];
        [UIView animateWithDuration:0.3 animations:^{
            indexBtn.hidden = NO;
            indexBtn.frame = CGRectMake(Expanded_Main_Width + Expanded_Mian_Space + (Expanded_Index_Width + Expanded_Index_Space)*i, 0, Expanded_Index_Width, Expanded_Index_Height);
        }];
    }
    
}

- (void)hideIndexButton{
    for (int i = 0; i < self.indexBtns.count; i++) {
        UIButton *indexBtn = self.indexBtns[i];
        [UIView animateWithDuration:0.5 animations:^{
            indexBtn.frame = CGRectMake(0, 0, Expanded_Index_Width, Expanded_Index_Height);
            indexBtn.hidden = YES;
        }];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
