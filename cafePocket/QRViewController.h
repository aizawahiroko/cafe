//
//  QRViewController.h
//  CafePocket
//
//  Created by zawahiro on 2015/11/02.
//  Copyright © 2015年 aizawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol QRClassDelegate <NSObject>

@optional

-(void)QRDelegateMethod;

@end

@interface QRViewController : UIViewController<AVCaptureMetadataOutputObjectsDelegate>

@property (strong, nonatomic) id<QRClassDelegate> delegate;
@property (strong, nonatomic) AVCaptureSession* session;


@end
