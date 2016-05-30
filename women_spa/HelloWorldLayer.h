//
//  HelloWorldLayer.h
//  women_spa
//
//  Created by himal on 5/23/14.
//  Copyright __MyCompanyName__ 2014. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    CGPoint lastPosition;
    int  touchSpriteIndex;
    BOOL isTouchedSprite;
    
    NSMutableArray *spriteArray;
    NSMutableArray *bubbleArray;
    CCSprite *sprite,*shop,*towel,*water,*shop_mask,*oil_mask,*water_drop1,*water_drop2,*water_drop3;
    CCSprite *eye_hair_extra[6];
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
