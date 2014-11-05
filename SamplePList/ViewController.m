//
//  ViewController.m
//  SamplePList
//
//  Created by 本村佳子 on 2014/11/04.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//  bundle=プロジェクト内のファイルにアクセスできるオブジェクトを宣言(NSBundle型のオブジェクト）
    NSBundle *bundle = [NSBundle mainBundle];
    
//  読み込むプロパティリストのファイルパス（場所）の指定
    NSString *path = [bundle pathForResource:@"FriendsPerArea"ofType:@"plist"];
    
//  プロパティリストの中身のデータを取得
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
//  取得できた配列のデータをメンバ変数に代入
    _prefectureList = [dic objectForKey:@"PrefectureList"];
    
    
    
//    _prefectureList = @[@"北海道",@"青森県",@"岩手県"];
    
    _PrefectureListTableView.delegate = self;
    _PrefectureListTableView.dataSource = self;
}

//     四行あるよ、ということをリターンで返すメソッド
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _prefectureList.count;
}

//     行数の決定。👇の二行の処理を3回行う（上のコードで3行必要であると判っているから（NSArrayの中身が3つだから）
-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //  セルにCellと名前をつける
    static NSString *CellIdentifier = @"Cell";
    
    
    //　セルオブジェクトにつける名前
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    //   セルの再利用
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
//    ＊＊ここに追加＊＊
    NSDictionary *FriendsWithArea = _prefectureList[indexPath.row];

//    ＊＊ここに追加②**
    cell.textLabel.text = [FriendsWithArea objectForKey:@"Name"];
    
//    セルオブジェクトを返す
    return cell;
    
}

//  セルがタップされたときに発動するメソッド
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

//    画面推移するViewControllerのカプセル化（インスタンス化）@の中身はStorybord上につけた名前を指定する。
    DetailViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    
//    選択された地域の情報をDetailViewControllerに渡す
    dvc.friendList = _prefectureList[indexPath.row];
    
    
    

//    ナビゲーションコントローラーの機能で推移
    [[self navigationController] pushViewController:dvc animated:YES];
    
//    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
