//
//  FluidLayoutTextController.m
//  CollectionViewDemo
//
//  Created by 蔡晓凡 on 16/4/17.
//
//

#import "FluidLayoutTextController.h"
#import "CXFCollectionViewCell.h"
static NSString *identifier = @"Cell";

@interface FluidLayoutTextController ()
{
    NSArray *sections;
}
@end

@implementation FluidLayoutTextController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    sections = @[
                 @{@"header":@"First With",
                   @"content":@"Hey, when will the three of us meet up later? how do you whant be shabi"},
                 @{@"header":@"Second With",
                   @"content":@"when everything's straightened out.jew newl gwoq nqpet enqn"},
                 @{@"header":@"Third With mku uig gfwe fewia fewi gterwo doqp",
                   @"content":@"That'll be just before sunset"},
                 @{@"header":@"First With",
                   @"content":@"Where?"},
                 @{@"header":@"Second With",
                   @"content":@"The dirt patch."},
                 @{@"header":@"Third With",
                   @"content":@"I guess we'll see Mac therefewf fefwwf lk ig yfguff fiuf ifty iufiuyfoiugur iuyur9 fgfuyf dsgdrd"},
                 ];
    
    
    

    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    flow.sectionInset = UIEdgeInsetsMake(10, 20, 30, 20);
    self.collectionView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flow];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[CXFCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    [self.view addSubview:self.collectionView];
    

}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return sections.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    NSArray *array = [self wordsInSection:section];
    return array.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *words = [self wordsInSection:indexPath.section];
    
    CXFCollectionViewCell * cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.maxWidth = collectionView.bounds.size.width;
    cell.text = words[indexPath.row];
    return cell;
    
}

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *words = [self wordsInSection:indexPath.section];
    CGSize size = [CXFCollectionViewCell sizeForContentString:words[indexPath.row] forMaxWidth:collectionView.bounds.size.width];
    
    return size;
}
- (NSArray *)wordsInSection:(NSInteger )section{
    
    NSString *content = [[sections objectAtIndex:section] objectForKey:@"content"];
    NSCharacterSet *space = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSArray *words = [content componentsSeparatedByCharactersInSet:space];
    return  words;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
