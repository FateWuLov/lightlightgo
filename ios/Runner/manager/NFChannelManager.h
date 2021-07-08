//
//  NFChannelManager.h
//  Runner
//
//  Created by Tea_WuLong on 2021/7/8.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface NFChannelManager : NSObject
@property (nonatomic, strong) FlutterViewController  *ctrl;

+ (instancetype)sharedInstance;
- (FlutterMethodChannel *)methodChannel;

@end

NS_ASSUME_NONNULL_END
