# CDrawNode-Bezier
Extends the Cocos2D 3.x CCDrawNode class to provide Bezier line drawing


## Usage
* Include the extending category files where you need them:
```
#include "CCDrawNode+Bezier.h"
```
* Prepare an array of points to draw and draw them onto a `CCDrawNode`:
```
NSArray *test = @[
                [NSValue valueWithCGPoint:ccp(50,100)],
                [NSValue valueWithCGPoint:ccp(100,50)],
                [NSValue valueWithCGPoint:ccp(150,75)],
                [NSValue valueWithCGPoint:ccp(200,200)],
                [NSValue valueWithCGPoint:ccp(250,200)],
                [NSValue valueWithCGPoint:ccp(300,150)],
                [NSValue valueWithCGPoint:ccp(350,150)],
                [NSValue valueWithCGPoint:ccp(400,200)],
                [NSValue valueWithCGPoint:ccp(450,200)],
                ];
CCDrawNode *node = [CCDrawNode node];
[node drawBezierLine:test segments:8 radius:1.0f color:[CCColor redColor]];
[self addChild:node];
```

![Example Output](https://raw.githubusercontent.com/njt1982/CCDrawNode-Bezier/master/example.png)
