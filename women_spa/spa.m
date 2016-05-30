//
//  spa.m
//  women_spa
//
//  Created by himal on 5/23/14.
//
//

#import "spa.h"
#import "HelloWorldLayer.h"
@implementation spa


+(CCScene *) scene
{
	
	CCScene *scene = [CCScene node];
    spa *layer=[spa node];
    [scene addChild: layer];
    return scene;
}

-(id) init
{
    if( (self=[super init])) {

        
        self.isTouchEnabled=YES;
        
        CGSize size = [[CCDirector sharedDirector] winSize];

        
       
            CCSprite *backpic =[CCSprite spriteWithFile:@"back-568h@2x.png"];
            backpic.position =ccp(size.height/2,size.width/2);
            [self addChild:backpic z:-1];
        

        
        spriteArray=[[NSMutableArray alloc] init];
        
        CCSprite *body2=[ CCSprite spriteWithFile:@"spa_xzt_fs_2.png"];
        body2.position =  ccp( size.width /2 , size.height/2-28 );
		[self addChild: body2 z:0];

        
        
       greeh_mask=[ CCSprite spriteWithFile:@"spa_hzt_mmn.png"];
        greeh_mask.position =  ccp( size.width /2 , size.height/2-28 );
        [self addChild: greeh_mask z:1];
        greeh_mask.visible =0;

        
        CCSprite *head=[ CCSprite spriteWithFile:@"spa_hzt_tj.png"];
		
		head.position =  ccp( size.width/2 , size.height/2-28 );
		[self addChild: head z:2];
    
        
        CCSprite *eye=[ CCSprite spriteWithFile:@"spa_hzt_yj_1.png"];
		
		eye.position =  ccp( size.width/2 , size.height/2+22 );
		
		
		[self addChild: eye z:3];
        
        
        CCSprite *eye_hair=[ CCSprite spriteWithFile:@"spa_hzt_mm.png"];
		
		eye_hair.position =  ccp( size.width/2 , size.height/2+32 );
		
		
		[self addChild: eye_hair z:3];
        

        
        //right
        eye_cap1=[ CCSprite spriteWithFile:@"spa_tool_hg.png"];
        eye_cap1.position =  ccp( size.width/2+135 , size.height/2-90 );
		[self addChild: eye_cap1 z:4];
        [spriteArray addObject:eye_cap1];
        
        //left
        eye_cap=[ CCSprite spriteWithFile:@"spa_tool_hg.png"];
        eye_cap.position =  ccp( size.width/2-135 , size.height/2-90 );
		[self addChild: eye_cap z:4];
        [spriteArray addObject:eye_cap];
        
        
        brush=[ CCSprite spriteWithFile:@"spa_tool_mms1.png"];
		brush.position =  ccp( size.width/2+180 , size.height/2-150);
		[self addChild: brush z:8];
        [spriteArray addObject:brush];

        brush1=[ CCSprite spriteWithFile:@"spa_tool_mms2.png"];
		brush1.position =  ccp( size.width/2+180 , size.height/2-150);
		[self addChild: brush1 z:8];
        [spriteArray addObject:brush1];
        brush1.visible=0;
       CCSprite *towel=[CCSprite spriteWithFile:@"spa_tool_mj.png"];
        towel.position= ccp( size.width/2-190 , size.height/2-295 );
        [self addChild:towel z:6];
        [spriteArray addObject:towel];

        CCSprite *water=[CCSprite spriteWithFile:@"spa_tool_pt.png"];
        water.position= ccp( size.width/2-95 , size.height-720 );
        [self addChild:water z:6];
        [spriteArray addObject:water];
        
        CCSprite *cup=[ CCSprite spriteWithFile:@"spa_tool_mmw.png"];
		cup.position =  ccp( size.width/2+60 , size.height/2-235 );
		[self addChild: cup z:6];
        
        CCSprite *cup_cream=[ CCSprite spriteWithFile:@"spa_tool_mmn.png"];
		cup_cream.position =  ccp( size.width/2+60 , size.height/2-240 );
		[self addChild: cup_cream z:7];
        
        
        water_drop1=[ CCSprite spriteWithFile:@"spa_hzt_sd.png"];
		water_drop1.position =  ccp( size.width/2-50 , size.height/2-60 );
		[self addChild: water_drop1 z:2];
        water_drop1.visible=0;
        
        water_drop2=[ CCSprite spriteWithFile:@"spa_hzt_sd.png"];
		water_drop2.position =  ccp( size.width/2+50 , size.height/2-60 );
		[self addChild: water_drop2 z:2];
        water_drop2.visible=0;
        
        water_drop3=[ CCSprite spriteWithFile:@"spa_hzt_sd.png"];
		water_drop3.position =  ccp( size.width/2 , size.height/2 );
		[self addChild: water_drop3 z:2];
        water_drop3.visible=0;
        
        [self menu];
        
    }
    return self;
    
}

