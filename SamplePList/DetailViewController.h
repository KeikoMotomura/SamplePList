//
//  DetailViewController.h
//  SamplePList
//
//  Created by 本村佳子 on 2014/11/05.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>


{
    NSArray *_prefectureList;
}

@property(nonatomic,strong)NSDictionary *friendList;

@property (weak, nonatomic) IBOutlet UILabel *prefectureLabel;

@property (weak, nonatomic) IBOutlet UITextView *friendText;

@property (weak, nonatomic) IBOutlet UITableView *PrefectureListTableView;


//@property(nonatomic,assign) int select_num;


@end
