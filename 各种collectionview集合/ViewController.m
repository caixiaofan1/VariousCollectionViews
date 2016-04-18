//
//  ViewController.m
//  CollectionViewDemo
//
//  Created by liunan on 12-10-28.
//
//

#import "ViewController.h"
#import "LineLayoutViewController.h"
#import "CircleLayoutViewController.h"
#import "NormalLayoutViewController.h"
#import "StackLayoutViewController.h"
#import "FluidLayoutTextController.h"
#import "WaterFallController.h"
#import "SubCollectionViewLayout.h"
@interface ViewController ()

@end

@implementation ViewController

#pragma mark -
#pragma mark init

- (void)loadView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.view = tableView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (UICollectionViewFlowLayout *)normalFlowLayout
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init] ;
    flowLayout.itemSize = CGSizeMake(100, 80);
    flowLayout.headerReferenceSize = CGSizeMake(self.view.bounds.size.width, 40);
    flowLayout.footerReferenceSize = CGSizeMake(self.view.bounds.size.width, 20);
    return flowLayout;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewController *collectionController = nil;
    UIViewController *controller = nil;
    switch (indexPath.row) {
        case 0: {
            collectionController = [self normalLayoutController];
            [self.navigationController pushViewController:collectionController animated:YES];
            break;
        }
        case 1:
            collectionController = [self lineLayoutController];
            [self.navigationController pushViewController:collectionController animated:YES];
            break;
        case 2:
            collectionController = [self circleLayoutController];
            [self.navigationController pushViewController:collectionController animated:YES];
            break;
        case 3:
            collectionController = [self stackLayoutController];
            [self.navigationController pushViewController:collectionController animated:YES];
            break;
        case 4:
            controller = [self FluidLayoutTextController];
            [self.navigationController pushViewController:controller animated:YES];
            break;
        case 5:
            collectionController = [self WaterFallController];
            [self.navigationController pushViewController:collectionController animated:YES];
            
        default:
            break;
    }
    
    
}
- (UICollectionViewController *)WaterFallController
{
    SubCollectionViewLayout *layout = [[SubCollectionViewLayout alloc] init ];
    WaterFallController *collectionController = [[WaterFallController alloc] initWithCollectionViewLayout:layout ];
    return collectionController;
    
}
- (UICollectionViewController *)normalLayoutController
{
    UICollectionViewFlowLayout *flowLayout = [self normalFlowLayout];
    NormalLayoutViewController *collectionController = [[NormalLayoutViewController alloc] initWithCollectionViewLayout:flowLayout ];
    return collectionController;
}

- (UICollectionViewController *)lineLayoutController
{
    LineLayout *layout = [[LineLayout alloc] init ];
    LineLayoutViewController *collectionController = [[LineLayoutViewController alloc] initWithCollectionViewLayout:layout ];
    return collectionController;
}

- (UICollectionViewController *)circleLayoutController
{
    CircleLayout *layout = [[CircleLayout alloc] init];
    CircleLayoutViewController *collectionController = [[CircleLayoutViewController alloc] initWithCollectionViewLayout:layout ];
    return collectionController;
}


- (UIViewController *)FluidLayoutTextController
{
    
    FluidLayoutTextController *controller = [[FluidLayoutTextController alloc]init ];
    
    return controller;
    
}
- (UICollectionViewController *)stackLayoutController
{
    APLStackLayout* stackLayout = [[APLStackLayout alloc] init];
    StackLayoutViewController* collectionViewController = [[StackLayoutViewController alloc] initWithCollectionViewLayout:stackLayout];
    collectionViewController.title = @"Stack Layout";
    
    self.transitionController = [[APLTransitionController alloc] initWithCollectionView:collectionViewController.collectionView];
    self.transitionController.delegate = self;
    
    return collectionViewController;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSString *titleStr = nil;
    switch (indexPath.row) {
        case 0:
            titleStr = @"normal layout";
            break;
        case 1:
            titleStr = @"line layout";
            break;
        case 2:
            titleStr = @"cycle layout";
            break;
        case 3:
            titleStr = @"stack layout";
            break;
        case 4:
            titleStr = @"流布局字符串";
            break;
        case 5:
            titleStr = @"类似蘑菇街瀑布流";
        default:
            break;
    }
    cell.textLabel.text = titleStr;
    return cell;
}


- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                          interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController
{
    if (animationController==self.transitionController)
    {
        return self.transitionController;
    }
    return nil;
}


- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC
{
    if (![fromVC isKindOfClass:[UICollectionViewController class]] || ![toVC isKindOfClass:[UICollectionViewController class]])
    {
        return nil;
    }
    if (!self.transitionController.hasActiveInteraction)
    {
        return nil;
    }
    
    self.transitionController.navigationOperation = operation;
    return self.transitionController;
}

-(void)interactionBeganAtPoint:(CGPoint)p
{
    // Very basic communication between the transition controller and the top view controller
    // It would be easy to add more control, support pop, push or no-op
    UIViewController* viewController = [(APLCollectionViewController*)[self.navigationController topViewController] nextViewControllerAtPoint:p];
    if (viewController!=nil)
    {
        [self.navigationController pushViewController:viewController animated:YES];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
