//
//  HelloWorldLayer.m
//  women_spa
//
//  Created by himal on 5/23/14.
//  Copyright __MyCompanyName__ 2014. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "spa.h"
// HelloWorldLayer implementation

@implementation HelloWorldLayer

static int count=40;
static int count1=0;
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
		self.isTouchEnabled=YES;
		
        CGSize size = [[CCDirector sharedDirector] winSize];
        
                    CCSprite *backpic =[CCSprite spriteWithFile:@"back-568h@2x.png"];
            backpic.position =ccp(size.height/2,size.width/2);
            [self addChild:backpic z:-1];
        
        
        
        
        spriteArray=[[NSMutableArray alloc] init];
        bubbleArray=[[NSMutableArray alloc] init];
        
        CCSprite *body=[ CCSprite spriteWithFile:@"spa_xzt_fs_2.png"];
        body.position =  ccp( size.width /2 , size.height/2-28 );
		[self addChild: body z:0];
        
        
        
        oil_mask=[ CCSprite spriteWithFile:@"spa_hzt_hc.png"];
		oil_mask.position =  ccp( size.width /2 , size.height/2-28);
		[self addChild: oil_mask z:1];
        oil_mask.visible=count;
        
        
        shop_mask=[ CCSprite spriteWithFile:@"spa_hzt_pp.png"];
		shop_mask.position =  ccp( size.width /2 , size.height/2-28);
		[self addChild: shop_mask z:1];
        shop_mask.visible = 0;
        
        
        
        
        CCSprite *head=[ CCSprite spriteWithFile:@"spa_hzt_tj.png"];
		head.position =  ccp( size.width/2 , size.height/2-28 );
		[self addChild: head z:2];
        
        
        
        CCSprite *eye=[ CCSprite spriteWithFile:@"spa_hzt_yj_1.png"];
		eye.position =  ccp( size.width/2 , size.height/2+22 );
		[self addChild: eye z:3];
        
        
        CCSprite *eye_hair=[ CCSprite spriteWithFile:@"spa_hzt_mm.png"];
		eye_hair.position =  ccp( size.width/2 , size.height/2+32 );
		[self addChild: eye_hair z:3];
        
        //*eye_hair_extra,*eye_hair_extra1,*eye_hair_extra2,*eye_hair_extra3,*eye_hair_extra4,*eye_hair_extra5

        //right eye
        int positions[6][2] = {
            size.width/2+40, size.height/2+39,
            size.width/2+60 , size.height/2+45,
            size.width/2+80 , size.height/2+47,
            size.width/2-40 , size.height/2+37,
            size.width/2-60 , size.height/2+43,
            size.width/2-80 , size.height/2+45,
        };
        
        for (int i=0; i<6; ++i) {
            eye_hair_extra[i]=[ CCSprite spriteWithFile:[NSString stringWithFormat:@"spa_hzt_mm%@.png", i<3 ? @"y":@"z"]];
            eye_hair_extra[i].position =  ccp(positions[i][0] , positions[i][1]);
            [self addChild:eye_hair_extra[i] z:3];
        }
        
        water=[CCSprite spriteWithFile:@"spa_tool_pt.png"];
        water.anchorPoint=ccp(0.6f, 0.8f);
        water.position= ccp(size.width/2+30, 40);
        [self addChild:water z:4];
        [spriteArray addObject:water];
        
        
        water_drop1=[ CCSprite spriteWithFile:@"spa_hzt_sd.png"];
		water_drop1.position =  ccp( size.width/2-50 , size.height/2-60 );
		[self addChild: water_drop1 z:2];
        water_drop1.visible=count1;
        
        water_drop2=[ CCSprite spriteWithFile:@"spa_hzt_sd.png"];
		water_drop2.position =  ccp( size.width/2+50 , size.height/2-60 );
		[self addChild: water_drop2 z:2];
        water_drop2.visible=count1;

        water_drop3=[ CCSprite spriteWithFile:@"spa_hzt_sd.png"];
		water_drop3.position =  ccp( size.width/2 , size.height/2 );
		[self addChild: water_drop3 z:2];
        water_drop3.visible=count1;

        
        
        shop=[CCSprite spriteWithFile:@"spa_tool_hm.png"];
       shop.position= ccp( size.width/2+150 , size.height/2-180 );
        [self addChild:shop z:6];
        [spriteArray addObject:shop];
        
                
        
        
               
        towel=[CCSprite spriteWithFile:@"spa_tool_mj.png"];
        towel.position= ccp( size.width/2-140 , size.height/2-295 );
        [self addChild:towel z:5];
        [spriteArray addObject:towel];
      
        
        CCSprite *hairclean=[ CCSprite spriteWithFile:@"spa_tool_mj2.png"];
		hairclean.position =  ccp( size.width/2+165 , size.height/2-60 );
		[self addChild: hairclean z:3];
        [spriteArray addObject:hairclean];
        
        [self menu];
        
	}
	return self;
}

