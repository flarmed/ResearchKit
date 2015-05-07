//
//  ORKVisualAcuityStepViewController.m
//  ResearchKit
//
//  Created by javier Lara Medina on 7/5/15.
//  Copyright (c) 2015 researchkit.org. All rights reserved.
//

#import "ORKVisualAcuityStepViewController.h"
#import "ORKVisualAcuityContentView.h"
#import "ORKStepViewController_Internal.h"
#import "ORKActiveStepViewController_Internal.h"
#import "ORKActiveStepView.h"



@interface ORKVisualAcuityStepViewController ()

@property (nonatomic, strong) ORKVisualAcuityContentView *visualAcuityContentView;
@property (nonatomic, assign) BOOL expired;


@end

@implementation ORKVisualAcuityStepViewController{
    
    
}


-(instancetype)initWithStep:(nullable ORKStep *)step{
    
    self = [super initWithStep:step];
    
    if (self) {
        
        self.suspendIfInactive = YES;
        
    }
    
    return self;
    
}

-(void)initializeInternalButtonItems{
    
    //Don´t show next button
    
    self.internalContinueButtonItem = nil;
    self.internalDoneButtonItem = nil;
    
    
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.expired = NO;
    
    self.visualAcuityContentView = [[ORKVisualAcuityContentView alloc] init];
    self.activeStepView.activeCustomView = self.visualAcuityContentView;
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}



-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    [self start];
    
    
}


-(void)start{
    
    [super start];
    
    //[self startCurrentTest];
    
}











@end
