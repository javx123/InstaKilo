//
//  CVSection.m
//  InstaKilo
//
//  Created by Javier Xing on 2017-11-15.
//  Copyright © 2017 Javier Xing. All rights reserved.
//

#import "CVSection.h"

@implementation CVSection
- (instancetype)initWithArray:(NSArray*)array andName: (NSString*)name
{
    self = [super init];
    if (self) {
        _sectionArray = array;
        _sectionTitle = name;
    }
    return self;
}


@end
