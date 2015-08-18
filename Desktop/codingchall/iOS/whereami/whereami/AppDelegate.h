//
//  AppDelegate.h
//  whereami
//
//  Created by edward nguyen on 7/9/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
//changes
//@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
////changes
//@property (strong,nonatomic)ViewController *viewController;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

