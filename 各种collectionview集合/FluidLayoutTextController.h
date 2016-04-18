//
//  FluidLayoutTextController.h
//  CollectionViewDemo
//
//  Created by 蔡晓凡 on 16/4/17.
//
//

#import <UIKit/UIKit.h>

@interface FluidLayoutTextController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)  UICollectionView *collectionView;
@end
