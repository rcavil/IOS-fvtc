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
        [self changeSearchEntryItem:@"initial"];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//View Actions


- (IBAction)type:(id)sender
{
    if (_mapView.mapType == MKMapTypeStandard)
        _mapView.mapType = MKMapTypeSatellite;
    else if (_mapView.mapType == MKMapTypeSatellite)
        _mapView.mapType = MKMapTypeHybrid;
    else
        _mapView.mapType = MKMapTypeStandard;
}

- (IBAction)currentLocationBarButton:(UIBarButtonItem *)sender
{
    [self zoomStart];
}

- (IBAction)nextSearchEntryItem:(UIBarButtonItem *)sender
{
    [self changeSearchEntryItem:@"next"];
}

- (IBAction)prevSearchEntryItem:(UIBarButtonItem *)sender
{
    [self changeSearchEntryItem:@"prev"];
}


-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
  {
    [searchBar resignFirstResponder];
    [self searchMapLogicMain:@"manualsearch"];
  }

-(void) searchBarCancelButtonClicked:(UISearchBar *)searchBar
  {
   [searchBar resignFirstResponder];
  }

//MapView Related Methods


- (void)mapView:(MKMapView *)mapView
didUpdateUserLocation:
(MKUserLocation *)userLocation
{
    //_mapView.centerCoordinate =
    //userLocation.location.coordinate;
    
    [self searchMapLogicMain:@"updateuserlocation"];
}

/*krusty
- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
    [self searchMapLogicMain:@"finishloading"];
}
*/

- (void)mapViewDidFinishRenderingMap:(MKMapView *)mapView fullyRendered:(BOOL)fullyRendered
{
    [self searchMapLogicMain:@"finishloading"];
}


- (void) zoomStart
{
    MKUserLocation *userLocation = _mapView.userLocation;
    MKCoordinateRegion region =
    MKCoordinateRegionMakeWithDistance (
                                        userLocation.location.coordinate, 5000, 5000);
    
    [_mapView setRegion:region animated:NO];
    [self searchMapLogicMain:@"zoom"];

}


//Map search logic methods


- (void) searchMapLogicMain: (NSString *)action
{
    float currentLongitude=_mapView.region.center.longitude;
    float currentLatitude=_mapView.region.center.latitude;
    NSString *currentSearchText=mapSearchBar.text;
    
    bool runSearch=false;
    
    if ([action isEqual:@"changesearchentry"])
    {
        runSearch=true;
    }
    else
    {
      //check to see if a new search: if location changed and a different search item taking place
        
        if ((currentLongitude !=prevSearchLongitude) ||  (currentLatitude!= prevSearchLatitude) || (![currentSearchText isEqualToString:prevSearchItem]))
        {
            runSearch=true;
        }
        
    }
    
    if (runSearch==true)
    {
        prevSearchLongitude=currentLongitude;
        prevSearchLatitude=currentLatitude;
        prevSearchItem=currentSearchText;
        
        MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
        request.region = _mapView.region;
        
        request.naturalLanguageQuery = currentSearchText;
        [self performActualMapSearch:request];
    }
    
}

- (SearchEntry *) getCurrentSearchEntry
{
    NSInteger intCurrentEntry=[[SearchEntryStore SharedStore] currentEntry];
    
    if (intCurrentEntry==-1)
    {
        [self changeSearchEntryItem:@"initial"];
        
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

- (IBAction)addSearchEntryBarButton:(UIBarButtonItem *)sender
{
   //Attempt to add new search item entry
    
    NSString *newEntryName = [mapSearchBar.text lowercaseString];
    
    if (newEntryName.length==0)
    {
        [self displayAlertView:@"New search entry is blank" :@"Add cancelled."];
    }
    
    else
    {
        //See if new entry already exists
        BOOL newEntryExists=[[SearchEntryStore SharedStore] searchEntryExists:(newEntryName)];
        
        if (newEntryExists==false)
        {
            [self addNewSearchEntry:newEntryName];
            
            NSString *outputString=[NSString stringWithFormat:@"New search entry %@ has been added",newEntryName];
            [self displayAlertView:outputString :@"Add completed."];
        }
        else
        {
            NSString *outputString=[NSString stringWithFormat:@"New search entry %@ already exists",newEntryName];
           [self displayAlertView:outputString :@"Add cancelled."];
        }
    }

}

//Search entry related

- (void) addNewSearchEntry:(NSString *)newEntryName
{
    //temp search entry variable that will be use to create a new search entry
    SearchEntry *tempEntry = [[SearchEntry alloc] init];
    [tempEntry setEntryName:newEntryName];
    
    //Add new search entry via Shared Store
    [[SearchEntryStore SharedStore] addEntry: tempEntry];
    
    //Sort search items with new entry
    [[SearchEntryStore SharedStore] sortSearchEntries];

}


- (void)changeSearchEntryItem:(NSString *)action
{
    bool runSearch=false;
    

      if ([action isEqual:@"initial"])
      {
          [[SearchEntryStore SharedStore] incrementCurrentEntry];
          runSearch=false;
      }
    
      else if ([action isEqual:@"next"])
        {
          [[SearchEntryStore SharedStore] incrementCurrentEntry];
          runSearch=true;
        }
      else if ([action isEqual:@"prev"])
        {
          [[SearchEntryStore SharedStore] decrementCurrentEntry];
          runSearch=true;
        }
   
      //Update Search Entry Label
    
      SearchEntry *searchEntryItem=[self getCurrentSearchEntry];
      mapSearchBar.text=searchEntryItem.entryName;

    
      //Perform Search if applicable
      if (runSearch==true)
        {
            [self searchMapLogicMain:@"changesearchentry"];
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


//Display alert view

- (void) displayAlertView:(NSString *)title :(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
}

@end


