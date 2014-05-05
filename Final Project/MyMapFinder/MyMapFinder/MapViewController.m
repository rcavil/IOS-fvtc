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


//View Related Methods
- (void)viewDidLoad
{
    [super viewDidLoad];
    _mapView.delegate = self;
    _mapView.showsUserLocation = YES;
    
    [self zoomStart];
}


- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    //Set first search entry and then search for it
    if (appLaunched==false)
    {
        [_mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];

        appLaunched=true;
        [self setNextSearchEntryItem];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//MapView Related Methods


- (IBAction)type:(id)sender
{
    if (_mapView.mapType == MKMapTypeStandard)
        _mapView.mapType = MKMapTypeSatellite;
    else if (_mapView.mapType == MKMapTypeSatellite)
        _mapView.mapType = MKMapTypeHybrid;
    else
        _mapView.mapType = MKMapTypeStandard;
}


- (void)mapView:(MKMapView *)mapView
didUpdateUserLocation:
(MKUserLocation *)userLocation
{
    //_mapView.centerCoordinate =
    //userLocation.location.coordinate;
    
    [self searchMapLogicMain];
}


- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
    [self searchMapLogicMain];
}

- (void) zoomStart
{
    MKUserLocation *userLocation = _mapView.userLocation;
    MKCoordinateRegion region =
    MKCoordinateRegionMakeWithDistance (
                                        userLocation.location.coordinate, 5000, 5000);
    
    [_mapView setRegion:region animated:NO];
    [self searchMapLogicMain];

}


- (IBAction)currentLocationBarButton:(UIBarButtonItem *)sender
{
    [self zoomStart];
}


//Map search logic methods


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

-(void) searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}


- (IBAction)addSearchEntryBarButton:(UIBarButtonItem *)sender
{
   //Attempt to add new search item entry
    
    NSString *newEntryName = [mapSearchBar.text lowercaseString];
    
    if (newEntryName.length==0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New search entry is blank"
                                                        message:@"Add cancelled."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    }
    
    else
    {
        //See if new entry already exists
        BOOL newEntryExists=[[SearchEntryStore SharedStore] SearchEntryExists:(newEntryName)];
        
        if (newEntryExists==false)
        {
            //temp search entry variable that will be use to create a new search entry
            SearchEntry *tempEntry = [[SearchEntry alloc] init];
            [tempEntry setEntryName:newEntryName];
            
            //Add new search entry via Shared Store
            [[SearchEntryStore SharedStore] AddEntry: tempEntry];

            //Sort search items with new entry
            [[SearchEntryStore SharedStore] SortSearchEntries];
            
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New search entry already exists"
                                                            message:@"Add cancelled."
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }

    

}
//Map anotations methods

- (void)createMapAnnotations: (MKLocalSearchResponse *)response
{
    for (MKMapItem *item in response.mapItems)
    {
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        annotation.coordinate = item.placemark.coordinate;
        annotation.title      = item.name;
        annotation.subtitle   = [NSString stringWithFormat:@"%@ %@ %@", item.placemark.subThoroughfare, item.placemark.thoroughfare,item.phoneNumber];
        [_mapView addAnnotation:annotation];
    }

}


- (void) clearMapAnnotations
{
 [_mapView removeAnnotations:[_mapView annotations]];
}


@end


