//
//  KCContractGroup.m
//  LetsPlay
//
//  Created by Felix Liu on 24/11/2015.
//  Copyright © 2015 Felix Liu. All rights reserved.
//

#import "KCContractGroup.h"

@implementation KCContractGroup

-(KCContractGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContracts:(NSMutableArray *)contracts {
    if (self = [super init]) {
        self.name = name;
        self.detail = detail;
        self.contracts = contracts;
    }
    return self;
}

+(KCContractGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContracts:(NSMutableArray *)contracts {
    return [[KCContractGroup alloc] initWithName:name andDetail:detail andContracts:contracts];
}

@end
