//
//  ViewController.m
//  THDottedKeyValueLabelExample
//
//  Created by Hannes Tribus on 18/08/14.
//  Copyright (c) 2014 3Bus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.sampleLabel1 setupLabelWithKey:@"FirstKey" andValue:@"FirstValue"];
    
    [self.sampleLabel2 setupLabelWithKey:@"SecondKey" andValue:@"SecondValue is quite a really long label"];
    
    [self.sampleLabel3 setupLabelWithKey:@"ThirdKey" andValue:@"ThirdValue is a  really really really really really really long label"];
    
    [self.sampleLabel4 setupLabelWithKey:@"FourthKey" andValue:[ViewController currencyToString:123.456 withSymbol:@"€ "]];
    [self.sampleLabel4.valueLabel setFont:[UIFont boldSystemFontOfSize:32.0]];
    [self.sampleLabel4.valueLabel setTextColor:[UIColor blackColor]];
    [self.sampleLabel4 setNeedsLayout];
    
    [self.view setNeedsLayout];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)marqueeValueLabel2:(id)sender
{
    [self.sampleLabel2 setValueMarqueeing:[((UISwitch *)sender) isOn]];
}
- (IBAction)marqueeValueLabel3:(id)sender
{
    [self.sampleLabel3 setValueMarqueeing:[((UISwitch *)sender) isOn]];
}
#pragma mark - Helper

+ (NSString *)currencyToString:(double)number withSymbol:(NSString *)currencySymbol
{
    NSNumberFormatter *doubleFormatter = [[NSNumberFormatter alloc] init];
    [doubleFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [doubleFormatter setLocale:[NSLocale currentLocale]];
    if (currencySymbol)
        [doubleFormatter setCurrencySymbol:currencySymbol];
    return [doubleFormatter stringFromNumber:@(number)];
}

@end
