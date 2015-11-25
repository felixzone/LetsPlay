//
//  KCContractGroup.h
//  LetsPlay
//
//  Created by Felix Liu on 24/11/2015.
//  Copyright © 2015 Felix Liu. All rights reserved.
//

#ifndef KCContractGroup_h
#define KCContractGroup_h
#import <Foundation/Foundation.h>

@interface KCContractGroup : NSObject

#pragma mark group name
@property (nonatomic,copy)NSString *name;

#pragma mark group detail
@property (nonatomic,copy)NSString *detail;

#pragma mark group member
@property (nonatomic,strong)NSMutableArray *contracts;

#pragma mark init method
-(KCContractGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContracts:(NSMutableArray *)contracts;

#pragma mark static init method
+(KCContractGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContracts:(NSMutableArray *)contracts;

@end

#endif /* KCContractGroup_h */
