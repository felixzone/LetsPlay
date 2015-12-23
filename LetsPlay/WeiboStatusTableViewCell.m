//
//  WeiboStatusTableViewCell.m
//  LetsPlay
//
//  Created by Felix Liu on 23/12/2015.
//  Copyright © 2015 Felix Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WeiboStatusTableViewCell.h"
#import "WeiboStatus.h"

#define Color(r,g,b) [UIColor colorWithHue:r/255.0 saturation:g/255.0 brightness:b/255.0 alpha:1]
#define weiboStatusTableViewCellControlSpacing 10  // space between cells
#define weiboStatusTableViewCellBackgroundColor Color(251,251,251)
#define weiboStatusGrayColor Color(50,50,50)
#define weiboStatusLightGrayColor Color(120,120,120)

#define weiboStatusTableViewCellAvatarWidth 40
#define weiboStatusTableViewCellAvatarHeight weiboStatusTableViewCellAvatarWidth
#define weiboStatusTableViewCellUserNameFontSize 14
#define weiboStatusTableViewCellMbTypeWidth 13
#define weiboStatusTableViewCellMbTypeHeight weiboStatusTableViewCellMbTypeWidth
#define weiboStatusTableViewCellCreateAtFontSize 12
#define weiboStatusTableViewCellSourceFontSize 12
#define weiboStatusTableViewCellTextFontSize 14

@interface WeiboStatusTableViewCell() {
    UIImageView *_avatar;
    UIImageView *_mbType;
    UILabel *_userName;
    UILabel *_createAt;
    UILabel *_source;
    UILabel *_text;
}
@end

@implementation WeiboStatusTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }
    return self;
}

#pragma mark init
- (void)initSubView {
    _avatar = [[UIImageView alloc]init];
    [self.contentView addSubview:_avatar];
    
    _userName = [[UILabel alloc]init];
    _userName.textColor = weiboStatusGrayColor;
    _userName.font = [UIFont systemFontOfSize:weiboStatusTableViewCellUserNameFontSize];
    [self.contentView addSubview:_userName];
    
    _mbType = [[UIImageView alloc]init];
    [self.contentView addSubview:_mbType];
    
    _createAt = [[UILabel alloc]init];
    _createAt.textColor = weiboStatusLightGrayColor;
    _createAt.font = [UIFont systemFontOfSize:weiboStatusTableViewCellCreateAtFontSize];
    [self.contentView addSubview:_createAt];
    
    _source = [[UILabel alloc]init];
    _source.textColor = weiboStatusLightGrayColor;
    _source.font = [UIFont systemFontOfSize:weiboStatusTableViewCellSourceFontSize];
    [self.contentView addSubview:_source];
    
    _text = [[UILabel alloc]init];
    _text.textColor = weiboStatusGrayColor;
    _text.font = [UIFont systemFontOfSize:weiboStatusTableViewCellTextFontSize];
    _text.numberOfLines = 0;
    [self.contentView addSubview:_text];
}

- (void)setStatus:(WeiboStatus *)status {
    // set avatar
    CGFloat avatarX = 10, avatarY = 10;
    CGRect avatarRect = CGRectMake(avatarX, avatarY, weiboStatusTableViewCellAvatarWidth, weiboStatusTableViewCellAvatarHeight);
    _avatar.image = [UIImage imageNamed:status.profileImageUrl];
    _avatar.frame = avatarRect;
    
    // set user
    CGFloat userNameX = CGRectGetMaxX(_avatar.frame) + weiboStatusTableViewCellControlSpacing;
    CGFloat userNameY = avatarY;
    // get the size according to the text content
    CGSize userNameSize = [status.userName sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:weiboStatusTableViewCellUserNameFontSize]}];
    CGRect userNameRect = CGRectMake(userNameX, userNameY, userNameSize.width, userNameSize.height);
    _userName.text = status.userName;
    _userName.frame = userNameRect;
    
    // set member icon
    CGFloat mbTypeX = CGRectGetMaxX(_userName.frame) + weiboStatusTableViewCellControlSpacing;
    CGFloat mbTypeY = avatarY;
    CGRect mbTypeRect = CGRectMake(mbTypeX, mbTypeY, weiboStatusTableViewCellMbTypeWidth, weiboStatusTableViewCellMbTypeHeight);
    _mbType.image = [UIImage imageNamed:status.mbType];
    _mbType.frame = mbTypeRect;
    
    // set the weibo date
    CGSize createAtSize = [status.createdAt sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:weiboStatusTableViewCellCreateAtFontSize]}];
    CGFloat createAtX = userNameX;
    CGFloat createAtY = CGRectGetMaxY(_avatar.frame) - createAtSize.height;
    CGRect createAtRect = CGRectMake(createAtX, createAtY, createAtSize.width, createAtSize.height);
    _createAt.text = status.createdAt;
    _createAt.frame = createAtRect;
    
    // set source
    CGSize sourceSize = [status.source sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:weiboStatusTableViewCellSourceFontSize]}];
    CGFloat sourceX = CGRectGetMaxX(_createAt.frame) + weiboStatusTableViewCellControlSpacing;
    CGFloat sourceY = createAtY;
    CGRect sourceRect = CGRectMake(sourceX, sourceY, sourceSize.width, sourceSize.height);
    _source.text = status.source;
    _source.frame = sourceRect;
    
    // set weibo content
    CGFloat textX = avatarX;
    CGFloat textY = CGRectGetMaxY(_avatar.frame) + weiboStatusTableViewCellControlSpacing;
    CGFloat textWidth = self.frame.size.width - weiboStatusTableViewCellControlSpacing * 2;
    CGSize textSize = [status.text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:weiboStatusTableViewCellTextFontSize]} context:nil].size;
    CGRect textRect = CGRectMake(textX, textY, textSize.width, textSize.height);
    _text.text = status.text;
    _text.frame = textRect;
    
    _height = CGRectGetMaxY(_text.frame) + weiboStatusTableViewCellControlSpacing;
    
}

#pragma mark override selected event
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
}

@end
