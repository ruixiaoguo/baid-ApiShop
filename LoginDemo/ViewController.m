//
//  ViewController.m
//  LoginDemo
//
//  Created by Baidu on 15/8/4.
//  Copyright (c) 2015年 Baidu. All rights reserved.
//

#import "ViewController.h"
#import "ApiStoreSDK.h"

@interface ViewController ()

//定义返回请求数据的block类型
typedef void (^onSuccess)(long status, NSString* responseString);
typedef void (^onError)(long status, NSString* responseString);
typedef void (^onComplete)();

@end

@implementation ViewController

- (IBAction)request{
    
//    NSString *city = _cityname.text;
//    NSString *apikey = _apikey.text;
//    
//    _resultText.text = @"";
//    _resultText.textAlignment = NSTextAlignmentLeft;
//    
//    //实例化一个回调，处理请求的返回值
//    APISCallBack* callBack = [APISCallBack alloc];
//    
//    callBack.onSuccess = ^(long status, NSString* responseString) {
//        NSLog(@"onSuccess");
//        if(responseString != nil) {
//            _resultText.text = [@"success\n" stringByAppendingString: responseString];
//        }
//    };
//    
//    callBack.onError = ^(long status, NSString* responseString) {
//        NSLog(@"onError");
//        _resultText.text = [@"error\n" stringByAppendingString: responseString];
//    };
//    
//    callBack.onComplete = ^() {
//        NSLog(@"onComplete");
//    };
//    
//    //部分参数
//    NSString *uri = @"http://apis.baidu.com/heweather/weather/free";
//    NSString *method = @"post";
//    NSMutableDictionary *parameter = [[NSMutableDictionary alloc] init];
//    [parameter setObject:city forKey:@"city"];
//    
//    //请求API
//    [ApiStoreSDK executeWithURL:uri method:method apikey:apikey parameter:parameter callBack:callBack];
    NSString *city = _cityname.text;
    NSString *apikey = _apikey.text;
    //部分参数
    NSString *url = @"http://apis.baidu.com/heweather/weather/free";
    NSString *method = @"post";
    NSMutableDictionary *parameter = [[NSMutableDictionary alloc] init];
    [parameter setObject:city forKey:@"city"];

    [self apiExecuteWithURL:url method:method apikey:apikey parameter:parameter WithReturnValeuBlock:^(long status, NSString *responseString) {
        _resultText.text = [@"success\n" stringByAppendingString: responseString];

    } WithFailureBlock:^(long status, NSString *responseString) {
        _resultText.text = [@"error\n" stringByAppendingString: responseString];

    } WithComplete:^{
        
    }];
}

- (void)apiExecuteWithURL:(NSString*)url
                method:(NSString*)method
                apikey:(NSString *)apikey
             parameter:(NSMutableDictionary*)parameter
           WithReturnValeuBlock: (onSuccess) block
           WithFailureBlock: (onError) failureBlock
           WithComplete: (onComplete) CompleteBlock
{
    
    
    _resultText.text = @"";
    _resultText.textAlignment = NSTextAlignmentLeft;
    
    //实例化一个回调，处理请求的返回值
    APISCallBack* callBack = [APISCallBack alloc];
    
    callBack.onSuccess = ^(long status, NSString* responseString) {
        NSLog(@"onSuccess");
        
        if(responseString != nil) {
            block(status,responseString);
        }
    };
    
    callBack.onError = ^(long status, NSString* responseString) {
        NSLog(@"onError");
        
        failureBlock(status,responseString);
    };
    
    callBack.onComplete = ^() {
        NSLog(@"onComplete");
        CompleteBlock();
    };
    
    //请求API
    [ApiStoreSDK executeWithURL:url method:method apikey:apikey parameter:parameter callBack:callBack];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 城市名拼音
    _cityname.text = @"beijing";
    _cityname.delegate = self;
    _cityname.returnKeyType = UIReturnKeyDone;
    
    //APIStore平台申请时候的apikey
    _apikey.text = @"f92e5e3716017654c04ad07ac400c22b";
    _apikey.delegate = self;
    _apikey.returnKeyType = UIReturnKeyDone;
    
    _resultText.textAlignment = NSTextAlignmentCenter;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
