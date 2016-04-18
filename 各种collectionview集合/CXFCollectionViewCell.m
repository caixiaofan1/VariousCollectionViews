//
//  CXFCollectionViewCell.m
//  CollectionView文字流布局
//
//  Created by 蔡晓凡 on 16/4/12.
//  Copyright © 2016年 蔡晓凡. All rights reserved.
//

#import "CXFCollectionViewCell.h"

@implementation CXFCollectionViewCell


- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.label = [[UILabel alloc]initWithFrame:self.contentView.bounds];
        self.label.opaque = NO;
        self.label.backgroundColor = [UIColor colorWithRed:0.8 green:0.9 blue:1.0 alpha:1.0];
        self.label.textColor = [UIColor blackColor];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [[self class] defaultFont];
        [self.contentView addSubview:self.label];
    }
    
    return  self;
}


- (void)setText:(NSString *)text{
    self.label.text = text;
    CGRect newLabelFrame = self.label.frame;
    CGRect newContentFrame = self.contentView.frame;
    CGSize textSize = [[self class] sizeForContentString:text forMaxWidth:_maxWidth];
    newLabelFrame.size = textSize;
    newContentFrame.size = textSize;
    self.label.frame = newLabelFrame;
    self.contentView.frame = newContentFrame;
}


+ (CGSize)sizeForContentString:(NSString *)s forMaxWidth:(CGFloat)maxWidth{
    CGSize maxSize = CGSizeMake(maxWidth, 1000);
    
    NSStringDrawingOptions opts = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    [style setLineBreakMode:NSLineBreakByCharWrapping];
    /*
     NSLineBreakByWordWrapping = 0,//以空格为边界，保留单词
     NSLineBreakByCharWrapping,    //保留整个字符
     NSLineBreakByClipping,        //简单剪裁，到边界为止
     NSLineBreakByTruncatingHead,  //按照"……文字"显示
     NSLineBreakByTruncatingTail,  //按照"文字……文字"显示
     NSLineBreakByTruncatingMiddle //按照"文字……"显示
     */
    
    NSDictionary *attributes = @{NSFontAttributeName : [self defaultFont],
                                 NSParagraphStyleAttributeName :style};
    CGRect rect = [s boundingRectWithSize:maxSize options:opts attributes:attributes context:nil];
    
    return rect.size;
}

+(UIFont *)defaultFont{
    return [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}
@end
