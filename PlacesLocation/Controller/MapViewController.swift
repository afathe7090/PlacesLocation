//
//  ViewController.swift
//  PlacesLocation
//
//  Created by Ahmed Fathy on 18/07/2021.
//

import UIKit

class MapViewController: UIViewController {

    let mapView = MapView()

    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
       
        configureMapView()
        configureNavigationBtnSaved()
    }
    
    
   
    
    //MARK: - helper Function
    private func configureNavigationBtnSaved(){
            
        let saveBtn = UIBarButtonItem()
        saveBtn.title = "Save"
        saveBtn.target = self
        saveBtn.action = #selector(actionSaveBarBtnPressed)
        
        navigationItem.rightBarButtonItem = saveBtn
    }
    
    
    private func configureMapView(){
        
        mapView.frame = view.frame
        view.addSubview(mapView)
    }
    
    
    //MARK: - Action
    @objc func actionSaveBarBtnPressed(){
        
        present(SaveingDataLocationVC(), animated: true, completion: nil)
    }
}

