//
//  MapV.swift
//  PlacesLocation
//
//  Created by Ahmed Fathy on 18/07/2021.
//

import UIKit
import MapKit
import CoreLocation

class MapView: MKMapView , CLLocationManagerDelegate{
    
    
    //MARK: - variables
    
    var locationManager = CLLocationManager()

    
    //MARK: -  init
    init() {
        super.init(frame: .zero)
        configureLocationManager()
        configureMap()
    }
    
    
    
    
    //MARK: -  Helper Functions
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented")}
    
    private func configureMap(){self.translatesAutoresizingMaskIntoConstraints = false}
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    private func configureLocationManager(){
        //---> delegate (locationManeger)
        locationManager.delegate = self
        
        // --> request to use the location
        locationManager.requestAlwaysAuthorization()
        
        // ---> request to use authorization
        locationManager.requestWhenInUseAuthorization()
        
        // ---> start update
        locationManager.startUpdatingLocation()
    }
    
    
    
    //MARK: - Delegate
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // ---> last location User
        let location = locations.last
        
        Places.shared.userLatitude = location?.coordinate.latitude ?? 0.0
        Places.shared.userLongitude = location?.coordinate.longitude ?? 0.0
        
        // ---> the location to latitude and longtude
        let center = CLLocationCoordinate2D(latitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!)
        
        // ---> to use the center that we creat it and return the point the last location
        let region =  MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        // ---> add the region to the map
        self.setRegion(region, animated: true)
        
        // ---> show location
        self.showsUserLocation = true
    }
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error" , error.localizedDescription)
    }
    
}
