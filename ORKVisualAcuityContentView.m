//
//  ORKVisualAcuityContentView.m
//  ResearchKit
//
//  Created by javier Lara Medina on 7/5/15.
//  Copyright (c) 2015 researchkit.org. All rights reserved.
//

#import "ORKVisualAcuityContentView.h"
#import "ORKSkin.h"
#import "ORKHelpers.h"  
#import "ORKSubheadlineLabel.h"
#import "ORKUnitLabel.h"
#import "ORKTapCountLabel.h"


@interface ORKVisualAcuityContentView ()

@property (nonatomic, strong) ORKSubheadlineLabel *visualAcuityCaptionLabel;
@property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic, strong) ORKTapCountLabel *visualAcuityMeasureLabel;





@end

@implementation ORKVisualAcuityContentView{
    
    NSArray *_constraints;
    ORKScreenType _screenType;
    UIView *_buttonContainer;
    
    
}


-(instancetype)init{
    
    
    self = [super init];
    
    if (self) {
        
        _screenType = ORKScreenTypeiPhone4;
        
        _visualAcuityCaptionLabel = [ORKSubheadlineLabel new];
        _visualAcuityCaptionLabel.textAlignment = NSTextAlignmentCenter;
        _visualAcuityCaptionLabel.translatesAutoresizingMaskIntoConstraints  = NO;
        
        _visualAcuityMeasureLabel = [ORKTapCountLabel new];
        _visualAcuityMeasureLabel.textAlignment = NSTextAlignmentCenter;
        _visualAcuityMeasureLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        _buttonContainer = [UIView new];
        _buttonContainer.translatesAutoresizingMaskIntoConstraints = NO;
        
        _progressView = [UIProgressView new];
        _progressView.translatesAutoresizingMaskIntoConstraints = NO;
        _progressView.progressTintColor = [self tintColor];
        [_progressView setAlpha:0];
        
        _upButton = [[ORKRoundTappingButton alloc] init];
        _upButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_upButton setTitle:ORKLocalizedString(@"TAP_BUTTON_TITLE", nil) forState:UIControlStateNormal];
        
        _downButton = [[ORKRoundTappingButton alloc] init];
        _downButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_downButton setTitle:ORKLocalizedString(@"TAP_BUTTON_TITLE", nil) forState:UIControlStateNormal];
        
        _leftButton = [[ORKRoundTappingButton alloc] init];
        _leftButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_leftButton setTitle:ORKLocalizedString(@"TAP_BUTTON_TITLE", nil) forState:UIControlStateNormal];
        
        _rightButton = [[ORKRoundTappingButton alloc] init];
        _rightButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_rightButton setTitle:ORKLocalizedString(@"TAP_BUTTON_TITLE", nil) forState:UIControlStateNormal];
        
        [self addSubview:_visualAcuityCaptionLabel];
        [self addSubview:_visualAcuityMeasureLabel];
        [self addSubview:_buttonContainer];
        [self addSubview:_progressView];
        
        [_buttonContainer addSubview:_upButton];
        [_buttonContainer addSubview:_downButton];
        [_buttonContainer addSubview:_leftButton];
        [_buttonContainer addSubview:_rightButton];
        
        
        self.translatesAutoresizingMaskIntoConstraints = NO;
        
        _visualAcuityMeasureLabel.text = ORKLocalizedString(@"VISUAL_ACUITY_LABEL", nil);
        
        [self setVisualAcuityCount:0.05];
        
        [self setNeedsUpdateConstraints];
       
        
    }
    
    return self;
    
}


-(void)tintColorDidChange{
    
    
    [super tintColorDidChange];
    
    _progressView.progressTintColor = [self tintColor];
    
}


-(void)setProgress:(CGFloat)progress
          animated:(BOOL)animated{
    
    
    [_progressView setProgress:progress animated:animated];
    
    [UIView animateWithDuration:animated? 0.2:0 animations:^{
        
        [_progressView setAlpha:(progress == 0)? 0 : 1.0];
        
    }];
    
    
}


-(void)resetStep:(ORKActiveStepViewController * __nonnull)viewController{
    
    [super resetStep:viewController];
    
    [self setVisualAcuityCount:0.05];
    _upButton.enabled = YES;
    _downButton.enabled = YES;
    _rightButton.enabled = YES;
    _leftButton.enabled = YES;
    
    
    
    
}


-(void)finishStep:(ORKActiveStepViewController * __nonnull)viewController{
    
    [super finishStep:viewController];
    
    _upButton.enabled = NO;
    _downButton.enabled = NO;
    _leftButton.enabled = NO;
    _rightButton.enabled = NO;
    
    
}


-(void)willMoveToWindow:(UIWindow *)newWindow{
    
    
    [super willMoveToWindow:newWindow];
    
    _screenType = ORKGetScreenTypeForWindow(newWindow);
    
    [self setNeedsUpdateConstraints];
    
    
    
}


