//
//  Patient.h
//  9. Delegates
//
//  Created by Admin on 16.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, BodyPart){
    BodyPartHead,
    BodyPartLeg
};
@protocol PatientDelegate;
@interface Patient : NSObject
@property (weak,nonatomic) id <PatientDelegate> doctorDelegate;
@property (weak,nonatomic) id x;
@property (assign,nonatomic) CGFloat temp;
@property (strong,nonatomic) NSString *name;
@property (assign,nonatomic) BodyPart part;
@property (assign,nonatomic) BOOL isHelped;
- (instancetype)initWithName:(NSString*)name;
-(void) takePill;
-(void) makeShot;
-(void) haveRest;
-(void) go2Doctor;
-(void) go2DoctorWIthAche;
-(void) decisionIfHelp;
@end

@protocol PatientDelegate <NSObject>

-(void) feelWorse:(Patient*) patient;
-(void) haveAche:(Patient*) patient;
@end