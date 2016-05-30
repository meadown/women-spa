//
//  spa.h
//  women_spa
//
//  Created by himal on 5/23/14.
//
//

#import "cocos2d.h"

@interface spa : CCLayer
{
    CGPoint lastPosition;
    int  touchSpriteIndex;
    BOOL isTouchedSprite;
    
    NSMutableArray *spriteArray;
   CCSprite *eye_cap1,*eye_cap,*greeh_mask,*water_drop1,*water_drop2,*water_drop3,*brush1,*brush;
    
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
