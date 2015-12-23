//
//  WeiboStatusTableViewCell.h
//  LetsPlay
//
//  Created by Felix Liu on 23/12/2015.
//  Copyright © 2015 Felix Liu. All rights reserved.
//

#ifndef WeiboStatusTableViewCell_h
#define WeiboStatusTableViewCell_h
#import <UIKit/UIKit.h>
@class WeiboStatus;

@interface WeiboStatusTableViewCell : UITableViewCell

#pragma mark weibo object
@property (nonatomic, strong) WeiboStatus *status;

#pragma mark height of cell
@property (nonatomic, assign) CGFloat height;

@end


#endif /* WeiboStatusTableViewCell_h */
