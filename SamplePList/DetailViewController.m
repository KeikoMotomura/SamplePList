//
//  DetailViewController.m
//  SamplePList
//
//  Created by 本村佳子 on 2014/11/05.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%@",self.friendList);
    
    NSBundle *bundle = [NSBundle mainBundle];
    
    //  読み込むプロパティリストのファイルパス（場所）の指定
    NSString *path = [bundle pathForResource:@"FriendsPerArea"ofType:@"plist"];
    
    //  プロパティリストの中身のデータを取得
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    //  取得できた配列のデータをメンバ変数に代入
    _prefectureList = [dic objectForKey:@"PrefectureList"];
    
    _PrefectureListTableView.delegate = self;
    _PrefectureListTableView.dataSource = self;
    
    self.prefectureLabel.text = @"仮";//[NSString stringWithFormat:@"%@のお友達",_PrefectureList[self.select_num]];
    
    
    
    self.friendText.text = _prefectureList[indexPath.row];
   
    
    
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
