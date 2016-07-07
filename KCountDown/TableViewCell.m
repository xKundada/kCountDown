//
//  TableViewCell.m
//  KCountDown
//
//  Created by xkun on 16/7/5.
//  Copyright © 2016年 xkun. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()
{
//    NSInteger _timeOut;
    UILabel  *_mLabel;
     UILabel  *_sLabel;
   // NSTimer *_timer;
    
     dispatch_source_t _timer;
    
   // NSUInteger min;
}
@end

@implementation TableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        _mLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 200, 20)];
        [_mLabel setFont:[UIFont systemFontOfSize:15]];
        [_mLabel setTextColor:[UIColor redColor]];
        [self.contentView addSubview:_mLabel];
 
    }
    return self;
}


-(NSString *)getyyyymmdd{
    NSDate *now = [NSDate date];
    NSDateFormatter *formatDay = [[NSDateFormatter alloc] init];
    formatDay.dateFormat = @"yyyy-MM-dd";
    NSString *dayStr = [formatDay stringFromDate:now];
    
    return dayStr;
    
}


- (void)bindData:(NSString *)string{


//    if (_timer==nil) {
    
        NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd:HH:mm:ss"];
        NSDate *endDate = [dateFormatter dateFromString:string];
        
        NSDate *startDate = [NSDate date];
        NSTimeInterval timeInterval =[endDate timeIntervalSinceDate:startDate];
        __block int timeout = timeInterval; //倒计时时间
        
        if (timeout!=0) {
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            _timer = nil;
            _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
            dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
            dispatch_source_set_event_handler(_timer, ^{
                if(timeout<=0){ //倒计时结束，关闭
                    dispatch_source_cancel(_timer);
                    _timer = nil;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        _mLabel.text = @"倒计时完";
                    });
                }else{
                    int days = (int)(timeout/(3600*24));
                    int hours = (int)((timeout-days*24*3600)/3600);
                    int minute = (int)(timeout-days*24*3600-hours*3600)/60;
                    int second = timeout-days*24*3600-hours*3600-minute*60;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        _mLabel.text = [NSString stringWithFormat:@"%d:%d",minute,second];
                        
                    });
                    timeout--;
                }
            });
            dispatch_resume(_timer);
        }else{
             _mLabel.text = @"已过时";
        }
  //  }

}

- (void)refreshLessTime{
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
