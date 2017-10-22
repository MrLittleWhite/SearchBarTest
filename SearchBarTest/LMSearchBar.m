//
//  LMSearchBar.m
//  懒人听书
//
//  Created by lazy-ios-thuai on 13-11-1.
//
//

#import "LMSearchBar.h"
#import "UITextField+PlaceHolder.h"

@implementation LMSearchBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.enablesReturnKeyAutomatically = YES;
        
        [self setImage:[UIImage imageNamed:@"icon_search_searchbox"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
        
        self.centeredPlaceholder = NO;
    }
    return self;
}

- (void)setBarBgColor:(UIColor *)barBgColor{
    _barBgColor = barBgColor;
}

- (void)setCenteredPlaceholder:(BOOL)centeredPlaceholder {
    _centeredPlaceholder = centeredPlaceholder;
    SEL centerSelector = NSSelectorFromString([NSString stringWithFormat:@"%@%@", @"setCenter", @"Placeholder:"]);
    if ([self respondsToSelector:centerSelector]) {
        NSMethodSignature *signature = [[UISearchBar class] instanceMethodSignatureForSelector:centerSelector];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:centerSelector];
        [invocation setArgument:&centeredPlaceholder atIndex:2];
        [invocation invoke];
    }
}

- (void)setTextFieldBgColor:(UIColor *)textFieldBgColor{
    _textFieldBgColor = textFieldBgColor;
    
    UITextField*searchField = [self valueForKey:@"_searchField"];
    if (searchField) {

        searchField.backgroundColor = textFieldBgColor;

    }
}

- (void)layoutSubviews {
    
    [self adaptAppearance];
    
    [super layoutSubviews];
}

- (void)adaptAppearance {
    UITextField*searchField = [self valueForKey:@"_searchField"];
    if (searchField) {
//        searchField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:searchField.placeholder attributes:@{NSFontAttributeName:searchField.font}];
//        searchField.backgroundColor = self.textFieldBgColor;
//        searchField.layer.cornerRadius = searchField.frame.size.height/2.0;
//        searchField.clipsToBounds = YES;
        searchField.placeHolderOffsetY = 1;
    }
}

- (void)exchangeBgColor {
    UIColor *color = self.textFieldBgColor;
    self.textFieldBgColor = self.barBgColor;
    self.barBgColor = color;
}

@end
