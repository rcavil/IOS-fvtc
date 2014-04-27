//
//  MapViewController.m
//  MyMapFinder
//
//  Created by Ron Cavil on 4/14/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "SearchEntryStore.h"
#import "SearchEntry.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize manualMapSearchText;

- (void)viewDidLoad
{
    [super viewDidLoad];    
    _mapView.showsUserLocation = YES;
    _mapView.delegate = self;
    [self zoomStart];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)zoom:(id)sender
{
    MKUserLocation *userLocation = _mapView.userLocation;
    MKCoordinateRegion region =
    MKCoordinateRegionMakeWithDistance (
                                        userLocation.location.coordinate, 20000, 20000);
    [_mapView setRegion:region animated:NO];
}

- (IBAction)type:(id)sender
{
    if (_mapView.mapType == MKMapTypeStandard)
        _mapView.mapType = MKMapTypeSatellite;
    else
        _mapView.mapType = MKMapTypeStandard;
}

- (IBAction)search:(id)sender
{
    [self searchMapLogicMain:(@"auto")];
}

- (IBAction)manualMapSearch:(UITextField *)sender
{
    [sender resignFirstResponder];
    [self searchMapLogicMain:(@"manual")];

}

- (void)mapView:(MKMapView *)mapView
didUpdateUserLocation:
(MKUserLocation *)userLocation
{
    _mapView.centerCoordinate =
    userLocation.location.coordinate;
}


- (void) searchMapLogicMain:(NSString *)searchtype
{
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.region = _mapView.region;
    

    if ([searchtype isEqual:@"manual"])
    {
        request.naturalLanguageQuery = manualMapSearchText.text;
        [self performActualMapSearch:request];
    }
    else
    {
        SearchEntry *searchEntryItem;
        
        
        NSInteger autoSearchCount =[[SearchEntryStore SharedStore] Count];
        
        for (int loop = 0; loop <= (autoSearchCount-1); loop++)
        {
            searchEntryItem=[[SearchEntryStore SharedStore] EntryAtIndex:loop];
            
            request.naturalLanguageQuery = searchEntryItem.entryName;
            [self performActualMapSearch:request];
        }
        
    }
    
}

- (void)createMapAnnotations: (MKLocalSearchResponse *)response
{
    for (MKMapItem *item in response.mapItems)
    {
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        annotation.coordinate = item.placemark.coordinate;
        annotation.title      = item.name;
        annotation.subtitle   = item.placemark.thoroughfare;
        [_mapView addAnnotation:annotation];
    }

}

- (void) performActualMapSearch: ( MKLocalSearchRequest *) request
{
    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:request];
    
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error)
     {
         
         [self createMapAnnotations:response];
     }
     ];

}

- (void) clearMapAnnotations
{
 [_mapView removeAnnotations:[_mapView annotations]];
}

- (void) zoomStart
{
    MKUserLocation *userLocation = _mapView.userLocation;
    MKCoordinateRegion region =
    MKCoordinateRegionMakeWithDistance (
                                        userLocation.location.coordinate, 5, 5);
    [_mapView setRegion:region animated:NO];

}
@end


