//
//  NFChannelManager.m
//  Runner
//
//  Created by Tea_WuLong on 2021/7/8.
//

#import "NFChannelManager.h"

NSString *const NFMethodChannelName = @"NativeActionFlutterMethodChannel";

@interface NFChannelManager()<FlutterStreamHandler>

@property (nonatomic, copy)   FlutterEventSink  eventSink;

@end

@implementation NFChannelManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static NFChannelManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[NFChannelManager alloc] init];
    });
    return instance;
}

- (FlutterMethodChannel *)methodChannel {
    return [FlutterMethodChannel methodChannelWithName:NFMethodChannelName binaryMessenger:self.ctrl];
}

- (FlutterError *)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)events{
    if (events) {
        self.eventSink  = events;
    }
    return nil;
}

- (FlutterError* _Nullable)onCancelWithArguments:(id _Nullable)arguments {
    self.eventSink = nil;
    return nil;
}

@end
