//
//  AppDelegate.m
//  9. Delegates
//
//  Created by Admin on 16.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "AppDelegate.h"
#import "Patient.h"
#import "Doctor.h"
#import "FriendOfDoctor.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // Uchenik
    Doctor* doctor=[Doctor new];
    
    Patient* patient1=[[Patient alloc] initWithName:@"Ivan"];
    patient1.temp=41.f;
    patient1.doctorDelegate=doctor;
    patient1.part=BodyPartHead;
    Patient* patient2=[[Patient alloc] initWithName:@"Petr"];
    patient2.temp=37.f;
    patient2.doctorDelegate=doctor;
    patient2.part=BodyPartHead;
    Patient* patient3=[[Patient alloc] initWithName:@"Maria"];
    patient3.temp=35.f;
    patient3.doctorDelegate=doctor;
    patient3.part=BodyPartLeg;
    
    NSArray *patientsArray=[NSArray arrayWithObjects:patient1, patient2, patient3, nil];
    for (Patient *obj in patientsArray) {
        [obj go2Doctor];
    }
    
    //----------
    //end of Uchenik
    
    //Student
    FriendOfDoctor* friendOfDoc1=[FriendOfDoctor new];
    Patient* patient4=[[Patient alloc] initWithName:@"Natalia"];
    patient4.temp=41.f;
    patient4.doctorDelegate=friendOfDoc1;
    patient4.part=BodyPartHead;
    Patient* patient5=[[Patient alloc] initWithName:@"Svetlana"];
    patient5.temp=37.f;
    patient5.doctorDelegate=friendOfDoc1;
    patient5.part=BodyPartLeg;
    Patient* patient6=[[Patient alloc] initWithName:@"John"];
    patient6.temp=35.f;
    patient6.doctorDelegate=friendOfDoc1;
    patient6.part=BodyPartHead;

    NSArray *patientsArray2=[NSArray arrayWithObjects:patient1, patient2, patient3,
                             patient4, patient5, patient6,nil];
    for (Patient *obj in patientsArray2) {
        [obj go2Doctor];
    }
    //--------
    //end of Student
    
    //Master
    for (Patient *obj in patientsArray2) {
        [obj go2DoctorWIthAche];
        
    }
    [doctor makeReport];
    [friendOfDoc1 makeReport];
    //--------
    //end of Master
    
    //Superman
    //for doctor (not for friendOfDoc)
    for (Patient* obj in patientsArray) {
        NSLog(@"did help? :%@ delegate: %@",obj.isHelped ? @"Yes":@"No" ,NSStringFromClass([obj.doctorDelegate class]));
        if (obj.isHelped ==FALSE) {
            obj.doctorDelegate=friendOfDoc1;
        }
        NSLog(@"delegate: %@",NSStringFromClass([obj.doctorDelegate class]));
    }
    
    //---------
    //end of Superman
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
