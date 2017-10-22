//
//  ViewController.m
//  SearchBarTest
//
//  Created by lazy-iOS2 on 2017/10/18.
//  Copyright © 2017年 lazy-iOS2. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.searchBar.placeholder = @"哈哈哈哈哈哈";
    [self.searchBar becomeFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
