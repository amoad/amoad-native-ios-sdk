//
//  ViewController.m
//  AMoAdNativeApp
//
//  Created by AMoAd on 2016/01/29.
//  Copyright © 2016年 AMoAd. All rights reserved.
//

#import "ViewController.h"
#import "AMoAdNative.h"   // [SDK] ネイティブHTML広告
#import "AMoAdRequest.h"  // [SDL] ネットワーク設定
#import "AMoAdLogger.h"   // [SDK] ロガー

@interface ViewController ()

@end

// [SDK] 管理画面から取得したsidを入力してください
static NSString *const kSid = @"62056d310111552c000000000000000000000000000000000000000000000000";
static NSString *const kTag = @"Ad01";

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // [SDK] ログ出力の設定
  [AMoAdLogger sharedLogger].logging = YES;

  // [SDK] トレース出力の設定
  [AMoAdLogger sharedLogger].trace = YES;

  // [SDK] タイムアウト時間を設定する
  [AMoAdRequest setTimeoutInterval:5.0];

  // [SDK] SSL通信の使用を設定する（デフォルト：NO）※ YESにしてもATS抑制の設定は必要です
//  [AMoAdRequest setSsl:YES];
  
  // [SDK] 表示位置とサイズを指定する
  CGRect frame = CGRectMake(20, 100, 140, 120);

  // [SDK] 広告をロードする
  [AMoAdNative loadWithSid:kSid tag:kTag frame:frame completion:^(NSString *sid, NSString *tag, AMoAdResult result, NSDictionary *serverInfo) {
    switch (result) {
      case AMoAdResultSuccess:
        NSLog(@"広告取得成功（sid=%@, tag=%@, serverInfo=%@）", sid, tag, serverInfo);
        break;
      case AMoAdResultEmpty:
        NSLog(@"空広告を受信（sid=%@, tag=%@, serverInfo=%@）", sid, tag, serverInfo);
        break;
      case AMoAdResultFailure:
        NSLog(@"広告取得失敗（sid=%@, tag=%@, serverInfo=%@）", sid, tag, serverInfo);
        break;
    }
#if 1
  } option:@{ @"border" : @"dotted 2px #0000ff"}];  // DEBUG 枠線が表示されます
#else
  }];
#endif

  // [SDK] 広告Viewを取得してaddする
  [self.view addSubview:[AMoAdNative viewWithSid:kSid tag:kTag]];
}

- (IBAction)showAd:(id)sender {
  // [SDK] 広告を表示する
  [AMoAdNative showWithSid:kSid tag:kTag];
}

- (IBAction)hideAd:(id)sender {
  // [SDK] 広告を非表示にする
  [AMoAdNative hideWithSid:kSid tag:kTag];
}

- (IBAction)startRotation:(id)sender {
  // [SDK] ローテーションを開始する
  [AMoAdNative startRotationWithSid:kSid tag:kTag seconds:10]; // 9 - 60秒（範囲内に丸められます）
}

- (IBAction)stopRotation:(id)sender {
  // [SDK] ローテーションを停止する
  [AMoAdNative stopRotationWithSid:kSid tag:kTag];
}

- (IBAction)reloadAd:(id)sender {
  // [SDK] 広告をリロードする
  [AMoAdNative reloadWithSid:kSid tag:kTag];
}

@end
