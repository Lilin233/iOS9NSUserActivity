//
//  LilithViewController.m
//  iOS9NSUserActivity
//
//  Created by liuk on 15/9/24.
//  Copyright © 2015年 Kai Liu. All rights reserved.
//

#import "LilithViewController.h"

@interface LilithViewController ()
@property (nonatomic, strong)NSUserActivity *activity;

@end

@implementation LilithViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"red sea";
    [self addUserActivity];

}
- (void)addUserActivity{
    _activity = [[NSUserActivity alloc]initWithActivityType:@"lilith"];
    _activity.title = @"Lilith";
    
    _activity.keywords = [NSSet setWithArray:@[@"Lilith"]];
    _activity.eligibleForHandoff = NO;
    _activity.eligibleForSearch = YES;
    [_activity becomeCurrent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
