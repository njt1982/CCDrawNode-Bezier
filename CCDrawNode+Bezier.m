//
//  CCDrawNode+Bezier.m
//
//  Created by Nicholas Thompson on 25/01/2015.
//

#import "CCDrawNode+Bezier.h"


@implementation CCDrawNode (CCDrawNodeBezier)

-(CGPoint) calculateQuadraticPointForT:(CGFloat)T P0:(CGPoint)p0 P1:(CGPoint)p1 P2:(CGPoint)p2 {
    CGFloat invT = (1.0f - T);
    CGFloat invTT = invT * invT;
    
    CGFloat TT = T * T;

    
    return ccp(
               (invTT * p0.x) + (2 * invT * T * p1.x) + (TT * p2.x),
               (invTT * p0.y) + (2 * invT * T * p1.y) + (TT * p2.y)
               );
}

-(CGPoint) calculateCubicPointForT:(CGFloat)T P0:(CGPoint)p0 P1:(CGPoint)p1 P2:(CGPoint)p2 P3:(CGPoint)p3 {
    CGFloat invT = (1.0f - T);
    CGFloat invTTT = invT * invT * invT;
    CGFloat invTT = invT * invT;
    
    CGFloat TT = T * T;
    CGFloat TTT = T * T * T;
    
    return ccp(
               (invTTT * p0.x) + (3 * invTT * T * p1.x) + (3 * invT * TT * p2.x) + (TTT * p3.x),
               (invTTT * p0.y) + (3 * invTT * T * p1.y) + (3 * invT * TT * p2.y) + (TTT * p3.y)
               );
}



-(void) drawQuadraticBezierSegmentFrom:(CGPoint)p0 to:(CGPoint)p2 controlPoint1:(CGPoint)p1 segments:(NSUInteger)segments radius:(CGFloat)radius color:(CCColor *)color {
    CGFloat T, lT;
    CGPoint current, last;
    for (NSUInteger i = 1; i <= segments; i++) {
        T  = (CGFloat)i     / (CGFloat)segments;
        lT = (CGFloat)(i-1) / (CGFloat)segments;
        
        current = [self calculateQuadraticPointForT:T  P0:p0 P1:p1 P2:p2];
        last    = [self calculateQuadraticPointForT:lT P0:p0 P1:p1 P2:p2];
        
        [self drawSegmentFrom:last to:current radius:radius color:color];
    }
}



-(void) drawCubicBezierSegmentFrom:(CGPoint)p0 to:(CGPoint)p3 controlPoint1:(CGPoint)p1 controlPoint2:(CGPoint)p2 segments:(NSUInteger)segments radius:(CGFloat)radius color:(CCColor *)color {
    CGFloat T, lT;
    CGPoint current, last;
    for (NSUInteger i = 1; i <= segments; i++) {
        T  = (CGFloat)i     / (CGFloat)segments;
        lT = (CGFloat)(i-1) / (CGFloat)segments;
        
        current = [self calculateCubicPointForT:T  P0:p0 P1:p1 P2:p2 P3:p3];
        last    = [self calculateCubicPointForT:lT P0:p0 P1:p1 P2:p2 P3:p3];
        
        [self drawSegmentFrom:last to:current radius:radius color:color];
    }
}




-(void) drawBezierLine:(NSArray *) points segments:(NSUInteger)segments radius:(CGFloat)radius color:(CCColor*)color {
    CGPoint p0, p1, p2, p3;

    for (NSUInteger i = 2; i < points.count; i+=2) {
        if (i == 2) {
            p0 = [points[i-2] CGPointValue];
            p1 = [points[i-1] CGPointValue];
            p2 = [points[i-1] CGPointValue];
            p3 = [points[i  ] CGPointValue];
        }
        else {
            p0 = [points[i-2] CGPointValue];
            p1 = ccpAdd([points[i-2] CGPointValue], ccpSub([points[i-2] CGPointValue], [points[i-3] CGPointValue]));
            p2 = [points[i-1] CGPointValue];
            p3 = [points[i  ] CGPointValue];
        }
        
        [self drawCubicBezierSegmentFrom:p0 to:p3 controlPoint1:p1 controlPoint2:p2 segments:segments radius:radius color:color];
    }
}

@end
