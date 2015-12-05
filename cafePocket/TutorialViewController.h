//
//  TutorialViewController.h
//  cafePocket
//
//  Created by zawahiro on 2015/12/02.
//  Copyright © 2015年 aizawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialViewController : UIViewController<UIScrollViewDelegate> {
    NSInteger _currentPage;
    UIImageView *btnImgv1;
    UIImageView *btnImgv2;
    UIImageView *btnImgv3;
    
}

@property (strong, nonatomic) UIWindow *window;

@end
