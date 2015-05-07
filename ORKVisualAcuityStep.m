//
//  ORKVisualAcuityStep.m
//  ResearchKit
//
//  Created by javier Lara Medina on 7/5/15.
//  Copyright (c) 2015 researchkit.org. All rights reserved.
//

#import "ORKVisualAcuityStep.h"
#import "ORKVisualAcuityStepViewController.h"
#import "ORKHelpers.h"



@implementation ORKVisualAcuityStep


+(Class)stepViewControllerClass{
    
    return [ORKVisualAcuityStepViewController class];
    
}


-(void)validateParameters{
    
    [super validateParameters];
    
    CGFloat const ORKVisualAcuityTaskMinimumVA = 0.05;
    CGFloat const ORKVisualAcuityTaskMaximumVA = 1.0;
    CGFloat const ORKVisualAcuityTaskMinimumPlaySpeed =  1.0;
    CGFloat const ORKVisualAcuityTaskMaximunPlaySpeed = 5.0;
    NSInteger const ORKVisualAcuityTaskMinimumMaxTest = 5;
    NSInteger const ORKVisualAcuityTaskMinimumMaxConsecutiveFailures = 3;
    
    if (self.initialVisualAcuityLevel < ORKVisualAcuityTaskMinimumVA) {
        
        @throw [NSException exceptionWithName:NSInvalidArgumentException
                                       reason:[NSString stringWithFormat:@"initial visual acuity not be less than %@",@(ORKVisualAcuityTaskMinimumVA)] userInfo:nil];
        
    }
    
    if (self.minimunVisualAcuityLevel > self.initialVisualAcuityLevel) {
        
        @throw [NSException exceptionWithName:NSInvalidArgumentException
                                       reason:@"initial Visual acuity can not be less than minimum Visual Acuity" userInfo:nil];
        
    }
    
    
    if (self.initialVisualAcuityLevel > self.maximumVisualAcuityLevel) {
        
        @throw [NSException exceptionWithName:NSInvalidArgumentException
                                       reason:@"maximum visual acuity can not be less than inicial visual acuity" userInfo:nil];
        
    }
    
    if (self.maximumVisualAcuityLevel > ORKVisualAcuityTaskMaximumVA) {
        
        @throw [NSException exceptionWithName:NSInvalidArgumentException
                                       reason:[NSString stringWithFormat:@"Maximum visual acuity can not be more than %@",@(ORKVisualAcuityTaskMaximumVA)] userInfo:nil];
        
    }
    
    
    if (self.playSpeed < ORKVisualAcuityTaskMinimumPlaySpeed) {
        
        @throw [NSException exceptionWithName:NSInvalidArgumentException
                                       reason:[NSString stringWithFormat:@"playSpeed can not be shorter than %@ seconds",@(ORKVisualAcuityTaskMinimumPlaySpeed)] userInfo:nil];
        
    }
    
    if (self.playSpeed > ORKVisualAcuityTaskMaximunPlaySpeed) {
        
        @throw [NSException exceptionWithName:NSInvalidArgumentException
                                       reason:[NSString stringWithFormat:@"playSpeed can not be longer than %@ seconds",@(ORKVisualAcuityTaskMaximunPlaySpeed)] userInfo:nil];
        
    }
    
    
    if (self.maxTests < ORKVisualAcuityTaskMinimumMaxTest) {
        
        @throw [NSException exceptionWithName:NSInvalidArgumentException
                                       reason:[NSString stringWithFormat:@"MaxTests can not be less than %@",@(ORKVisualAcuityTaskMinimumMaxTest)] userInfo:nil];
        
    }
    
    if (self.maxConsecutiveFailures < ORKVisualAcuityTaskMinimumMaxConsecutiveFailures) {
        
        
        @throw [NSException exceptionWithName:NSInvalidArgumentException
                                       reason:[NSString stringWithFormat:@"maxConsecutiveFailures can not be less than %@",@(ORKVisualAcuityTaskMinimumMaxConsecutiveFailures)] userInfo:nil];
        
        
    }
    
    
}



-(BOOL)startsFinisehd{
    
    return NO;
    
}


-(instancetype)copyWithZone:(NSZone *)zone{
    
    
    ORKVisualAcuityStep *step = [super copyWithZone:zone];
    //falta implementacion propia
    
    
    return step;
    
}

-(instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder{
    
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        ORK_DECODE_UINT32(aDecoder, initialVisualAcuityLevel);
        ORK_DECODE_UINT32(aDecoder, minimunVisualAcuityLevel);
        ORK_DECODE_UINT32(aDecoder, maximumVisualAcuityLevel);
        ORK_DECODE_DOUBLE(aDecoder, playSpeed);
        ORK_DECODE_INTEGER(aDecoder, maxTests);
        ORK_DECODE_INTEGER(aDecoder, maxConsecutiveFailures);
        ORK_DECODE_IMAGE(aDecoder, optotipeImage);
        

        
    }
    
    return self;
    
    
}


-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [super encodeWithCoder:aCoder];
    
    ORK_ENCODE_UINT32(aCoder, initialVisualAcuityLevel);
    ORK_ENCODE_UINT32(aCoder, minimunVisualAcuityLevel);
    ORK_ENCODE_UINT32(aCoder, maximumVisualAcuityLevel);
    ORK_ENCODE_DOUBLE(aCoder, playSpeed);
    ORK_ENCODE_INTEGER(aCoder, maxTests);
    ORK_ENCODE_INTEGER(aCoder, maxConsecutiveFailures);
    ORK_ENCODE_IMAGE(aCoder, optotipeImage);
    
    
    
    
}

-(BOOL)supportsSecureCoding{
    
    return YES;
    
    
}



-(BOOL)isEqual:(id)object{
    
    
    BOOL isParentSame = [super isEqual:object];
    
    __typeof(self) castObject = object;
    
    return (isParentSame &&
            self.initialVisualAcuityLevel == castObject.initialVisualAcuityLevel &&
            self.minimunVisualAcuityLevel == castObject.minimunVisualAcuityLevel &&
            self.maximumVisualAcuityLevel == castObject.maximumVisualAcuityLevel &&
            self.playSpeed == castObject.playSpeed
            && self.maxTests == castObject.maxTests &&
            self.maxConsecutiveFailures == castObject.maxConsecutiveFailures
            && self.optotipeImage == castObject.optotipeImage);
    
    
    
    
}










@end
