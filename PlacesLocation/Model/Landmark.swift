//
//  Landmark.swift
//  PlacesLocation
//
//  Created by Ahmed Fathy on 26/07/2021.
//

import Foundation
import RealmSwift

class Landmark: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var decribtion: String = ""
    @objc dynamic var latitude: Double = 0.0
    @objc dynamic var longtude: Double = 0.0
    @objc dynamic var time: Date = Date()
    
}
