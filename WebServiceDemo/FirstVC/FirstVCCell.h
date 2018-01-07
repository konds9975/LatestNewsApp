//
//  FirstVCCell.h
//  WebServiceDemo
//
//  Created by Kondya on 07/01/18.
//  Copyright © 2018 Kondya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticalsData.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface FirstVCCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *publishAtLbl;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLbl;
@property (weak, nonatomic) IBOutlet UIImageView *backImg;
@property (weak, nonatomic) IBOutlet UIView *backView;

-(void)setData:(ArticalsData *)temp;
@end
