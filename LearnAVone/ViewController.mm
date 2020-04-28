//
//  ViewController.m
//  LearnAVone
//
//  Created by chenguang on 2020/4/20.
//  Copyright © 2020 chenguang. All rights reserved.
//

#import "ViewController.h"
#import "Mp3Encoder.hpp"
@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *EncodeBtn;
@property (weak, nonatomic) IBOutlet UITextField *InputFileTF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)TFDidBegin:(id)sender {
    
}
- (IBAction)EditChanged:(id)sender {
    if ([((UITextField *)sender).text hasSuffix:@".pcm"]) {
        self.EncodeBtn.enabled = YES;
    } else {
        self.EncodeBtn.enabled = NO;
    }
}


- (IBAction)startEncode:(id)sender {
    
    NSArray *strArr = [self.InputFileTF.text componentsSeparatedByString:@"."];
    const char *pcmFilePath = [[[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:self.InputFileTF.text] cStringUsingEncoding:NSUTF8StringEncoding];
    if (!strlen(pcmFilePath)) {
        return;
    }
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dir = [paths firstObject];
    
    NSString *dest = nil;
    if (strArr.count > 1) {
        dest = [strArr.firstObject stringByAppendingString:@".mp3"];
    }
    if (!dest.length) {
        return;
    }
    const char*mp3FilePath = [[dir stringByAppendingPathComponent:dest] cStringUsingEncoding:NSUTF8StringEncoding];
    
    NSLog(@"filePath: %s", mp3FilePath);
    Mp3Encoder * encoder = new Mp3Encoder();
    NSLog(@"startEncode");
    int sampleRate = 44100;
    int channels = 2;
    int bitRate = 128 * 1024;
    int ret = encoder->Init(pcmFilePath, mp3FilePath, sampleRate, channels, bitRate);
    if (ret < 0) {
        return;
    }
    encoder->encoder();
    encoder->destory();
    delete encoder;
    NSLog(@"Encode Success");
}
@end
