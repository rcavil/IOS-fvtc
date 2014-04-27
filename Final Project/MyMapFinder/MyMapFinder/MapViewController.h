//
//  MapViewController.h
//  MyMapFinder
//
//  Created by Ron Cavil on 4/14/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController
<MKMapViewDelegate>

//@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITextField *manualMapSearchText;
@property (weak, nonatomic) IBOutlet UILabel *currentSearchEntryItemText;

- (IBAction)zoom:(id)sender;
- (IBAction)type:(id)sender;
- (IBAction)search:(id)sender;
- (IBAction)manualMapSearch:(UITextField *)sender;
- (IBAction)nextSearchEntryItem:(UIBarButtonItem *)sender;
- (IBAction)prevSearchEntryItem:(UIBarButtonItem *)sender;

@end
