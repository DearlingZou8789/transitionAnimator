//
//  animatorTableViewController.m
//  transitionAnimation
//
//  Created by Damon on 15/10/14.
//  Copyright © 2015年 zhangle.in.iMac. All rights reserved.
//

#import "animatorTableViewController.h"
#import "ViewController.h"

typedef NS_ENUM(NSInteger, HUTransitionType)
{
    Transition6Style,
    TransitionGhost,
    TransitionVerticalLines,
    TransitionHorizontalLines
};
@interface animatorTableViewController ()
@property (nonatomic) HUTransitionType transitionType;
@end

@implementation animatorTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    vc.transitioningDelegate = self;
}


@end
