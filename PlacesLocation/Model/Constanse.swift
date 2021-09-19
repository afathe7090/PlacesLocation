//
//  Constanse.swift
//  PlacesLocation
//
//  Created by Ahmed Fathy on 26/07/2021.
//

import Foundation


let defaults = UserDefaults.standard


class LandMarkData {
    
    static let shared = LandMarkData()
    
    private init(){}
    
    
    func saveLandMarks(landMarks: [Landmark]){
        
        defaults.setValue(landMarks, forKey: "land")
        defaults.synchronize()
    }
    
    
    func getLandMarks()-> [Landmark]?{
        return defaults.array(forKey: "land") as? [Landmark]
    }
    
}


