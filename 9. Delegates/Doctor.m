//
//  Doctor.m
//  9. Delegates
//
//  Created by Admin on 16.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "Doctor.h"
@implementation Doctor

-(void) feelWorse:(Patient*) patient{
    if (patient.temp>=37.f && patient.temp<=39.f) {
        [patient takePill];
    } else if (patient.temp>40){
        [patient makeShot];
    } else {
        [patient haveRest];
    }
}
@end
