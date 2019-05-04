//
//  NLAnswerStatisticsVC.m
//  NiceLooTeacher
//
//  Created by 赵优路 on 2019/4/30.
//  Copyright © 2019 NiceLoo. All rights reserved.
//

#import "NLAnswerStatisticsVC.h"
#import <Flutter/Flutter.h>
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>
@interface NLAnswerStatisticsVC ()
{
    FlutterViewController *flutterViewController;
}
@end

@implementation NLAnswerStatisticsVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    flutterViewController = [[FlutterViewController alloc]init];
    [GeneratedPluginRegistrant registerWithRegistry:[flutterViewController pluginRegistry]];
    [flutterViewController setInitialRoute:@"answerStatistics"];
    
    [self addChildViewController:flutterViewController];
    [flutterViewController didMoveToParentViewController:self];
    flutterViewController.view.frame = self.view.bounds;
    [self.view addSubview: flutterViewController.view];
    
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
     [self.navigationController setNavigationBarHidden:NO animated:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
- (void)dealloc
{
    
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
