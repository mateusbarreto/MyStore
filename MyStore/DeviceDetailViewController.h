//
//  DeviceDetailViewController.h
//  MyStore
//
//  Created by mds on 22/11/13.
//  Copyright (c) 2013 mds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeviceDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *companyTextField;
@property (weak, nonatomic) IBOutlet UITextField *versionTextField;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end
