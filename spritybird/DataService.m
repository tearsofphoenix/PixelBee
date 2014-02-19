//
//  DataService.m
//  PixelBee
//
//  Created by Mac003 on 14-2-19.
//  Copyright (c) 2014年 Alexis Creuzot. All rights reserved.
//

#import "DataService.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation DataService


+ (void)playSound: (NSString *)name
{
//    return;
    SystemSoundID soundID = 0;
    NSURL *url = [[NSBundle mainBundle] URLForResource: name
                                         withExtension: @"caf"];
    
    CFURLRef soundFileURL = (__bridge CFURLRef)url;
    OSStatus errorCode = AudioServicesCreateSystemSoundID(soundFileURL, &soundID);
    
    if (errorCode != 0)
    {
        // Handle failure here
        NSLog(@"in func: %s error: %d", __func__, (int)errorCode);
    }else
    {
        AudioServicesPlaySystemSound(soundID);
    }
}

@end
