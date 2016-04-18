//
//  CXFCollectionViewCell.h
//  CollectionView文字流布局
//
//  Created by 蔡晓凡 on 16/4/12.
//  Copyright © 2016年 蔡晓凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CXFCollectionViewCell : UICollectionViewCell



@property (nonatomic,strong) UILabel *label;
@property (copy,nonatomic) NSString *text;
@property (assign,nonatomic) CGFloat maxWidth;

+ (CGSize)sizeForContentString:(NSString *)s forMaxWidth:(CGFloat)maxWidth;
@end
