//
//  ViewController.h
//  各种collectionview集合
//
//  Created by 蔡晓凡 on 16/4/18.
//  Copyright © 2016年 蔡晓凡. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APLTransitionController.h"
@interface ViewController : UITableViewController <UINavigationControllerDelegate,APLTransitionControllerDelegate>
@property (nonatomic, strong) APLTransitionController *transitionController;

@end

