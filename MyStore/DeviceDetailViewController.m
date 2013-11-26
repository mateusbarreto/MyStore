//
//  DeviceDetailViewController.m
//  MyStore
//
//  Created by mds on 22/11/13.
//  Copyright (c) 2013 mds. All rights reserved.
//

#import "DeviceDetailViewController.h"

@interface DeviceDetailViewController ()

@end

@implementation DeviceDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]){
        context = [delegate managedObjectContext];
    }
         return context;
}

- (IBAction)save:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    //Create a new managed object
    NSManagedObjectContext *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Device"inManagedObjectContext:context];
    [newDevice setValue:self.nameTextField.text forKey:@"name"];
    [newDevice setValue:self.versionTextField.text forKey:@"version"];
    [newDevice setValue:self.companyTextField forKey:@"company"];
    
    NSError *error = nil;
    //Save the object to persistent store
    if (![context save:&error]){
        NSLog(@"Can't Save! %@ %@",error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
