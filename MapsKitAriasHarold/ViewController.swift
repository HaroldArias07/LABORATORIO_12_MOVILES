//
//  ViewController.swift
//  MapsKitAriasHarold
//
//  Created by mbtec22 on 30/05/21.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    var locationManager = CLLocationManager()
        
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        requestLocation()
        setUpMap()
        addAnnotations(coords: getCoordinates())
    }

    func setUpMap() {
        mapView.delegate = self
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.showsUserLocation = true
        mapView.setUserTrackingMode(MKUserTrackingMode.follow, animated: true)
    }

    func requestLocation()
    {
        guard CLLocationManager.locationServicesEnabled() else { return }
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
        
    @IBAction func actionSegmentControl(_ sender: UISegmentedControl) {
            
            switch segmentControl.selectedSegmentIndex {
            case 0:
                mapView.mapType = .standard
            case 1:
                mapView.mapType = .satellite
            case 2:
                mapView.mapType = .hybrid
            case 3:
                mapView.mapType = .hybridFlyover
            default:
                break
            }
    }
        
    func getCoordinates() -> [CLLocation] {
            return [
                    CLLocation(latitude: -13.0618169, longitude: -76.3494636),
                    CLLocation(latitude: -13.0621162, longitude: -76.3489173),
                    CLLocation(latitude: -13.0607915, longitude: -76.3511536),
                    CLLocation(latitude: -13.0598769, longitude: -76.3518194),
                ]
    }

    func addAnnotations(coords: [CLLocation]){

        for coord in coords {
            let CLLCoordType = CLLocationCoordinate2D(
                latitude: coord.coordinate.latitude,
                longitude: coord.coordinate.longitude
            );

            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLCoordType
            annotation.title = "Ubicacion"
            annotation.subtitle = "Subtitulo"
            mapView.addAnnotation(annotation)

            }
        }
    }

extension ViewController: CLLocationManagerDelegate {
        
}

extension ViewController: MKMapViewDelegate {
        
}
