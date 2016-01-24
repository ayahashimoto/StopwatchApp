//
//  ViewController.m
//  TimerSample
//
//  Created by 橋本 遥 on 2016/01/20.
//  Copyright © 2016年 aya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
// 時刻を表示するためのラベルインスタンスを格納するための変数
UILabel *timeLabel;

// 背景画像を表示するためのイメージビューインスタンスを格納するための変数
UIImageView *backgroundView;
    
// タイマーインスタンスを格納するための変数
NSTimer *timer;

// カウント用の変数
NSInteger countNumber;

}

@end

@implementation ViewController



-(void)viewDidLoad{
    [super viewDidLoad];
    [self setupParts];    // ラベルとイメージビューを作成するメソッドを呼び出す
    [self buttonchange];
    countNumber = 0;     //カウント用の変数に0を代入
    // タイマーインスタンスを作成 1秒ごとによびだす
    }



//　ボタンを切り替える？　途中です
-(void)buttonchange{
    if (![timer isValid]) {
             NSLog(@"とまってる");
      } else {
          NSLog(@"うごいてる");
}
}


//　※一秒ごとに呼び出されるメソッド
-(void)tick:(NSTimer*)timer{
    countNumber++;
    NSLog(@"%d:%d", countNumber /60,countNumber %60);
    timeLabel.text = [NSString stringWithFormat:@"%02d:%02d", countNumber /60,countNumber %60];
    
}


//　※ストップボタン
-(void)timerStop:(id)sender{
    if (timer != nil){
        [timer invalidate];
        timer = nil;
        
    }
}


//　※スタートボタン
-(void)timerStart:(id)sender{
  timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick:)userInfo:nil repeats:YES];
          }

//　※リセットボタン
-(void)timerReset:(id)sender{
   timeLabel.text = @"00:00";
   countNumber = 0;
}




//　※時間の表示設定
-(void)setupParts{
    // 背景画像を設定
    backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    
    // 画像を設定
    backgroundView.image = [UIImage imageNamed:@"tb.png"];
    
    // イメージビューを画面に貼付ける
    [self.view addSubview:backgroundView];
    
    
    
    // ラベルを作成
    timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 100)];
    
    // ラベルの位置を中心で設定
    timeLabel.center = CGPointMake(160, 284);
    
    // ラベルに表示するフォントと文字サイズの設定
    timeLabel.font = [UIFont fontWithName:@"HiraKakuProN-W3" size:60];
    
    // ラベルに表示する文字を設定
    timeLabel.text = @"00:00";
    
    // ラベルの文字寄せを設定
    timeLabel.textAlignment = NSTextAlignmentCenter;
    
    // ラベルの背景色を透明に設定
    timeLabel.backgroundColor = [UIColor clearColor];
    
    // ラベルを画面に貼付ける
    [self.view addSubview:timeLabel];
    
    
    
    
    // ボタンの作成　※停止
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // ボタンの位置を設定
    button.frame = CGRectMake(0, 0, 112, 39);
    button.center = CGPointMake(160, 400);
    
    // ボタンのタイトルを設定
    [button setTitle:@"停止" forState:UIControlStateNormal];
    
    // ボタンを押したときに呼ばれるメソッドを設定
    [button addTarget:self action:@selector(timerStop:)//タイマーストップメソッド！
     forControlEvents:UIControlEventTouchUpInside];
    
    // ボタンを画面に貼付ける
    [self.view addSubview:button];
    
    //ボタンに画像を設定
    [button setImage:[UIImage imageNamed:@"stop.png"] forState:UIControlStateNormal];
    

    
    
    // ボタンの作成　※スタート
    UIButton *sbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // ボタンの位置を設定
    sbutton.frame = CGRectMake(0, 0, 112, 39);
    sbutton.center = CGPointMake(160, 370);
    
    // ボタンのタイトルを設定
    [sbutton setTitle:@"スタート" forState:UIControlStateNormal];
    
    // ボタンを押したときに呼ばれるメソッドを設定
    [sbutton addTarget:self action:@selector(timerStart:)//タイマースタートメソッド！
     forControlEvents:UIControlEventTouchUpInside];
    
    // ボタンを画面に貼付ける
    [self.view addSubview:sbutton];
    
    //ボタンに画像を設定
    [sbutton setImage:[UIImage imageNamed:@"start.png"] forState:UIControlStateNormal];
    
    
    
    // ボタンの作成　※リセット
    UIButton *rbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // ボタンの位置を設定
    rbutton.frame = CGRectMake(0, 0, 112, 39);
    rbutton.center = CGPointMake(160, 450);
    
    // ボタンのタイトルを設定
    [rbutton setTitle:@"リセット" forState:UIControlStateNormal];
    
    // ボタンを押したときに呼ばれるメソッドを設定
    [rbutton addTarget:self action:@selector(timerReset:)//タイマーリセットメソッド！
      forControlEvents:UIControlEventTouchUpInside];
    
    // ボタンを画面に貼付ける
    [self.view addSubview:rbutton];
    
     //ボタンに画像を設定
    [rbutton setImage:[UIImage imageNamed:@"reset.png"] forState:UIControlStateNormal];

    
}




@end
