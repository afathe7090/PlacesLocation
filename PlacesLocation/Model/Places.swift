//
//  Places.swift
//  PlacesLocation
//
//  Created by Ahmed Fathy on 26/07/2021.
//

import Foundation
import RealmSwift

class Places {
    
    static let shared = Places()
    
    var landmarks: Results<Landmark>!
    var userLatitude: Double = 0.0
    var userLongitude: Double = 0.0
    
    private init(){}
    
    
}
