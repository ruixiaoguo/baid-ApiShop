//
//  ViewController.h
//  LoginDemo
//
//  Created by Baidu on 15/8/4.
//  Copyright (c) 2015年 Baidu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *cityname;
@property (weak, nonatomic) IBOutlet UITextField *apikey;
@property (weak, nonatomic) IBOutlet UITextView *resultText;


@end

