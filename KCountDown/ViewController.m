//
//  ViewController.m
//  KCountDown
//
//  Created by xkun on 16/7/5.
//  Copyright © 2016年 xkun. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dateArray;
}
@end

@implementation ViewController


+ (void)load{
    
}

+ (void)initialize
{
    if (self == [self class]) {
        
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"呵呵呵呵呵呵");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    _dateArray = [[NSMutableArray alloc] initWithObjects:@"2016-07-05:12:11:12",@"2016-07-05:12:02:12",@"2016-07-05:12:02:45",@"2016-07-05:14:00:30",@"2016-07-05:12:15:32", @"2016-07-05:12:10:12",@"2016-07-05:13:10:12",@"2016-07-05:12:30:45",@"2016-07-05:14:40:30",@"2016-07-05:12:45:32",@"2016-07-05:12:10:12",@"2016-07-05:14:10:12",@"2016-07-05:14:30:45",@"2016-07-05:11:59:30",@"2016-07-05:11:45:32",@"2016-07-05:15:10:12",@"2016-07-05:15:10:12",@"2016-07-05:11:30:45",@"2016-07-05:15:40:30",@"2016-07-05:16:45:32",@"2016-07-05:16:10:12",@"2016-07-05:16:10:12",@"2016-07-05:16:30:45",@"2016-07-05:16:40:30",@"2016-07-05:16:45:32",@"2016-07-05:17:10:12",@"2016-07-05:17:10:12",@"2016-07-05:10:30:45",@"2016-07-05:10:40:30",@"2016-07-05:17:45:32",nil];
    
    UITableView *tableView= [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"TableViewCell"];
    [self.view addSubview:tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dateArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"TableViewCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];

    [cell bindData:[_dateArray objectAtIndex:indexPath.row]];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
