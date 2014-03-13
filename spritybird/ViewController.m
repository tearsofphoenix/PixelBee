//
//  ViewController.m
//  spritybird
//
//  Created by Alexis Creuzot on 09/02/2014.
//  Copyright (c) 2014 Alexis Creuzot. All rights reserved.
//

#import "ViewController.h"
#import "Scene.h"
#import "Score.h"

#import "DataService.h"

@interface ViewController ()
{
    UIButton *_startButton;
    UIButton *_shareButton;
    Scene * _scene;
}

@property (weak,nonatomic) IBOutlet SKView * gameView;
@property (weak,nonatomic) IBOutlet UILabel * bestScoreLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Create and configure the scene.
    CGRect bounds = self.gameView.bounds;
    _scene = [Scene sceneWithSize: bounds.size];
    _scene.scaleMode = SKSceneScaleModeAspectFill;
    [_scene setDelegate: self];
    
    // Present the scene.
    [self.gameView presentScene: _scene];
    [self _showBestScore];

//    CGSize size = CGSizeMake(107, 38);
//    _startButton = [[UIButton alloc] initWithFrame: CGRectMake((bounds.size.width - size.width) / 2, 240, size.width, size.height)];
//    [_startButton setImage: [UIImage imageNamed: @"restart"]
//                  forState: UIControlStateNormal];
//    [_startButton addTarget: self
//                     action: @selector(_handleStartButtonTappedEvent:)
//           forControlEvents: UIControlEventTouchUpInside];
//    [[self view] addSubview: _startButton];
//    
//    CGRect frame = CGRectMake((bounds.size.width - size.width) / 2, 300, size.width, size.height);
//    _shareButton = [[UIButton alloc] initWithFrame: frame];
//    [_shareButton setImage: [UIImage imageNamed: @"share"]
//                  forState: UIControlStateNormal];
//    [_shareButton addTarget: self
//                     action: @selector(_handleShareButtonTappedEvent:)
//           forControlEvents: UIControlEventTouchUpInside];
//    
//    [[self view] addSubview: _shareButton];
    
}

- (void)_showBestScore
{
    self.bestScoreLabel.text = F(@"Best Score: %lu",(unsigned long)[Score bestScore]);
}

#pragma mark - Bouncing scene delegate

- (void)eventStart
{
    
}

- (void)sceneWillPlayGame: (Scene *)scene
{
    [_shareButton setAlpha: 0];
}

- (void)eventWasted
{
    UIView * flash = [[UIView alloc] initWithFrame:self.view.frame];
    flash.backgroundColor = [UIColor whiteColor];
    flash.alpha = .8;
    [self.view.window addSubview:flash];
    [UIView animateWithDuration:.8
                     animations: (^
                                  {
                                      flash.alpha = .0;
                                  })
                     completion: (^(BOOL finished)
                                  {
                                      [flash removeFromSuperview];
                                      
                                      [DataService playSound: @"die"];
                                  })];
    [_startButton setAlpha: 1];
    [_shareButton setAlpha: 1];
    
    [self _showBestScore];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)_handleShareButtonTappedEvent: (id)sender
{
    
}

- (void)_handleStartButtonTappedEvent: (id)sender
{
    [_startButton setAlpha: 0];
    [_shareButton setAlpha: 0];
  
    [_scene startPlayGame];    
}

@end
