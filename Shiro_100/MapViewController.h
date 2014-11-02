//
//  MapViewController.h
//  Shiro100
//
//  Created by 寺内 信夫 on 2014/11/02.
//  Copyright (c) 2014年 寺内 信夫. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController < MKMapViewDelegate, CLLocationManagerDelegate >

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
