//
//  ThirdViewController.h
//  Demo_Refresh
//
//  Created by sajiner on 2017/3/28.
//  Copyright © 2017年 sajiner. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^TwoBlock)();
@interface ThirdViewController : UIViewController
@property (nonatomic, copy) TwoBlock block;
@end
