//
//  CVState.h
//  InstaKilo
//
//  Created by Javier Xing on 2017-11-15.
//  Copyright © 2017 Javier Xing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CVSection.h"


@interface CVState : NSObject

@property (nonatomic, strong)NSArray <CVSection*>* sections;
//@property (nonatomic, strong)

- (instancetype)initWithSections:(CVSection*)section1 andAnother: (CVSection*)section2;
@end
