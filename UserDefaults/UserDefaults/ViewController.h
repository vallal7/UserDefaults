//
//  ViewController.h
//  UserDefaults
//
//  Created by Ganesh, Ashwin on 2/4/16.
//  Copyright © 2016 Ashwin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
- (IBAction)saveData:(id)sender;
- (IBAction)retrieveData:(id)sender;
@property(nonatomic,retain)IBOutlet UITableView *tableView;
@end

