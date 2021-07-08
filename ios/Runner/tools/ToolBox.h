
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

void dispatch_to_main_async(dispatch_block_t block);
void dispatch_to_main_sync(dispatch_block_t block);

@interface ToolBox : NSObject

+ (BOOL)isDistributionModel;

+ (NSString *)idfvString;

+ (NSString *)idfaString;

/// 游客登录id，存储在钥匙串中
+ (NSString *)guestId;
+ (void) clearGuestId;

/// 设备uuid，存储在钥匙串中
+ (NSString *)uuidString;
+ (void) clearUuid;

+ (void) requestAccessATTracking;

@end

NS_ASSUME_NONNULL_END
