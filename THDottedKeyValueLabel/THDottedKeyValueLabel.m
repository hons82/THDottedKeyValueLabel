//
//  THDottedKeyValueLabel.m
//  THDottedKeyValueLabelExample
//
//  Created by Hannes Tribus on 18/08/14.
//  Copyright (c) 2014 3Bus. All rights reserved.
//

#import "THDottedKeyValueLabel.h"
#import <PureLayout/PureLayout.h>
#import <MarqueeLabel/MarqueeLabel.h>

// Defaults
#define kDefaultMarqueeing      NO
#define kDefaultFontSize        12.0
#define kDefaultColor           [UIColor colorWithRed:119.0/255.0 green:119.0/255.0 blue:119.0/255.0 alpha:1.0]
#define kDefaultDottedColor     [UIColor colorWithRed:242.0/255.0 green:121.0/255.0 blue:53.0/255.0 alpha:1.0]
#define kDottedTemplate     @"..............................................................................................................................................................................."

// System Definitions
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@interface THDottedKeyValueLabel ()

@property (nonatomic,strong)UILabel *dottedLabel;

@end

@implementation THDottedKeyValueLabel {
}

@synthesize keyLabel = _keyLabel;
@synthesize valueLabel = _valueLabel;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self initView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initView];
    }
    return self;
}

- (id)initLabelWithKey:(NSString *)keyString andValue:(NSString *)valueString
{
    self = [super init];
    if (self) {
        // Initialization code
        [self initView];
        [self setupLabelWithKey:keyString andValue:valueString];
    }
    return self;
}

- (void)initView
{    
    // Define KeyLabel
    _keyLabel = [UILabel new];
    [_keyLabel setFont:[UIFont systemFontOfSize:kDefaultFontSize]];
    [_keyLabel setTextColor:kDefaultColor];
    [self addSubview:_keyLabel];
    
    // Define ValueLabel
    _dottedLabel = [UILabel new];
    [_dottedLabel setText:kDottedTemplate];
    [_dottedLabel setFont:[UIFont systemFontOfSize:kDefaultFontSize]];
    [_dottedLabel setTextColor:kDefaultDottedColor];
    [_dottedLabel setLineBreakMode:NSLineBreakByClipping];
    [self addSubview:_dottedLabel];
    
    // Define DottedLabel
    _valueLabel = [MarqueeLabel new];
    [((MarqueeLabel *)_valueLabel) setRate:10.0];
    [((MarqueeLabel *)_valueLabel) setLabelize:YES];
    [_valueLabel setFont:[UIFont boldSystemFontOfSize:kDefaultFontSize]];
    [_valueLabel setTextColor:kDefaultColor];
    [self addSubview:_valueLabel];
    
    [self.keyLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:0.0f];
    //[self.keyLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0.0f];
    [self.keyLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    
    [self.dottedLabel autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:self.keyLabel withOffset:8.0f];
    [self.dottedLabel autoPinEdge:ALEdgeTrailing toEdge:ALEdgeLeading ofView:self.valueLabel withOffset:-8.0f];
    [self.dottedLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow-1 forAxis:UILayoutConstraintAxisHorizontal];
    [[self.dottedLabel autoAlignAxis:ALAxisBaseline toSameAxisOfView:self.keyLabel] setPriority:UILayoutPriorityRequired];
    [[self.dottedLabel autoAlignAxis:ALAxisBaseline toSameAxisOfView:self.valueLabel] setPriority:UILayoutPriorityRequired];
    [self.valueLabel autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:0.0f];
    [self.valueLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0.0f];
    [self.valueLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0.0f];
    [self.valueLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh+1 forAxis:UILayoutConstraintAxisHorizontal];
    
    [self setValueMarqueeing:kDefaultMarqueeing];
    [self updateConstraintsIfNeeded];
    [self layoutIfNeeded];
}

- (void)setupLabelWithKey:(NSString *)keyString andValue:(NSString *)valueString
{
    [_keyLabel setText:keyString ? keyString : @""];
    [_valueLabel setText:valueString ? valueString : @""];
}

- (void)setValueMarqueeing:(BOOL)marqueeing
{
    [((MarqueeLabel *)_valueLabel) setLabelize:!marqueeing];
    [self.valueLabel setContentCompressionResistancePriority:marqueeing ? UILayoutPriorityDefaultHigh-1 : UILayoutPriorityDefaultHigh+1 forAxis:UILayoutConstraintAxisHorizontal];
}

- (void)layoutSubviews
{
    [self.valueLabel updateConstraints];
    [self.valueLabel layoutSubviews];
    [self.keyLabel updateConstraints];
    [self.keyLabel layoutIfNeeded];
    [super layoutSubviews];
}

@end
