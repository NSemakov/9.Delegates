//
//  Patient.m
//  9. Delegates
//
//  Created by Admin on 16.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "Patient.h"

@implementation Patient
- (instancetype)initWithName:(NSString*)name
{
    self = [super init];
    if (self) {
        self.name=name;
    }
    return self;
}
-(void) go2Doctor{
    [self.doctorDelegate feelWorse:self];
}
-(void) go2DoctorWIthAche{
    [self.doctorDelegate haveAche:self];
}
-(void) takePill{
    NSLog(@"patient %@ takes a pill",self.name);
    [self decisionIfHelp];
    
}
-(void) makeShot{
    NSLog(@"patient %@ makes a shot",self.name);
    [self decisionIfHelp];
}
-(void) haveRest{
    NSLog(@"patient %@ should have rest",self.name);
    [self decisionIfHelp];
}
-(void) decisionIfHelp{
    self.isHelped=arc4random_uniform(2);
}
@end
