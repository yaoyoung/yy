//
//  ViewController.h
//  yy
//
//  Created by wangding on 15/8/11.
//  Copyright (c) 2015年 wangding. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

typedef enum{
    AppStory = 0,
    computer,
    yyEmue,
    
}tableViewq;


@property(nonatomic,assign) tableViewq  tableViewType;

@end

