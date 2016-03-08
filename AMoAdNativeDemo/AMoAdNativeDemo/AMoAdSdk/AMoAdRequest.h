//
//  AMoAdRequest.h
//
//  Created by AMoAd on 2016/03/07.
//
#import <Foundation/Foundation.h>

@interface AMoAdRequest : NSObject

/// ネットワークタイムアウト時間を取得する（デフォルトは30.0秒）
+ (NSTimeInterval)timeoutInterval;

/// ネットワークタイムアウト時間を設定する（デフォルトは30.0秒）
+ (void)setTimeoutInterval:(NSTimeInterval)interval;

/// SSL通信の使用を取得する（デフォルト：NO） ※ YESにしてもATS抑制の設定は必要です
+ (BOOL)isSsl;

/// SSL通信の使用を設定する（デフォルト：NO） ※ YESにしてもATS抑制の設定は必要です
+ (void)setSsl:(BOOL)flg;

/// 使用不可
- (instancetype)init __attribute__((unavailable("This method is not available.")));

@end
