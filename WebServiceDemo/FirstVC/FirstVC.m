//
//  FirstVC.m
//  WebServiceDemo
//
//  Created by Kondya on 07/01/18.
//  Copyright © 2018 Kondya. All rights reserved.
//

#import "FirstVC.h"
#import "ArticalsData.h"
#import "FirstVCCell.h"
@interface FirstVC ()<UITableViewDelegate,UITableViewDataSource>
@property NSMutableArray *firstVCDataArray;
@end

@implementation FirstVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.firstVcTable.delegate = self;
    self.firstVcTable.dataSource = self;
    [self callNewsWS];
    
}







//MARK:callNewsWS
-(void)callNewsWS
{
    NSURL *URL = [NSURL URLWithString:@"https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=61cf4315024d48c1b690a7ed392945e2"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error)
    {
                                      __block NSMutableDictionary *resultsDictionary;
                                      if ([data length]>0 && error == nil)
                                      {
                                          resultsDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
                                          NSLog(@"resultsDictionary is %@",resultsDictionary);
                                          self.firstVCDataArray = [[NSMutableArray alloc]init];
                                          
                                          NSString *status = [resultsDictionary valueForKey:@"status"];
                                          if([status isEqualToString:@"ok"])
                                          {
                                              NSArray *articles = [resultsDictionary valueForKey:@"articles"];
                                              for (NSDictionary *dic in articles)
                                              {
                                                  ArticalsData *temp = [[ArticalsData alloc]init];
                                                  NSDictionary *source = [dic valueForKey:@"source"];
                                                  
                                                  NSString *id1 = [NSString stringWithFormat:@"%@",[source valueForKey:@"id"]];
                                                  NSString *name = [NSString stringWithFormat:@"%@",[source valueForKey:@"name"]];
                                                  NSString *author = [NSString stringWithFormat:@"%@",[dic valueForKey:@"author"]];
                                                  NSString *description1 = [NSString stringWithFormat:@"%@",[dic valueForKey:@"description"]];
                                                  NSString *publishedAt = [NSString stringWithFormat:@"%@",[dic valueForKey:@"publishedAt"]];
                                                  NSString *title = [NSString stringWithFormat:@"%@",[dic valueForKey:@"title"]];
                                                  NSString *url = [NSString stringWithFormat:@"%@",[dic valueForKey:@"url"]];
                                                  NSString *urlToImage = [NSString stringWithFormat:@"%@",[dic valueForKey:@"urlToImage"]];
                                                  [temp setId:id1 name:name author:author description1:description1 publishedAt:publishedAt title:title url:url urlToImage:urlToImage];
                                                  [self.firstVCDataArray addObject:temp];
                                                  
                                              }
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                 [self.firstVcTable reloadData];
                                              });
                                              
                                              
                                              
                                          }
                                          else
                                          {
                                              NSLog(@"Somthing Went Wrong");
                                          }
                                          
                                          
                                          
                                      } else if ([data length]==0 && error ==nil)
                                      {
                                          NSLog(@" download data is null");
                                      }
                                      else if( error!=nil)
                                      {
                                          NSLog(@" error is %@",error);
                                      }
                                      
                                      
                                      
                                  }];
    
    [task resume];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    FirstVCCell *cell = [self.firstVcTable dequeueReusableCellWithIdentifier:@"FirstVCCell"];
    ArticalsData *temp = [self.firstVCDataArray objectAtIndex:indexPath.row];
    [cell setData:temp];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.firstVCDataArray.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ArticalsData *temp = [self.firstVCDataArray objectAtIndex:indexPath.row];
    NSLog(@"%@   %@   %@    %@   %@  %@",temp.id1,temp.name,temp.publishedAt,temp.description1,temp.urlToImage,temp.title);
}


@end
