//
//  AppDelegate.m
//  timer
//
//  Created by 成澤 克麻 on 12/04/25.
//  Copyright (c) 2012年 東北大学工学部情報科学研究科 修士1年. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
int count;

@synthesize window = _window;
@synthesize button = _button;
@synthesize textfield = _textfield;
@synthesize countfield = _countfield;

@synthesize optmin1 = _optmin1;
@synthesize optmin2 = _optmin2;
@synthesize optmin3 = _optmin3;
@synthesize optmin4 = _optmin4;
@synthesize optcount1 = _optcount1;
@synthesize optcount2 = _optcount2;
@synthesize optcount3 = _optcount3;
@synthesize optcount4 = _optcount4;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	count = 0;
	min = 0;
	sec = 0;
	[checkBox_Ten_minute setState:YES];
	[checkBox_Five_minute setState:NO];
	[self.optmin1 setIntValue:0];
	[self.optmin1 setIntValue:0];
	[self.optmin2 setIntValue:0];
	[self.optmin3 setIntValue:0];
	[self.optmin4 setIntValue:0];
	[self.optcount1 setIntValue:0];
	[self.optcount2 setIntValue:0];
	[self.optcount3 setIntValue:0];
	[self.optcount4 setIntValue:0];
	[self display];
	// Insert code here to initialize your application
}


- (IBAction)pushButton:(id)sender
{	
	//タイマーのセット
	timer = [NSTimer scheduledTimerWithTimeInterval:1
											  target:self
											selector:@selector(countUp:)
											userInfo:nil
											 repeats:YES ];
}

- (IBAction)pushPlus:(id)sender{
	count++;
	[self display];
}

- (IBAction)pushMinus:(id)sender{
	count--;
	[self display];
}

- (IBAction)pushMinPlus:(id)sender{
	min++;
	[self display];
}

- (IBAction)pushMinMinus:(id)sender{
	min--;
	[self display];
}

- (IBAction)pushStop:(id)sender{
	[self stop];
}

- (IBAction)pushReset:(id)sender{
	sec=0; min=0; count=0;
	[self display];
}

- (void)display {
	[self.textfield setStringValue:[NSString stringWithFormat:@"%02d:%02d", min, sec]];
	[self.countfield setStringValue:[NSString stringWithFormat:@"次は %d 回鳴ります", count+1]];
}

- (void)stop {
	if (timer != nil) {
		[timer invalidate];
//		[timer release];
		timer = nil;
	}
}

- (void)playSound:(int)reptime {
	NSURL *soundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"tubler" ofType:@"m4a"]];	
	NSError *error = nil;
	player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];
	if (error != nil) {
		//[player release];
		player = nil;
		NSLog(@"AVAudioPlayerのイニシャライズでエラー(%@)",[error localizedDescription]);
		return;
	}
//	[player prepareToPlay];
	player.numberOfLoops = reptime;
	[player play];
	[self display];
	
}

- (IBAction)pushSound:(id)sender{
	[self playSound : 0];
}

- (void)countUp:(NSTimer *)theTimer {
	sec++;
	if (sec == 60) {
		min++;
		sec = 0;
	}
	
	if ((self.optcount1.intValue != 0) &&  (sec == 0) && (min==self.optmin1.intValue)) {
		[self playSound : self.optcount1.intValue-1 ];
	}else if ((_optcount2.intValue != 0) &&  (sec == 0) && (min==_optmin2.intValue)) {
		[self playSound : _optcount2.intValue-1 ];
	}else if ((_optcount3.intValue != 0) &&  (sec == 0) && (min==_optmin3.intValue)) {
		[self playSound : _optcount3.intValue-1 ];
	}else if ((_optcount4.intValue != 0) &&  (sec == 0) && (min==_optmin4.intValue)) {
		[self playSound : _optcount4.intValue-1 ];
	}else if (checkBox_Ten_minute.state && (sec == 0) && (min%10==0)) {
		[self playSound : count];
		count++;
	}else if(checkBox_Five_minute.state && (sec == 0) && (min%5==0)) {
		[self playSound : count];
		count++;
	}

	[self display];
}

@end
