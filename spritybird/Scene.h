//
//  BouncingScene.h
//  Bouncing
//
//  Created by Seung Kyun Nam on 13. 7. 24..
//  Copyright (c) 2013년 Seung Kyun Nam. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class Scene;

@protocol BoucingSceneDelegate <NSObject>

- (void) eventStart;
- (void) sceneWillPlayGame: (Scene *)scene;
- (void) eventWasted;

@end

@interface Scene : SKScene<SKPhysicsContactDelegate>

@property (unsafe_unretained,nonatomic) id<BoucingSceneDelegate> delegate;

- (void)startPlayGame;

@end
