//
//  AppDelegate.h
//  timer
//
//  Created by 成澤 克麻 on 12/04/25.
//  Copyright (c) 2012年 東北大学工学部情報科学研究科 修士1年. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include <AVFoundation/AVFoundation.h>

/*
@interface audioplayer : NSObject <AVAudioPlayerDelegate>{
    NSTimer * timer;
    AVAudioPlayer * audio;
	int count;
	int min;
	int sec;
}
*/

@interface AppDelegate : NSObject <NSApplicationDelegate>{
	int count;
	int min;
	int sec;
	 NSTimer	*timer;
	 AVAudioPlayer *player;
	 NSButton* checkBox_Ten_minute;
	 NSButton* checkBox_Five_minute;
	 
}


@property (assign) IBOutlet NSWindow *window;
@property (retain) IBOutlet NSButton *button;
@property (retain) IBOutlet NSTextField *textfield;
@property (retain) IBOutlet NSTextField *countfield;
@property (retain) IBOutlet NSTextField *optmin1;
@property (retain) IBOutlet NSTextField *optmin2;
@property (retain) IBOutlet NSTextField *optmin3;
@property (retain) IBOutlet NSTextField *optmin4;
@property (retain) IBOutlet NSTextField *optcount1;
@property (retain) IBOutlet NSTextField *optcount2;
@property (retain) IBOutlet NSTextField *optcount3;
@property (retain) IBOutlet NSTextField *optcount4;
@property (assign) IBOutlet NSButton* checkBox_Ten_minute;
@property (assign) IBOutlet NSButton* checkBox_Five_minute;
-(IBAction)pushButton:(id)sender;
-(IBAction)pushStop:(id)sender;
-(IBAction)pushReset:(id)sender;
-(IBAction)pushSound:(id)sender;
-(IBAction)pushPlus:(id)sender;
-(IBAction)pushMinus:(id)sender;
-(IBAction)pushMinPlus:(id)sender;
-(IBAction)pushMinMinus:(id)sender;

- (void)display;
- (void)start;
- (void)stop;
- (void)playSound;
- (void)countDown:(NSTimer *)theTimer;

@end
