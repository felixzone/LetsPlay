//
//  KCContract.h
//  LetsPlay
//
//  Created by Felix Liu on 24/11/2015.
//  Copyright © 2015 Felix Liu. All rights reserved.
//

#ifndef KCContract_h
#define KCContract_h
#import <Foundation/Foundation.h>

@interface KCContact : NSObject

#pragma mark first name
@property (nonatomic,copy) NSString *firstName;

#pragma mark last name
@property (nonatomic,copy) NSString *lastName;

#pragma mark mobile phone
@property (nonatomic,copy) NSString *phoneNumber;

#pragma mark init method
-(KCContact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber;

+(KCContact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber;

#pragma mark getName
-(NSString *)getName;


@end


#endif /* KCContract_h */
