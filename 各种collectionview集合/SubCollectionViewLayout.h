//
//  SubCollectionViewLayout.h
//  自定义布局瀑布流实现
//
//  Created by tcyf-2 on 16/3/8.
//  Copyright © 2016年 tcyf-2. All rights reserved.
//

#import <UIKit/UIKit.h>
/** 每一行之间的间距 */
static const CGFloat JPDefaultRowMargin = 10;
/** 每一列之间的间距 */
static const CGFloat JPDefaultColumnMargin = 10;
/** 每一列之间的间距 top, left, bottom, right */
static const UIEdgeInsets JPDefaultInsets = {10, 10, 10, 10};
/** 默认的列数 */
static const int JPDefaultColumsCount = 3;
@interface SubCollectionViewLayout : UICollectionViewLayout


/** 每一列的最大Y值 */
@property (nonatomic, strong) NSMutableArray *columnMaxYs;
/** 存放所有cell的布局属性 */
@property (nonatomic, strong) NSMutableArray *attrsArray;
@end
