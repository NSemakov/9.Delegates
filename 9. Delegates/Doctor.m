//
//  Doctor.m
//  9. Delegates
//
//  Created by Admin on 16.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "Doctor.h"
@implementation Doctor
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.report=[NSMutableArray new];
    }
    return self;
}
-(void) feelWorse:(Patient*) patient{
    if (patient.temp>=37.f && patient.temp<=39.f) {
        [patient takePill];
    } else if (patient.temp>40){
        [patient makeShot];
    } else {
        [patient haveRest];
    }
}
-(void) haveAche:(Patient*) patient{
    [self.report addObject:patient];
    switch (patient.part) {
        case BodyPartHead:
            [patient takePill];
            break;
        case BodyPartLeg:
            [patient makeShot];
            break;
        default:
            NSLog(@"nothing!");
            break;
    }

}

-(void) makeReport {
   [self.report sortUsingComparator:^NSComparisonResult(Patient* obj1, Patient* obj2) {
       return [[NSNumber numberWithInt:obj1.part] compare:[NSNumber numberWithInt:obj2.part]];
   }];
    NSString* bodyPartInString;

    for (Patient* obj in self.report) {
        switch (obj.part) {
            case BodyPartHead:
                bodyPartInString=@"head";
                break;
            case BodyPartLeg:
                bodyPartInString=@"leg";
                break;
            default:
                bodyPartInString=@"error. no such body part in enum";
                break;
        }
        NSLog(@"doctor's report:%@ have a pain in %@",obj.name,bodyPartInString);

    }
}

@end