-(void) menu
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    CCMenuItemImage *backbutton =[CCMenuItemImage itemFromNormalImage:@"forward.png" selectedImage:@"forward.png" target:self selector:@selector(forward)];
    CCMenu *menu=[CCMenu menuWithItems:backbutton, nil];
    [self addChild:menu];
     menu.position=ccp(size.width-20,size.height-25 );
}

-(void) forward
{
    [[CCDirector sharedDirector] replaceScene:[spa scene]];
}


-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch=[touches anyObject];
    CGPoint location=[touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    NSLog(@"ccTouchesEnded location (%f %f)...", location.x, location.y);
    
    
    isTouchedSprite=NO;
    int itemCount=[spriteArray count];
    
    for (int i=0; i<itemCount; i++) {
        CCSprite *catchSprite=[spriteArray objectAtIndex:i];
        CGRect spriteBox=[catchSprite boundingBox];
               NSLog(@"Sprite  Box (%f %f %f %f)", spriteBox.origin.x, spriteBox.origin.y, spriteBox.size.width, spriteBox.size.height);
        
        NSLog(@"TOuched On Sprite %d", touchSpriteIndex);

        
        if (CGRectContainsPoint(spriteBox, location)) {
            NSLog(@"TOuched On Sprite %d", i);
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
    
       
    if(touchSpriteIndex==3)
    {
        CCSprite *catchSprite=[spriteArray objectAtIndex:touchSpriteIndex];
        catchSprite.position=lastPosition;
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        CGRect spriteBox=[catchSprite boundingBox];
        
        CCMoveTo *move1=[ CCMoveTo actionWithDuration:0.5f position:ccp(size.width/2-17 , size.height/2+73)];
        CCMoveTo *move2=[ CCMoveTo actionWithDuration:0.5f position:ccp(size.width/2+7 , size.height/2+70)];
        CCMoveTo *move3=[ CCMoveTo actionWithDuration:0.5f position:ccp(size.width/2+26 , size.height/2+66)];
        CCMoveTo *move4=[ CCMoveTo actionWithDuration:0.5f position:ccp(size.width/2+136 , size.height/2+75)];
        CCMoveTo *move5=[ CCMoveTo actionWithDuration:0.5f position:ccp(size.width/2+177 , size.height/2+75)];
        CCMoveTo *move6=[ CCMoveTo actionWithDuration:0.5f position:ccp(size.width/2+98 , size.height/2+67)];
        CCMoveTo *move7=[ CCMoveTo actionWithDuration:0.5f position:ccp(size.width/2+165 , size.height/2-60)];
        
        
        if(spriteBox.origin.x==259 && spriteBox.origin.y== 189 && spriteBox.size.width==132 && spriteBox.size.height==70)
        {
            CCSequence *sequence1 =[ CCSequence actions:move1,move2,move3,move4,move5,move6,move7, nil];
            
            
//            [catchSprite runAction:sequence1];
            
        }
    }
    if (isTouchedSprite) {
        CCSprite *catchSprite=[spriteArray objectAtIndex:touchSpriteIndex];
        catchSprite.position=lastPosition;
    }
    
    
    }


-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch=[touches anyObject];
    CGPoint location=[touch locationInView:[touch view]];
    location=[[CCDirector sharedDirector] convertToGL:location];
    location = [self convertToNodeSpace:location];
    
    if(touchSpriteIndex==3)
    {
        for (int i=0; i<6; ++i) {
            
            CCSprite *catchSprite=[spriteArray objectAtIndex:touchSpriteIndex];
            CGRect box = [eye_hair_extra[i] boundingBox];
            //NSLog(@"Box %d (%f %f %f %f) location (%f %f)", i, box.origin.x, box.origin.y, box.size.width, box.size.height, location.x, location.y);
            
            CGPoint tipPoint=CGPointMake(location.x-catchSprite.boundingBox.size.width/2, location.y-catchSprite.boundingBox.size.height/2);
            
            if (CGRectContainsPoint(box, tipPoint))
                eye_hair_extra[i].visible=FALSE;
        }
    }
    
    

    if(touchSpriteIndex==1)
    {
        CCSprite *catchSprite=[spriteArray objectAtIndex:touchSpriteIndex];
        
        
        CGRect spriteBox=[catchSprite boundingBox];
        if( spriteBox.origin.x==103.000000 && spriteBox.origin.y== 170.00 && spriteBox.origin.y==132.0 && spriteBox.origin.y==144.0);
        //shop_mask.visible=1;
        
        for (int y=0; y<3; y++) {
            CCSprite *bubble=[CCSprite spriteWithFile:@"soap_bubble.png"];
            [self addChild:bubble z:1];
            bubble.position=ccp(location.x-20+arc4random()%40, location.y-20+arc4random()%40);
            bubble.scale=1.5f+(1/arc4random()%10);
            [bubbleArray addObject:bubble];
        }
    }
    
    if(touchSpriteIndex==2)
    {
        CCSprite *catchSprite=[spriteArray objectAtIndex:touchSpriteIndex];
        
        
        CGRect spriteBox=[catchSprite boundingBox];
        if( spriteBox.origin.x==103.000000 && spriteBox.origin.y== 170.00 && spriteBox.origin.y==132.0 && spriteBox.origin.y==144.0);
        
        shop_mask.visible=0;
        oil_mask.visible=0;
        water_drop1.visible=0;
        water_drop2.visible=0;
        water_drop3.visible=0;
        count=0;
        count1=0;
    }
    
    if(touchSpriteIndex==0)
    {
        CCSprite *catchSprite=[spriteArray objectAtIndex:touchSpriteIndex];
        catchSprite.position=lastPosition;
        
        CGRect spriteBox=[catchSprite boundingBox];
        
        if(spriteBox.origin.x==61 && spriteBox.origin.y== -286 && spriteBox.size.width==182 && spriteBox.size.height==600);
        oil_mask.visible=0;
        water_drop1.visible=1;
        water_drop2.visible=1;
        water_drop3.visible=1;
        count=0;
        
        for (int j=0; j<[bubbleArray count]; ++j) {
            
            CCSprite *getBubble=[bubbleArray objectAtIndex:j];
            CGRect box = [getBubble boundingBox];
            box = CGRectMake(box.origin.x-30, box.origin.y-30, box.size.width+60, box.size.height+60);
            if (CGRectContainsPoint(box, location))
                getBubble.visible=FALSE;
        }
    }

    if (isTouchedSprite) {
        CCSprite *catchSprite=[spriteArray objectAtIndex:touchSpriteIndex];
        catchSprite.position=location;
    }
}

/*
 81.000000 321.000000
 101.500000 319.000000
 */








// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end


