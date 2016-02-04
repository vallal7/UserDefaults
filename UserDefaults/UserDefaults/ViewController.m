//
//  ViewController.m
//  UserDefaults
//
//  Created by Ganesh, Ashwin on 2/4/16.
//  Copyright © 2016 Ashwin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableArray *animals ,*retrievedarray;
    NSUserDefaults *defaults;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    animals = [NSMutableArray arrayWithObjects:@"Cat",@"Dog",@"Bigfoot", nil];
    defaults = [NSUserDefaults standardUserDefaults];
    retrievedarray = [NSMutableArray array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma TableView Delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [retrievedarray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [retrievedarray objectAtIndex:indexPath.row];
    return cell;
}
- (IBAction)saveData:(id)sender {
    NSData *dataSave = [NSKeyedArchiver archivedDataWithRootObject:animals];
    [[NSUserDefaults standardUserDefaults] setObject:dataSave forKey:@"data"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)retrieveData:(id)sender {
    
    if([defaults objectForKey:@"data"])
    {
        NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"data"];
        retrievedarray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        [self.tableView reloadData];
    }
    else
    {
        NSLog(@"No Data exists");
        
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"No Data"
                                      message:@"No Data exists, save data before retrieving"
                                      preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 //Do some thing here
                                 [self dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

@end
