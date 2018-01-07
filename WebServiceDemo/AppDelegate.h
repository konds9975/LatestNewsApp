//
//  AppDelegate.h
//  WebServiceDemo
//
//  Created by Kondya on 07/01/18.
//  Copyright © 2018 Kondya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

