//
//  ViewController.m
//  iOS9NSUserActivity
//
//  Created by liuk on 15/9/22.
//  Copyright © 2015年 Kai Liu. All rights reserved.
//

#import "ViewController.h"
#import "AdamViewController.h"
#import "EveViewController.h"
#import "LilithViewController.h"

@interface ViewController ()
@property (nonatomic, strong)NSUserActivity *activity;
@end

@implementation ViewController
{
    NSArray *titleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addUserActivity];
    self.navigationItem.title = @"Eden";

}
- (void)addUserActivity{
    _activity = [[NSUserActivity alloc]initWithActivityType:@"cn.com.lk"];
    _activity.title = @"Eden";

    _activity.keywords = [NSSet setWithArray:@[@"Adam", @"Lilith", @"Eve"]];
    _activity.eligibleForHandoff = NO;
    _activity.eligibleForSearch = YES;
    [_activity becomeCurrent];
}
- (void)restoreUserActivityState:(NSUserActivity *)activity{
    if ([activity.title isEqualToString:@"Adam"]) {
        AdamViewController *adamView = [[AdamViewController alloc]init];
        [self.navigationController pushViewController:adamView animated:YES];
    }else if([activity.title isEqualToString:@"Lilith"]){
        LilithViewController *lilithView = [[LilithViewController alloc]init];
        [self.navigationController pushViewController:lilithView animated:YES];
    }else  if([activity.title isEqualToString:@"Eve"]){
        EveViewController *eveView = [[EveViewController alloc]init];
        [self.navigationController pushViewController:eveView animated:YES];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Adam";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"Lilith";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"Eve";
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        AdamViewController *adamView = [[AdamViewController alloc]init];
        [self.navigationController pushViewController:adamView animated:YES];
    
    }else if(indexPath.row == 1){
        LilithViewController *lilithView = [[LilithViewController alloc]init];
        [self.navigationController pushViewController:lilithView animated:YES];
    }else{
        EveViewController *eveView = [[EveViewController alloc]init];
        [self.navigationController pushViewController:eveView animated:YES];
    }

}
@end
