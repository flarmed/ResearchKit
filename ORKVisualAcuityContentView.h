//
//  ORKVisualAcuityContentView.h
//  ResearchKit
//
//  Created by javier Lara Medina on 7/5/15.
//  Copyright (c) 2015 researchkit.org. All rights reserved.
//

#import "ORKCustomStepView_Internal.h"
#import "ORKRoundTappingButton.h"

NS_ASSUME_NONNULL_BEGIN


@interface ORKVisualAcuityContentView : ORKActiveStepCustomView


@property (nonatomic , strong) ORKRoundTappingButton *upButton;
@property (nonatomic,strong) ORKRoundTappingButton *downButton;
@property (nonatomic, strong) ORKRoundTappingButton *leftButton;
@property (nonatomic, strong) ORKRoundTappingButton *rightButton;


-(void)setProgress:(CGFloat)progress
          animated:(BOOL)animated;


-(void)setVisualAcuityCount:(CGFloat)visualAcuityCount;



@end

NS_ASSUME_NONNULL_END