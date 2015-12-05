//
//  QRViewController.m
//  CafePocket
//
//  Created by zawahiro on 2015/11/02.
//  Copyright © 2015年 aizawa. All rights reserved.
//

#import "QRViewController.h"

@interface QRViewController ()

@end

@implementation QRViewController

@synthesize delegate;

@synthesize session = _session;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Device
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    // session
    self.session = [[AVCaptureSession alloc] init];
    
    // Input
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    if (input) {
        [self.session addInput:input];
    } else {
        NSLog(@"error");
    }
    
    // Output
    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
    [self.session addOutput:output];
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    [output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode, AVMetadataObjectTypeEAN13Code]];
    
    
    // Preview
    AVCaptureVideoPreviewLayer *preview = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
    preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
    preview.frame = CGRectMake((self.view.frame.size.width - (self.view.frame.size.width - 40)) / 2, 40, self.view.frame.size.width - 40, self.view.frame.size.width - 40);
    [self.view.layer insertSublayer:preview atIndex:2];
    
    // Start
    [self.session startRunning];
}

- (IBAction)backToTutorial:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects
       fromConnection:(AVCaptureConnection *)connection
{
    // 複数のmetadataが来るので順に調べる
    for (AVMetadataObject *data in metadataObjects) {
        if (![data isKindOfClass:[AVMetadataMachineReadableCodeObject class]]) continue;
        // QR code data
        NSString *strValue = [(AVMetadataMachineReadableCodeObject *)data stringValue];
        // type ?
        if ([data.type isEqualToString:AVMetadataObjectTypeQRCode]) {
            // QRコードの場合
            NSURL *url = [NSURL URLWithString:strValue];
            if ([[UIApplication sharedApplication] canOpenURL:url]) {
//                [[UIApplication sharedApplication] openURL:url];
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"QRコード読み取り" message:strValue preferredStyle:UIAlertControllerStyleAlert];
                
                // addActionした順に左から右にボタンが配置されます
                [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                    // otherボタンが押された時の処理
                    [self okButtonPushed];
                }]];
                
                [self presentViewController:alertController animated:YES completion:nil];
            }
        }
    }
}

- (void)okButtonPushed {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [delegate QRDelegateMethod];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
