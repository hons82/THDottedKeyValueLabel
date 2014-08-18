//
//  THDottedKeyValueLabel.h
//  THDottedKeyValueLabelExample
//
//  Created by Hannes Tribus on 18/08/14.
//  Copyright (c) 2014 3Bus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface THDottedKeyValueLabel : UIView

@property (nonatomic,strong, readonly) UILabel *keyLabel;
@property (nonatomic,strong, readonly) UILabel *valueLabel;

- (id)initLabelWithKey:(NSString *)keyString andValue:(NSString *)valueString;

- (void)setupLabelWithKey:(NSString *)keyString andValue:(NSString *)valueString;

- (void)setValueMarqueeing:(BOOL)marqueeing;

@end
