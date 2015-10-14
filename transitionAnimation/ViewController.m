//
//  ViewController.m
//  transitionAnimation
//
//  Created by Damon on 15/10/14.
//  Copyright © 2015年 zhangle.in.iMac. All rights reserved.
//

#import "ViewController.h"
#import "SliderTransitionAnimator.h"
#import "HUTransitionAnimator.h"

//UINavigationControllerDelegate通过导航控制器展示的过渡动画
//树形结构导航自定义过渡动画
//
@interface ViewController ()<UINavigationControllerDelegate, UIViewControllerTransitioningDelegate>

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)setTitleStr:(NSString *)titleStr
{
    _titleStr = titleStr;
    self.textLabel.text = titleStr;
}

- (IBAction)nextVCAction:(UIButton *)sender {
    ViewController *vc = [[ViewController alloc] init];
    if (self.navigationController)
    {
        [self.navigationController pushViewController:vc animated:YES];
    }
    else
    {
        [self presentViewController:vc animated:YES completion:nil];
    }
}

- (IBAction)topVCAction:(UIButton *)sender {
    if (self.navigationController)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

// 树形导航过渡动画
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    SliderTransitionAnimator *animator = [[SliderTransitionAnimator alloc] init];
    animator.isPresenting = (operation == UINavigationControllerOperationPop)?NO:YES;
    return animator;
}

// 模态导航自定义过渡动画
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return nil;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