-(void)updateConstraints{
    
    if ([_constraints count]) {
        
        [NSLayoutConstraint deactivateConstraints:_constraints];
        _constraints = nil;
        
        
    }
    
    ORKScreenType screenType = _screenType;
    
    const CGFloat HeaderBaselineToCaptionTop = ORKGetMetricForScreenType(ORKScreenMetricCaptionBaselineToTappingLabelTop, screenType);
    const CGFloat AssumedHeaderBaselineToStepViewTop = ORKGetMetricForScreenType(ORKScreenMetricLearnMoreBaselineToStepViewTop, screenType);
    
    CGFloat margin = ORKStandardMarginForView(self);
    
    self.layoutMargins = (UIEdgeInsets){.left = margin*2, .right = margin*2 };
    
    
    static const CGFloat CaptionBaselineToVisualAcuityMeasureBaseline = 56;
    static const CGFloat TapButtonBottomToBottom = 36;
    
    NSMutableArray *constraints = [NSMutableArray array];
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_visualAcuityCaptionLabel,_visualAcuityMeasureLabel,_progressView,_leftButton,_rightButton,_buttonContainer);
    
    
    [constraints addObject:[NSLayoutConstraint constraintWithItem:_progressView
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1
                                                         constant:(HeaderBaselineToCaptionTop/3)-AssumedHeaderBaselineToStepViewTop]];
    
    
    
    
    
    [constraints addObject:[NSLayoutConstraint constraintWithItem:_visualAcuityCaptionLabel
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1
                                                         constant:(HeaderBaselineToCaptionTop -AssumedHeaderBaselineToStepViewTop)]];
    
    

    [constraints addObject:[NSLayoutConstraint constraintWithItem:_visualAcuityMeasureLabel
                                                        attribute:NSLayoutAttributeFirstBaseline
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:_visualAcuityCaptionLabel
                                                        attribute:NSLayoutAttributeFirstBaseline
                                                       multiplier:1
                                                         constant:CaptionBaselineToVisualAcuityMeasureBaseline]];
    

    [constraints addObject:[NSLayoutConstraint constraintWithItem:self
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:_buttonContainer
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1
                                                         constant:TapButtonBottomToBottom]];
    
    [constraints addObjectsFromArray:[NSLayoutConstraint
                            constraintsWithVisualFormat:@"V:[_visualAcuityCaptionLabel]-(>=10)-[_buttonContainer]"
                            options:NSLayoutFormatAlignAllCenterX
                            metrics:nil
                            views:viewsDictionary]];
    
    

    
    [constraints addObjectsFromArray:[NSLayoutConstraint
                            constraintsWithVisualFormat:@"H:|-[_progressView]-|"
                            options:(NSLayoutFormatOptions)0
                            metrics:nil
                            views:viewsDictionary]];
    
    NSLayoutConstraint *wideProgress =  [NSLayoutConstraint constraintWithItem:_progressView
                                                                     attribute:NSLayoutAttributeWidth
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                    multiplier:1
                                                                      constant:2000];
    
    wideProgress.priority = UILayoutPriorityRequired - 1;
    [constraints addObject:wideProgress];
    
    [constraints addObjectsFromArray:[NSLayoutConstraint
                                      constraintsWithVisualFormat:@"H:|-[_visualAcuityCaptionLabel]-|"
                                      options:(NSLayoutFormatOptions)0
                                      metrics:nil
                                      views:viewsDictionary]];
    
    
    [constraints addObjectsFromArray:[NSLayoutConstraint
                                      constraintsWithVisualFormat:@"H:|-[_visualAcuityMeasureLabel]-|"
                                      options:(NSLayoutFormatOptions)0
                                      metrics:nil
                                      views:viewsDictionary]];
    
    
    [constraints addObjectsFromArray:[NSLayoutConstraint
                                      constraintsWithVisualFormat:@"V:|[_leftButton]|"
                                      options:(NSLayoutFormatOptions)0
                                      metrics:nil
                                      views:viewsDictionary]];
    

    
    [constraints addObjectsFromArray:[NSLayoutConstraint
                                      constraintsWithVisualFormat:@"V:|[_rightButton]|"
                                      options:(NSLayoutFormatOptions)0
                                      metrics:nil
                                      views:viewsDictionary]];
    
    
    [constraints addObjectsFromArray:[NSLayoutConstraint
                                      constraintsWithVisualFormat:@"H:|[_leftButton]-(>=24)-[_rightButton(==_leftButton)]|"
                                      options:(NSLayoutFormatOptions)0
                                      metrics:nil
                                      views:viewsDictionary]];
    
    [constraints addObject:[NSLayoutConstraint constraintWithItem:_leftButton
                                                        attribute:NSLayoutAttributeCenterY
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:_rightButton
                                                        attribute:NSLayoutAttributeCenterY
                                                       multiplier:1
                                                         constant:0]];
    
    
    _constraints = constraints;
    
    [self addConstraints:_constraints];
    
    [NSLayoutConstraint activateConstraints:constraints];
    
    [super updateConstraints];
    
    //SOLO HEMOS PUESTO DOS BOTONES
    
    //HAY QUE AÑADIR LOS OTROS DOS
    
    
    
    
    

}


























@end