-(void) menu
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    CCMenuItemImage *backbutton =[CCMenuItemImage itemFromNormalImage:@"backButton.png" selectedImage:@"backButton.png" target:self selector:@selector(goback)];
    CCMenu *menu=[CCMenu menuWithItems:backbutton, nil];
    [self addChild:menu];
    menu.position=ccp(size.width-20,size.height-25 );
 
}

-(void) goback
{
    [[CCDirector sharedDirector] replaceScene:[HelloWorldLayer scene]];
}





-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch=[touches anyObject];
    CGPoint location=[touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
        
    
    isTouchedSprite=NO;
    int itemCount=[spriteArray count];
    
    for (int i=0; i<itemCount; i++) {
        CCSprite *catchSprite=[spriteArray objectAtIndex:i];
        CGRect spriteBox=[catchSprite boundingBox];
        
        NSLog(@"TOuched On Sprite %d", touchSpriteIndex);

        if (CGRectContainsPoint(spriteBox, location)) {
            
            isTouchedSprite=YES;
            touchSpriteIndex=i;
            lastPosition=catchSprite.position;
            break;
        }
    }
}

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch=[touches anyObject];
    CGPoint location=[touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    
    
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    //right eye_cap
    if (touchSpriteIndex==0) {
        CCSprite *catchSprite=[spriteArray objectAtIndex:touchSpriteIndex];
        CGRect spriteBox=[catchSprite boundingBox];
        
        CCMoveTo *move1=[ CCMoveTo actionWithDuration:0.5f position:ccp(size.width/2+55.5,size.height/2-10)];
        CCMoveTo *move2=[ CCMoveTo actionWithDuration:0.5f position:ccp(size.width/2+135 , size.height/2-90)];
        //for 5
        if(size.height==568)
        {
            
            if(spriteBox.origin.x==255  && spriteBox.origin.y==154 && spriteBox.size.width==80 && spriteBox.size.height==80 && isTouchedSprite)
            {
                CCSequence *sequence1 =[ CCSequence actions:move1, nil];
                [catchSprite runAction:sequence1];
            }
            
            if (spriteBox.origin.x==175.50  && spriteBox.origin.y==234 && spriteBox.size.width==80 && spriteBox.size.height==80 && isTouchedSprite) {
                CCSequence *sequence2 =[ CCSequence actions:move2, nil];
                [catchSprite runAction:sequence2];
            }
        }
        
        // for lees 5
        else
        {
            
            if(spriteBox.origin.x==255  && spriteBox.origin.y==110 && spriteBox.size.width==80 && spriteBox.size.height==80 && isTouchedSprite)
            {
                CCSequence *sequence1 =[ CCSequence actions:move1, nil];
                [catchSprite runAction:sequence1];
            }
            
            if (spriteBox.origin.x==175.50  && spriteBox.origin.y==190 && spriteBox.size.width==80 && spriteBox.size.height==80 && isTouchedSprite) {
                CCSequence *sequence2 =[ CCSequence actions:move2, nil];
                [catchSprite runAction:sequence2];
            }

        }// close less 5
        
           }
    
    
    //left eye_cap
    if (touchSpriteIndex==1) {
        
        CCSprite *catchSprite=[spriteArray objectAtIndex:touchSpriteIndex];
        
        CGRect spriteBox=[catchSprite boundingBox];
        
        CCMoveTo *move1=[ CCMoveTo actionWithDuration:0.5f position:ccp(size.width/2-58.5,size.
                                                                        height/2-10)];
        CCMoveTo *move2=[ CCMoveTo actionWithDuration:0.5f position:ccp(size.width/2-135 , size.height/2-90 )];
        
        //for 5

        if(size.height==568)
        {         
            if(spriteBox.origin.x==-15  && spriteBox.origin.y==154 && spriteBox.size.width==80 && spriteBox.size.height==80 && isTouchedSprite)
            {
                CCSequence *sequence1 =[ CCSequence actions:move1, nil];
                [catchSprite runAction:sequence1];
            }
            
            if (spriteBox.origin.x==61.50  && spriteBox.origin.y==234 && spriteBox.size.width==80 && spriteBox.size.height==80 && isTouchedSprite)
            {
                CCSequence *sequence2 =[ CCSequence actions:move2, nil];
                [catchSprite runAction:sequence2];
            }
        }//close for 5
        
        
        //for less 5
        else
        {
            
            if(spriteBox.origin.x==-15  && spriteBox.origin.y==110 && spriteBox.size.width==80 && spriteBox.size.height==80 && isTouchedSprite)
            {
                CCSequence *sequence1 =[ CCSequence actions:move1, nil];
                [catchSprite runAction:sequence1];
            }
            
            if (spriteBox.origin.x==61.50  && spriteBox.origin.y==190 && spriteBox.size.width==80 && spriteBox.size.height==80 && isTouchedSprite)
            {
                CCSequence *sequence2 =[ CCSequence actions:move2, nil];
                [catchSprite runAction:sequence2];
            }
            
        }//close less 5
    }
    
    
    
    if (isTouchedSprite) {
        CCSprite *catchSprite=[spriteArray objectAtIndex:touchSpriteIndex];
        catchSprite.position=lastPosition;
    }
    
    
    
}


