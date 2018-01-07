//
//  ArticalsData.m
//  WebServiceDemo
//
//  Created by Kondya on 07/01/18.
//  Copyright © 2018 Kondya. All rights reserved.
//

#import "ArticalsData.h"

@implementation ArticalsData
-(void)setId:(NSString *)id1 name:(NSString *)name author:(NSString *)author description1:(NSString *)description1 publishedAt:(NSString *)publishedAt title:(NSString *)title url:(NSString *)url urlToImage:(NSString *)urlToImage
{
    self.id1 = id1;
    self.name = name;
    self.author = author;
    self.description1 = description1;
    self.publishedAt = publishedAt;
    self.title = title;
    self.url = url;
    self.urlToImage = urlToImage;
    
}
@end
