//
//  ArticalsData.h
//  WebServiceDemo
//
//  Created by Kondya on 07/01/18.
//  Copyright © 2018 Kondya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArticalsData : NSObject

@property NSString *id1;
@property NSString *name;
@property NSString *author;
@property NSString *description1;
@property NSString *publishedAt;
@property NSString *title;
@property NSString *url;
@property NSString *urlToImage;
-(void)setId:(NSString *)id1 name:(NSString *)name author:(NSString *)author description1:(NSString *)description1 publishedAt:(NSString *)publishedAt title:(NSString *)title url:(NSString *)url urlToImage:(NSString *)urlToImage;
@end
