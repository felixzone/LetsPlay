//
//  WeiboStatus.h
//  LetsPlay
//
//  Created by Felix Liu on 23/12/2015.
//  Copyright © 2015 Felix Liu. All rights reserved.
//

#ifndef WeiboStatus_h
#define WeiboStatus_h
@interface WeiboStatus : NSObject

#pragma mark properties
@property (nonatomic, assign) long long id; // weibo id
@property (nonatomic, copy) NSString *profileImageUrl;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *mbType;
@property (nonatomic, copy) NSString *createdAt;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *text;

#pragma mark method
- (WeiboStatus *)initWithDictionary:(NSDictionary *)dic;

+ (WeiboStatus *)statusWithDictionary:(NSDictionary *)dic;

@end
#endif /* WeiboStatus_h */
