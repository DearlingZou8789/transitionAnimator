//
//  animatorTableViewController.m
//  transitionAnimation
//
//  Created by Damon on 15/10/14.
//  Copyright © 2015年 zhangle.in.iMac. All rights reserved.
//

#import "animatorTableViewController.h"
#import "ViewController.h"
#import "HUTransitionAnimator.h"

typedef NS_ENUM(NSInteger, HUTransitionType)
{
    Transition6Style,
    TransitionGhost,
    TransitionVerticalLines,
    TransitionHorizontalLines
};
@interface animatorTableViewController ()<UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>
@property (nonatomic) HUTransitionType transitionType;
@end

@implementation animatorTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationController.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identify = nil;
    switch (indexPath.row)
    {
        case 0:
            identify = @"6Style";
            break;
        case 1:
            identify = @"ghost";
            break;
        case 2:
            identify = @"VerticalLines";
            break;
        case 3:
            identify = @"HorizontalLines";
            break;
        default:
            break;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation
#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    HUTransitionAnimator *animator;
    switch (self.transitionType)
    {
        case TransitionGhost:
            animator = [[HUTransitionGhostAnimator alloc] init];
            break;
        case TransitionVerticalLines:
            animator = [[HUTransitionVerticalLinesAnimator alloc] init];
            break;
        case TransitionHorizontalLines:
            animator = [[HUTransitionHorizontalLinesAnimator alloc] init];
            break;
        case Transition6Style:
            animator = [[HUTransitionAnimator alloc] init];
            break;
    }
    animator.presenting = (operation == UINavigationControllerOperationPush) ? NO: YES;
    return animator;
}

#pragma mark - UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    id transition = [[HUTransitionVerticalLinesAnimator alloc] init];
    return transition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    id transition = [[HUTransitionHorizontalLinesAnimator alloc] init];
    return transition;
}

#pragma mark - storyboard跳转
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSString *identify = [segue identifier];
    if ([identify isEqualToString:@"6Style"])
    {
        self.transitionType = Transition6Style;
    }
    else if ([identify isEqualToString:@"Ghost"])
    {
        self.transitionType = TransitionGhost;
    }
    else if ([identify isEqualToString:@"VerticalLines"])
    {
        self.transitionType = TransitionVerticalLines;
    }
    else if([identify isEqualToString:@"HorizontalLines"])
    {
        self.transitionType = TransitionHorizontalLines;
    }
    ViewController *vc = [segue destinationViewController];
    vc.titleStr = identify;
    vc.transitioningDelegate = self;
}


@end
