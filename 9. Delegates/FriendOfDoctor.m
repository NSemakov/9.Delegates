//
//  FriendOfDoctor.m
//  9. Delegates
//
//  Created by Admin on 16.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "FriendOfDoctor.h"

@implementation FriendOfDoctor
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
        [self putPlantain];
    } else if (patient.temp>40){
        [self perspireInSauna];
    } else {
        [self accuseInPretence];
    }
}

-(void) haveAche:(Patient*) patient{
    [self.report addObject:patient];
    switch (patient.part) {
        case BodyPartHead:
            [self putPlantain];
            break;
        case BodyPartLeg:
            [self perspireInSauna];
            break;
        default:
            [self accuseInPretence];
            break;
    }
}
-(void) putPlantain {
    NSLog(@"yep, to put a plantain is definitely the best way!");
}
-(void) perspireInSauna{
    NSLog(@"you should perspire heavely in sauna!");
}
-(void) accuseInPretence {
    NSLog(@"hey, don't waste my time, you are pretending!");
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
            default:
                bodyPartInString=@"error. no such body part in enum";
                break;
        }
        NSLog(@"doctor's friend's report:%@ have a pain in %@",obj.name,bodyPartInString);
        
    }
}
@end
