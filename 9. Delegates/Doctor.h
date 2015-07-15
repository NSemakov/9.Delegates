//
//  Doctor.h
//  9. Delegates
//
//  Created by Admin on 16.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"
@interface Doctor : NSObject <PatientDelegate>

@end
