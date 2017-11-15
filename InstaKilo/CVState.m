//
//  CVState.m
//  InstaKilo
//
//  Created by Javier Xing on 2017-11-15.
//  Copyright © 2017 Javier Xing. All rights reserved.
//

#import "CVState.h"

@implementation CVState

- (instancetype)initWithSections:(CVSection*)section1 andAnother: (CVSection*)section2
{
    self = [super init];
    if (self) {
        self.sections = [[NSArray alloc]init];
        self.sections = @[section1, section2];
    }
    return self;
}


@end
