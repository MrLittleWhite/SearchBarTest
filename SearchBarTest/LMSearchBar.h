//
//  LMSearchBar.h
//  懒人听书
//
//  Created by lazy-ios-thuai on 13-11-1.
//
//

#import <UIKit/UIKit.h>

/**
 *  自定义的搜索框
 *  用在搜索视图控制器上
 */
@interface LMSearchBar : UISearchBar

@property (nonatomic, assign) BOOL centeredPlaceholder;

@property (nonatomic, strong) UIColor *barBgColor;

@property (nonatomic, strong) UIColor *textFieldBgColor;

- (void)adaptAppearance;

- (void)exchangeBgColor;

@end
