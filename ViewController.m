//
//  ViewController.m
//  yy
//
//  Created by wangding on 15/8/11.
//  Copyright (c) 2015年 wangding. All rights reserved.
//
#define color(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import <JavaScriptCore/JSStringRefCF.h>


@interface ViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView   *webview;

@end

@implementation ViewController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
//    
//    
//    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0,
//                                                           100,
//                                                           [[UIScreen mainScreen] bounds].size.width,
//                                                           [[UIScreen mainScreen] bounds].size.height)];
//    _webView.delegate = self;
//    _webView.scalesPageToFit =YES;
//    _webView.scrollView.showsVerticalScrollIndicator = NO;
//    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
//    [self.view addSubview:_webView];
//    
//    
//    
//    //首先创建JSContext 对象（此处通过当前webView的键获取到jscontext）
//    JSContext *context=[self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
//  
//    context[@"hallo"] = self;
//    [context evaluateScript:@"nativeObject.log(\"fdsfdsdfds\")"];
//    
//    context[@"jakilllog"] = ^(){
//        NSLog(@"Begin Log");
//        NSArray *args = [JSContext currentArguments];
//        
//        for (JSValue *jsVal in args) {
//            NSLog(@"%@", jsVal);
//        }
//        
//        JSValue *this = [JSContext currentThis];
//        NSLog(@"this: %@",this);
//        NSLog(@"-------End Log-------");
//    };
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.webview=[[UIWebView alloc]initWithFrame:self.view.bounds];
    self.webview.backgroundColor=[UIColor lightGrayColor];
    NSString *htmlPath=[[NSBundle mainBundle] resourcePath];
    htmlPath=[htmlPath stringByAppendingPathComponent:@"index.html"];
    NSURL *localURL=[[NSURL alloc]initFileURLWithPath:htmlPath];
    [self.webview loadRequest:[NSURLRequest requestWithURL:localURL]];
    [self.view addSubview:self.webview];
    
    JSContext *context = [self.webview valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    
    context[@"hallo"] = self;
    [context evaluateScript:@"nativeObject.log(\"fdsfdsdfds\")"];
    
    context[@"jakilllog"] = ^() {
    
        NSLog(@"Begin Log");
        NSArray *args = [JSContext currentArguments];
        for (JSValue *jsVal in args) {
            NSLog(@"%@", jsVal);
        }
        JSValue *this = [JSContext currentThis];
        NSLog(@"this = %@",this);
        NSLog(@"-------End Log-------");
    };
    [self testMakeUIColor];
}


- (void) testMakeUIColor
{
//    JSContext *context = [[JSContext alloc]init];
//    context[@"creatUIColor"] = ^(NSDictionary *rgbColor){
//        return [UIColor colorWithRed:([rgbColor[@"red"] floatValue] /255.0)
//                               green:([rgbColor[@"green"]floatValue] /255.0)
//                                blue:([rgbColor[@"blue"]floatValue] /255.0)
//                               alpha:1];
//    };
//    JSValue *color = [context evaluateScript:@"makeUIColor({red: 150, green: 150, blue: 200})"];
//    NSLog(@"color:%@",[color toObject]);
    
    if (_tableViewType == AppStory) {
        NSLog(@"0");
    }
    if (_tableViewType == computer) {
        NSLog(@"1");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
