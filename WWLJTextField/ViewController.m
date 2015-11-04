//
//  ViewController.m
//  WWLJTextField
//
//  Created by iShareme on 15/11/4.
//  Copyright © 2015年 iShareme. All rights reserved.
//

#import "ViewController.h"
#import "CustomTextField.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createView];
}

-(UIColor *)randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

- (void)createView
{
    for (int i = 0; i < 5; i++) {
        CustomTextField *textF = [[CustomTextField alloc] init];
        textF.frame = CGRectMake(50, 100 + i * 50, 300, 40);
        textF.placeholder = @"电子邮箱";
        /// 设置占位符的颜色
         [textF setValue:[self randomColor] forKeyPath:@"_placeholderLabel.textColor"];
        // 设置占位符的字体大小
        [textF setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
        switch (i) {
            case 0:
                textF.gtAnimationType = GTAnimationTypeBlowUp;
                break;
            case 1:
                textF.gtAnimationType = GTAnimationTypeUpDown;
                break;
            case 2:
                textF.gtAnimationType = GTAnimationTypeLeftRight;
                break;
            case 3:
                textF.gtAnimationType = GTAnimationTypeEasyInOut;
                break;
            case 4:
                textF.gtAnimationType = GTAnimationTypeNone;
                break;
                
            default:
                break;
        }
        [self.view addSubview:textF];
    }
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
