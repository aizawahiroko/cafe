//
//  TutorialViewController.m
//  cafePocket
//
//  Created by zawahiro on 2015/12/02.
//  Copyright © 2015年 aizawa. All rights reserved.
//

#import "TutorialViewController.h"

#import "FeedViewController.h"
#import "QRViewController.h"

@interface TutorialViewController ()

@end

@implementation TutorialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    scrollview.delegate = self;
    scrollview.pagingEnabled = YES;
    scrollview.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 3, [UIScreen mainScreen].bounds.size.height);
    
    UIView *baseview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width * 3, [UIScreen mainScreen].bounds.size.height)];
    UIImageView *imgv1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    imgv1.image = [UIImage imageNamed:@"Tutrial1.jpg"];
    UIImageView *imgv2 = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    imgv2.image = [UIImage imageNamed:@"Tutrial2.jpg"];
    UIImageView *imgv3 = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * 2, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    imgv3.image = [UIImage imageNamed:@"Tutrial3.jpg"];
    
    UIButton *StartBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 200, 80)];
    StartBtn.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, 300);
    StartBtn.backgroundColor = [UIColor redColor];
    [StartBtn addTarget:self action:@selector(toQR) forControlEvents:UIControlEventTouchUpInside];
    imgv3.userInteractionEnabled = YES;
    baseview.userInteractionEnabled = YES;
    [imgv3 addSubview:StartBtn];
    [baseview addSubview:imgv1];
    [baseview addSubview:imgv2];
    [baseview addSubview:imgv3];

    [scrollview addSubview:baseview];
    [self.view addSubview:scrollview];
    
    btnImgv1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    btnImgv1.image = [UIImage imageNamed:@""];
    btnImgv2 = [[UIImageView alloc]initWithFrame:CGRectMake(30, 0, 20, 20)];
    btnImgv2.image = [UIImage imageNamed:@""];
    btnImgv3 = [[UIImageView alloc]initWithFrame:CGRectMake(60, 0, 20, 20)];
    btnImgv3.image = [UIImage imageNamed:@""];
    [self.view addSubview:btnImgv1];
    [self.view addSubview:btnImgv2];
    [self.view addSubview:btnImgv3];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // メソッドに渡された scrollView を使って、先ほどと同じ方法で、現在位置からページ番号を割り出します。
    NSUInteger page = (NSUInteger)(scrollView.contentOffset.x / scrollView.bounds.size.width) + 1;
    
    // あらかじめ保存しておいたページ番号と照らし合わせます。
    if (_currentPage != page)
    {
        // 現在のページ番号を更新します。
        _currentPage = page;
        
        // ここでページが変わったときの処理を行います。
        if (_currentPage == 1) {
            btnImgv1.image = [UIImage imageNamed:@""];
            btnImgv2.image = [UIImage imageNamed:@""];
            btnImgv3.image = [UIImage imageNamed:@""];
        }
        else if (_currentPage == 2) {
            btnImgv1.image = [UIImage imageNamed:@""];
            btnImgv2.image = [UIImage imageNamed:@""];
            btnImgv3.image = [UIImage imageNamed:@""];
        }
        else {
            btnImgv1.image = [UIImage imageNamed:@""];
            btnImgv2.image = [UIImage imageNamed:@""];
            btnImgv3.image = [UIImage imageNamed:@""];
        }
    }
}

- (void)toQR {
    
    
    // フィード画面を表示
    // Storyboard を呼ぶ
    UIStoryboard *FeedSB = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    // Storyboard の中のどの ViewContorller を呼ぶか
    // @""の中は Storyboard IDを記述する
    FeedViewController *vc = [FeedSB instantiateViewControllerWithIdentifier: @"TabBarController"];

    // その画面を表示させる
    [UIApplication sharedApplication].keyWindow.rootViewController = vc;
    
    
    QRViewController *qr = [[QRViewController alloc]initWithNibName:@"QRViewController" bundle:nil];
    [self presentViewController:qr animated:YES completion:nil];
    
    
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
