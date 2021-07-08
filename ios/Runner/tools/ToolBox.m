
#import "ToolBox.h"
#import <UIKit/UIKit.h>
#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import <SimpleKeychain/A0SimpleKeychain.h>
#import <AdSupport/AdSupport.h>

#define UD_keychain_UUID             @"UD_keychain_UUID"
#define UD_keychain_GUEST_ID         @"UD_keychain_GUEST_ID"

void dispatch_to_main_async(dispatch_block_t block) {
    if([NSThread isMainThread]) {
        block();
    } else {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

void dispatch_to_main_sync(dispatch_block_t block) {
    if([NSThread isMainThread]) {
        block();
    } else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

@implementation ToolBox

+ (BOOL)isDistributionModel {
    #ifdef DISTRIBUTION
        return YES;
    #endif
    return NO;
}

+ (NSString *)idfvString{
    NSString *str = [UIDevice currentDevice].identifierForVendor.UUIDString;
    return str?:@"";
}

+ (NSString *)idfaString{
    NSString *str = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    return str?:@"";
}

+ (NSString *)uuidString{
    NSString *keychainUUID = [[A0SimpleKeychain keychain] stringForKey:UD_keychain_UUID];
    if (keychainUUID.length > 0) {
        return keychainUUID;
    }
    NSString *str = [NSString stringWithFormat:@"%@_%u_%ld", [self idfvString], arc4random() % 10000, (long)[[NSDate date] timeIntervalSince1970]];
    [[A0SimpleKeychain keychain] setString:str forKey:UD_keychain_UUID];
    return str;
}

+ (NSString *)guestId {
    NSString *guestId = [[A0SimpleKeychain keychain] stringForKey:UD_keychain_GUEST_ID];
    if (guestId.length > 0) {
        return guestId;
    }
    NSString *str = [NSString stringWithFormat:@"%@_%u_%ld", [self idfvString], arc4random() % 10000, (long)[[NSDate date] timeIntervalSince1970]];
    [[A0SimpleKeychain keychain] setString:str forKey:UD_keychain_GUEST_ID];
    return str;
}

+ (void) clearGuestId {
    [[A0SimpleKeychain keychain] setString:@"" forKey:UD_keychain_GUEST_ID];
}

+ (void) clearUuid {
    [[A0SimpleKeychain keychain] setString:@"" forKey:UD_keychain_UUID];
}

+ (void) requestAccessATTracking {
    if (@available(iOS 14, *)) {
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status){
            
        }];
    }
}


@end
