//
//  CVSection.h
//  InstaKilo
//
//  Created by Javier Xing on 2017-11-15.
//  Copyright © 2017 Javier Xing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CVSection : NSObject
@property (nonatomic, strong) NSArray *sectionArray;
@property (nonatomic,strong)NSString * sectionTitle;

- (instancetype)initWithArray:(NSArray*)array andName: (NSString*)name;

@end
