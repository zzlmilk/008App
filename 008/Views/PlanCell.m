//
//  PlanCell.m
//  008
//
//  Created by zzlmilk on 13-12-31.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import "PlanCell.h"

@implementation PlanCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        planImageView = [[UIImageView alloc]initWithFrame:CGRectMake(12, 10, 47, 46)];
        [self.contentView addSubview:planImageView];
        
        titleLabel = [[UILabel alloc]init];
        titleLabel.frame = CGRectMake(planImageView.frame.origin.x+planImageView.frame.size.width+9, planImageView.frame.origin.y, 235, 25);
        titleLabel.text = @"多伦路一日游";
        [self.contentView addSubview:titleLabel];
        
        avgConsumeLabel = [[UILabel alloc]init];
        avgConsumeLabel.frame = CGRectMake(planImageView.frame.origin.x+planImageView.frame.size.width+9, titleLabel.frame.origin.y+titleLabel.frame.size.height+4, 137.f/2, 35.f/2);

        avgConsumeLabel.textColor = RGBACOLOR(166, 166, 166, 1);
        [self.contentView addSubview:avgConsumeLabel];
        
    }
    return self;
}

-(void)setPlan:(Plan *)plan{
    titleLabel.text = plan.title;
    avgConsumeLabel.text =[NSString stringWithFormat:@"人均: %@", plan.avgConsume];
    [avgConsumeLabel sizeToFit];
}


@end
