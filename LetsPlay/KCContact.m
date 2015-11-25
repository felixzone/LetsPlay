//
//  KCContract.m
//  LetsPlay
//
//  Created by Felix Liu on 24/11/2015.
//  Copyright © 2015 Felix Liu. All rights reserved.
//

#import "KCContact.h"

@implementation KCContact

-(KCContact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber {
    if (self = [super init]) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.phoneNumber = phoneNumber;
    }
    return self;
}

+(KCContact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber {
    return [[KCContact alloc] initWithFirstName:firstName andLastName:lastName andPhoneNumber:phoneNumber];
}

-(NSString *)getName {
    return [NSString stringWithFormat:@"%@ %@",self.firstName,self.lastName];
}

@end
