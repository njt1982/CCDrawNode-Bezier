//
//  CCDrawNode+Bezier.h
//
//  Created by Nicholas Thompson on 25/01/2015.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CCDrawNode (CCDrawNodeBezier) {
    
}

-(void) drawQuadraticBezierSegmentFrom:(CGPoint)p0 to:(CGPoint)p2 controlPoint1:(CGPoint)p1 segments:(NSUInteger)segments radius:(CGFloat)radius color:(CCColor *)color;
-(void) drawCubicBezierSegmentFrom:(CGPoint)p0 to:(CGPoint)p3 controlPoint1:(CGPoint)p1 controlPoint2:(CGPoint)p2 segments:(NSUInteger)segments radius:(CGFloat)radius color:(CCColor *)color;

-(void) drawBezierLine:(NSArray *) points segments:(NSUInteger)segments radius:(CGFloat)radius color:(CCColor*)color;

@end
