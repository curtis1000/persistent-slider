//
//  ViewController.m
//  PersistentSlider
//
//  Created by Curtis Branum on 12/19/13.
//  Copyright (c) 2013 Curtis Branum. All rights reserved.
//

#import "ViewController.h"
#import "ApiHelper.h"
#import "math.h"

@interface ViewController ()
@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) UILabel *sliderValueLabel;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.slider = [[UISlider alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 23.0f)];
    
    self.slider.center = self.view.center;
    self.slider.minimumValue = 0.0f;
    self.slider.maximumValue = 100.0f;
    //self.slider.value = self.slider.maximumValue / 2.0;
    self.slider.value = [ApiHelper getPersistentSliderValue];
    
    // setup event handler
    [self.slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    
    [self.view addSubview:self.slider];
    
    // lets add a label that shows the slider's value
    self.sliderValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 300.0f, 23.0f)];
    self.sliderValueLabel.center = self.view.center;
    NSString *valueString = [NSString stringWithFormat:@"%d", (int) self.slider.value];
    [self.sliderValueLabel setText:valueString];
    [self.view addSubview:self.sliderValueLabel];
}

- (void)sliderValueChanged:(UISlider *)paramSlider
{
    int valueInteger = (int) paramSlider.value;
    //NSLog(@"%d", valueInteger);
    [ApiHelper setPersistentSliderValue:valueInteger];
    
    //update the label
    NSString *valueString = [NSString stringWithFormat:@"%d", (int) paramSlider.value];
    [self.sliderValueLabel setText:valueString];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
