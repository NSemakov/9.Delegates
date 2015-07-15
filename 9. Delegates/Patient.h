//
//  Patient.h
//  9. Delegates
//
//  Created by Admin on 16.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol PatientDelegate;
@interface Patient : NSObject
@property (weak,nonatomic) id <PatientDelegate> delegate;
@property (assign,nonatomic) CGFloat temp;
@property (strong,nonatomic) NSString *name;


- (instancetype)initWithName:(NSString*)name;
-(void) takePill;
-(void) makeShot;
-(void) haveRest;
-(void) go2Doctor;
@end

@protocol PatientDelegate

-(void) feelWorse:(Patient*) patient;

@end