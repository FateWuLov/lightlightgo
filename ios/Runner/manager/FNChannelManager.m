
#import "FNChannelManager.h"
#import "ToolBox.h"

NSString *const  methodChannelStr = @"FlutterActionNativeMethodChannel";

NSString *const  methodNameResetGuestId = @"ResetGuestId";
NSString *const  methodNameResetUuid = @"ResetUuid";

// 获取一些只有原生才能获取到的配置信息
NSString *const methodNameGetNativeInfo = @"GetNativeInfo";

@interface FNChannelManager()

@property (nonatomic, strong) FlutterViewController <FlutterBinaryMessenger>*ctrl;
@property (nonatomic, strong) NSMutableDictionary<NSString *,FlutterResult> *resultDict;

@end

@implementation FNChannelManager

- (instancetype)initWithCtrl:(FlutterViewController <FlutterBinaryMessenger>*)ctrl{
    if (self = [super init]) {
        self.ctrl = ctrl;
        self.resultDict = [NSMutableDictionary dictionary];
        [self config];
    }
    return self;
}

- (void)config{
    FlutterMethodChannel *methodChannel = [FlutterMethodChannel methodChannelWithName:methodChannelStr binaryMessenger:self.ctrl];
    [methodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([methodNameResetGuestId isEqualToString:call.method]){
            [ToolBox clearGuestId];
            NSDictionary *dict = @{
                @"guestId":[ToolBox guestId],
            };
           result(dict);
        }
        else if ([methodNameResetUuid isEqualToString:call.method]){
            [ToolBox clearUuid];
            NSDictionary *dict = @{
                @"uuid":[ToolBox uuidString],
            };
            result(dict);
        }
        else if ([methodNameGetNativeInfo isEqualToString:call.method]) {
            NSDictionary *dict = @{
                @"uuid":[ToolBox uuidString],
                @"guestId":[ToolBox guestId],
                @"isDevelop": @(![ToolBox isDistributionModel]),
            };
           result(dict);
        }
        else {
             result(FlutterMethodNotImplemented);
        }
    }];
}
@end