-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch=[touches anyObject];
    CGPoint location=[touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    
     NSLog(@"ccTouchesmoved location (%f %f)...", location.x, location.y);
    
    
    
    if(touchSpriteIndex==2)
    {
        CCSprite *catchSprite=[spriteArray objectAtIndex:touchSpriteIndex];
        
        CGRect spriteBox=[catchSprite boundingBox];
        
        
        if( spriteBox.origin.x==103.000000 && spriteBox.origin.y== 170.00 && spriteBox.origin.y==132.0 && spriteBox.origin.y==144.0);
        brush=brush1;

        
        if( spriteBox.origin.x==103.000000 && spriteBox.origin.y== 170.00 && spriteBox.origin.y==132.0 && spriteBox.origin.y==144.0);
        greeh_mask.visible=1;
        
    }

    
    if(touchSpriteIndex==4)
    {
        CCSprite *catchSprite=[spriteArray objectAtIndex:touchSpriteIndex];
        
        
        CGRect spriteBox=[catchSprite boundingBox];
        if( spriteBox.origin.x==103.000000 && spriteBox.origin.y== 170.00 && spriteBox.origin.y==132.0 && spriteBox.origin.y==144.0);
        
        greeh_mask.visible=0;
        water_drop1.visible=0;
        water_drop2.visible=0;
        water_drop3.visible=0;
        
    }

    
    
    if(touchSpriteIndex==5)
    {
        CCSprite *catchSprite=[spriteArray objectAtIndex:touchSpriteIndex];
        catchSprite.position=lastPosition;
        
        CGRect spriteBox=[catchSprite boundingBox];
        
        if(spriteBox.origin.x==61 && spriteBox.origin.y== -286 && spriteBox.size.width==182 && spriteBox.size.height==600);
        greeh_mask.visible=0;
        water_drop1.visible=1;
        water_drop2.visible=1;
        water_drop3.visible=1;
    }

    if (isTouchedSprite) {
        CCSprite *catchSprite=[spriteArray objectAtIndex:touchSpriteIndex];
        catchSprite.position=location;
    }
    

    
    
}







@end



//NSLog(@"Sprite  Box (%f %f %f %f)", spriteBox.origin.x, spriteBox.origin.y, spriteBox.size.width, spriteBox.size.height);

//NSLog(@"TOuched On Sprite %d", i);



