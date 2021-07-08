#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"

#import "FNChannelManager.h"
#import "NFChannelManager.h"
#import "ToolBox.h"

@interface AppDelegate ()

@property (nonatomic, strong) FNChannelManager *fnManager;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
    
    FlutterViewController *ctrl = (FlutterViewController *)self.window.rootViewController;
    self.fnManager = [[FNChannelManager alloc] initWithCtrl:ctrl];
    [NFChannelManager sharedInstance].ctrl = ctrl;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [ToolBox requestAccessATTracking];
    });
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
