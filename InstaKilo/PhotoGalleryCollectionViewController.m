//
//  PhotoGalleryCollectionViewController.m
//  InstaKilo
//
//  Created by Javier Xing on 2017-11-15.
//  Copyright © 2017 Javier Xing. All rights reserved.
//

#import "PhotoGalleryCollectionViewController.h"
#import "PhotoCell.h"
#import "HeaderView.h"

@interface PhotoGalleryCollectionViewController ()
@property (nonatomic, strong) NSMutableArray <UIImage*> *dogs;
@property (nonatomic, strong) NSMutableArray <UIImage*> *nonDogs;
@property (nonatomic, strong) NSMutableArray *gallery;
@end

@implementation PhotoGalleryCollectionViewController 

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dogs = [[NSMutableArray alloc]init];
    [self.dogs addObject:[UIImage imageNamed:@"image2"]];
    [self.dogs addObject:[UIImage imageNamed:@"image7"]];
    [self.dogs addObject:[UIImage imageNamed:@"image8"]];
    [self.dogs addObject:[UIImage imageNamed:@"image9"]];
    [self.dogs addObject:[UIImage imageNamed:@"image10"]];
    
    self.nonDogs = [[NSMutableArray alloc]init];
    [self.nonDogs addObject:[UIImage imageNamed:@"image1"]];
    [self.nonDogs addObject:[UIImage imageNamed:@"image3"]];
    [self.nonDogs addObject:[UIImage imageNamed:@"image4"]];
    [self.nonDogs addObject:[UIImage imageNamed:@"image5"]];
    [self.nonDogs addObject:[UIImage imageNamed:@"image6"]];
    
    self.gallery = [[NSMutableArray alloc]init];
    [self.gallery addObject:self.dogs];
    [self.gallery addObject:self.nonDogs];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[PhotoCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.gallery.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[self.gallery objectAtIndex:section] count];
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCell *cell = (PhotoCell*)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
        cell.photo.image = [self.gallery[indexPath.section] objectAtIndex:indexPath.item];

    
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    HeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        headerView.headerLabel.text = @"Dogs";
    }
    else if (indexPath.section == 1){
        headerView.headerLabel.text = @"Non-Dogs";
    }
    
    return headerView;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
