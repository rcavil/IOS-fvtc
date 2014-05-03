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
@synthesize mapSearchBar;

- (void)viewDidLoad
{
    [super viewDidLoad];
    _mapView.delegate = self;
    _mapView.showsUserLocation = YES;
    [self zoomStart];
 
}

- (void) viewDidAppear:(BOOL)animated
{

    //Set first search entry and then search for it
    if (appLaunched==false)
    {
        appLaunched=true;
        
        [self setNextSearchEntryItem];
        [self searchMapLogicMain];
    }
    
    [super viewDidAppear:animated];

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
    [self searchMapLogicMain];
}

- (void)mapView:(MKMapView *)mapView
didUpdateUserLocation:
(MKUserLocation *)userLocation
{
    _mapView.centerCoordinate =
    userLocation.location.coordinate;
}


- (void) searchMapLogicMain
{
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.region = _mapView.region;
    

    request.naturalLanguageQuery = mapSearchBar.text;
    [self performActualMapSearch:request];

}

- (SearchEntry *) getCurrentSearchEntry
{
    NSInteger intCurrentEntry=[[SearchEntryStore SharedStore] currentEntry];
    
    if (intCurrentEntry==-1)
    {
        [self setNextSearchEntryItem];
        
        intCurrentEntry=[[SearchEntryStore SharedStore] currentEntry];
    }
    
    SearchEntry *searchEntryItem=[[SearchEntryStore SharedStore] EntryAtIndex:intCurrentEntry];


    return searchEntryItem;
}


- (void)createMapAnnotations: (MKLocalSearchResponse *)response
{
    for (MKMapItem *item in response.mapItems)
    {
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        annotation.coordinate = item.placemark.coordinate;
        annotation.title      = item.name;
        //annotation.subtitle   = item.placemark.subThoroughfare;
        annotation.subtitle   = [NSString stringWithFormat:@"%@/%@/%@", item.placemark.subThoroughfare, item.placemark.thoroughfare,item.phoneNumber];        
        [_mapView addAnnotation:annotation];
    }

}

- (void) performActualMapSearch: ( MKLocalSearchRequest *) request
{
    [self clearMapAnnotations];
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
                                        userLocation.location.coordinate, 5000, 5000);
    
    
    [_mapView setRegion:region animated:NO];
}

- (IBAction)nextSearchEntryItem:(UIBarButtonItem *)sender
{
    [self setNextSearchEntryItem];
    [self searchMapLogicMain];
}

- (IBAction)prevSearchEntryItem:(UIBarButtonItem *)sender
{
    [self setPrevSearchEntryItem];
    [self searchMapLogicMain];
}

- (IBAction)originalMapZoom:(id)sender
{
     [self zoomStart];
}

- (void) setCurrentSearchEntryLabel
{
    SearchEntry *searchEntryItem=[self getCurrentSearchEntry];
    mapSearchBar.text=searchEntryItem.entryName;
}

- (void) setNextSearchEntryItem
{
    [[SearchEntryStore SharedStore] incrementCurrentEntry];
    [self setCurrentSearchEntryLabel];
}

- (void) setPrevSearchEntryItem
{
    [[SearchEntryStore SharedStore] decrementCurrentEntry];
    [self setCurrentSearchEntryLabel];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    [self searchMapLogicMain];
}



@end


