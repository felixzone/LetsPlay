//
//  WeiboStatus.m
//  LetsPlay
//
//  Created by Felix Liu on 23/12/2015.
//  Copyright © 2015 Felix Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeiboStatus.h"

@implementation WeiboStatus

#pragma mark init
- (WeiboStatus *)initWithDictionary:(NSDictionary *)dic {
    if (self = [super init]) {
        self.id = [dic[@"Id"] longLongValue];
        self.profileImageUrl = dic[@"profileImageUrl"];
        self.userName = dic[@"userName"];
        self.mbType = dic[@"mbtype"];
        self.createdAt = dic[@"createdAt"];
        self.source = dic[@"source"];
        self.text = dic[@"text"];
    }
    return self;
}

+ (WeiboStatus *)statusWithDictionary:(NSDictionary *)dic {
    WeiboStatus *status = [[WeiboStatus alloc]initWithDictionary:dic];
    return status;
}

- (NSString *)source {
    return [NSString stringWithFormat:@"From %@",_source];
}


@end
