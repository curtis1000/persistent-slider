//
//  ViewController.m
//  PersistentSlider
//
//  Created by Curtis Branum on 12/19/13.
//  Copyright (c) 2013 Curtis Branum. All rights reserved.
//

#import "ViewController.h"
#import "ApiHelper.h"

@interface ViewController ()
@property (nonatomic, strong) UISlider *slider;
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
    [self.view addSubview:self.slider];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
