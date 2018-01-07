//
//  FirstVCCell.m
//  WebServiceDemo
//
//  Created by Kondya on 07/01/18.
//  Copyright © 2018 Kondya. All rights reserved.
//

#import "FirstVCCell.h"

@implementation FirstVCCell

- (void)awakeFromNib
{
    [super awakeFromNib];
   
}
-(void)setData:(ArticalsData *)temp
{
    self.nameLbl.text = temp.author;
    self.descriptionLbl.text = temp.description1;
    self.publishAtLbl.text = temp.publishedAt;
    self.backView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.45];
    
    [self.backImg sd_setImageWithURL:[NSURL URLWithString:temp.urlToImage]
                 placeholderImage:[UIImage imageNamed:@"placeholder.png"]];

}

@end
