//
//  PlanCell.m
//  008
//
//  Created by zzlmilk on 13-12-31.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import "PlanCell.h"
#import "UIImageView+AFNetworking.h"

@implementation PlanCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        planImageView = [[UIImageView alloc]initWithFrame:CGRectMake(12, 10, 47, 46)];
        planImageView.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:planImageView];
        
        titleLabel = [[UILabel alloc]init];
        titleLabel.frame = CGRectMake(planImageView.frame.origin.x+planImageView.frame.size.width+9, planImageView.frame.origin.y, 235, 25);
        titleLabel.text = @"多伦路一日游";
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.textColor = RGBACOLOR(37, 37, 37, 1);
        [self.contentView addSubview:titleLabel];
        
        avgConsumeLabel = [[UILabel alloc]init];
        avgConsumeLabel.frame = CGRectMake(planImageView.frame.origin.x+planImageView.frame.size.width+150, titleLabel.frame.origin.y+titleLabel.frame.size.height+4, 137.f/2, 35.f/2);
        avgConsumeLabel.textColor = RGBACOLOR(138, 138, 138, 1);
        avgConsumeLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:avgConsumeLabel];
        
    }
    return self;
}

-(void)setPlan:(Plan *)plan{
    titleLabel.text = plan.title;
    avgConsumeLabel.text =[NSString stringWithFormat:@"人均: %@", plan.avgConsume];
    [avgConsumeLabel sizeToFit];
    
    [planImageView setImageWithURL:[NSURL URLWithString:plan.url] placeholderImage:nil];
}


@end
