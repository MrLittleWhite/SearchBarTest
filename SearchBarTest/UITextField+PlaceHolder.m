//
//  UITextField+PlaceHolder.m
//  lazyaudio
//
//  Created by lazy-iOS2 on 2017/10/12.
//

#import "UITextField+PlaceHolder.h"
#import <objc/runtime.h>

@implementation UITextField (PlaceHolder)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(placeholderRectForBounds:);
        SEL swizzledSelector = @selector(swizzled_placeholderRectForBounds:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod = class_addMethod(class, swizzledSelector,
                                            method_getImplementation(swizzledMethod),
                                            method_getTypeEncoding(swizzledMethod));
        if (!didAddMethod) {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (CGRect)swizzled_placeholderRectForBounds:(CGRect)rect
{
    CGRect newRect = rect;
    newRect.origin.y += self.placeHolderOffsetY;
    return [self swizzled_placeholderRectForBounds:newRect];
}

- (void)setPlaceHolderOffsetY:(float)offsetY {
    objc_setAssociatedObject(self, @selector(placeHolderOffsetY), @(offsetY), OBJC_ASSOCIATION_ASSIGN);
}

- (float)placeHolderOffsetY {
    NSNumber *typeNum = objc_getAssociatedObject(self, _cmd);
    return typeNum.floatValue;
}

@end
