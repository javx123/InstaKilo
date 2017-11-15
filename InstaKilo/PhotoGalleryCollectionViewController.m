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
#import "CVSection.h"
#import "CVState.h"

@interface PhotoGalleryCollectionViewController ()
@property (nonatomic, strong) NSMutableArray <UIImage*> *dogs;
@property (nonatomic, strong) NSMutableArray <UIImage*> *nonDogs;
@property (nonatomic, strong) NSArray *states;
@property (nonatomic, strong) CVState * currentState;
@property (nonatomic, assign) int stateIndex;
@end

@implementation PhotoGalleryCollectionViewController 

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CVSection *nonDog = [[CVSection alloc]initWithArray:@[
                                                          [UIImage imageNamed:@"image1"],
                                                          [UIImage imageNamed:@"image3"],
                                                          [UIImage imageNamed:@"image4"],
                                                          [UIImage imageNamed:@"image5"],
                                                          [UIImage imageNamed:@"image6"]
                                                          ] andName:@"Not Dogs"];
    
    CVSection *dog = [[CVSection alloc]initWithArray:@[
                                                       [UIImage imageNamed:@"image2"],
                                                       [UIImage imageNamed:@"image7"],
                                                       [UIImage imageNamed:@"image8"],
                                                       [UIImage imageNamed:@"image9"],
                                                       [UIImage imageNamed:@"image10"]
                                                       ] andName:@"Dogs"];
    
    CVSection *household = [[CVSection alloc]initWithArray:@[
                                                             [UIImage imageNamed:@"image2"],
                                                             [UIImage imageNamed:@"image7"],
                                                             [UIImage imageNamed:@"image8"],
                                                             [UIImage imageNamed:@"image9"],
                                                             [UIImage imageNamed:@"image10"],
                                                             [UIImage imageNamed:@"image5"]
                                                             ] andName:@"HouseHold Animals"];
    
    CVSection *wild = [[CVSection alloc]initWithArray:@[
                                                        [UIImage imageNamed:@"image1"],
                                                        [UIImage imageNamed:@"image3"],
                                                        [UIImage imageNamed:@"image4"],
                                                        [UIImage imageNamed:@"image6"]
                                                        ] andName:@"Wild Animals"];
    
    CVState *category = [[CVState alloc]initWithSections:nonDog andAnother:dog];
    CVState *location = [[CVState alloc]initWithSections:household andAnother:wild];
    
    self.states = @[category, location];
    
    self.stateIndex = 0;
    self.currentState = self.states[self.stateIndex];
    

    
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[PhotoCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (IBAction)switchLayout:(id)sender {
    self.stateIndex ++;
    self.currentState = self.states[self.stateIndex%2];
    [self.collectionView reloadData];
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
    return self.currentState.sections.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return [[self.currentState.sections objectAtIndex:section] count];
    return self.currentState.sections[section].sectionArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCell *cell = (PhotoCell*)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.photo.image = [self.currentState.sections[indexPath.section].sectionArray objectAtIndex:indexPath.item];
//        cell.photo.image = [self.gallery[indexPath.section] objectAtIndex:indexPath.item];

    
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    HeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
    headerView.backgroundColor = [UIColor blackColor];
    headerView.headerLabel.textColor = [UIColor whiteColor];

    headerView.headerLabel.text = self.currentState.sections[indexPath.section].sectionTitle;

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
