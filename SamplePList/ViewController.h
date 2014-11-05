//
//  ViewController.h
//  SamplePList
//
//  Created by 本村佳子 on 2014/11/04.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

{
    NSArray *_prefectureList;
}



@property (weak, nonatomic) IBOutlet UITableView *PrefectureListTableView;


@end

