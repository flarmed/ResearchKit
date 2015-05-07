//
//  ORKVisualAcuityStep.h
//  ResearchKit
//
//  Created by javier Lara Medina on 7/5/15.
//  Copyright (c) 2015 researchkit.org. All rights reserved.
//

#import <ResearchKit/ResearchKit.h>

@interface ORKVisualAcuityStep : ORKActiveStep


@property (nonatomic, assign) uint32_t initialVisualAcuityLevel; //agudeza visual inicial del test
@property (nonatomic, assign) uint32_t minimunVisualAcuityLevel; //agudeza visual minima del test
@property (nonatomic, assign) uint32_t maximumVisualAcuityLevel; //agudeza visual maxima del test
@property (nonatomic, assign) NSTimeInterval playSpeed; //paso entre optotipos
@property (nonatomic, assign) NSInteger maxTests; //maximo numero de optotipos mostrados
@property (nonatomic, assign) NSInteger maxConsecutiveFailures; //maximo numero de fallos
@property (nonatomic, strong) UIImage *optotipeImage; //imagen del optotipo


@end
