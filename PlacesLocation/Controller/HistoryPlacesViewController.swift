//
//  HistoryViewController.swift
//  PlacesLocation
//
//  Created by Ahmed Fathy on 18/07/2021.
//

import UIKit
import RealmSwift
import CoreLocation
import MapKit

class HistoryPlacesViewController: UIViewController {
    
    //MARK: - Views
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame)
        return tableView
    }()
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    
    let viewDefaults = DefaultView(backgroundColor: .white, opacity: 1, cornerRadius: 0)
    let labelEmpty = CustomLabel(textAlignment: .center, fontSize: 23, fontWeight: .medium, numberOfLines: 0, textColor: .label)
    
    let imageCloud = DefaultImage(image: UIImage(systemName: "icloud.slash")!, contentMode: .scaleAspectFill,tintColor: .lightGray)
    
    
    //MARK: - Variabls
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    
    let realm = try! Realm()
    
    
    //MARK: - Life Cicle
    

    //-------------------------------------------------------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureRealm()
        updateUI()
        
    }
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    
    //MARK: - Function
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    private func configureTableView(){
        
        view.addSubview(tableView)
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HistoryPlacesCell.self, forCellReuseIdentifier: HistoryPlacesCell.idintifier)
        tableView.tableFooterView = UIView()
        
        
    }
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    private func configureRealm(){
        
        let landMarks = realm.objects(Landmark.self)
        Places.shared.landmarks = landMarks
        
    }
    
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    private func updateUI(){
        if Places.shared.landmarks.count == 0{
            
            configureCloud()
            tableView.isHidden    = true
            viewDefaults.isHidden = false
            labelEmpty.isHidden   = false
            imageCloud.isHidden   = false
            
        }else{
            
            configureTableView()
            tableView.isHidden     = false
            viewDefaults.isHidden  = true
            labelEmpty.isHidden    = true
            imageCloud.isHidden    = true
        }
    }
    
    
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    
    private func configureCloud(){
        
        labelEmpty.text = "Ops, Empty Locations!"
        view.addSubview(viewDefaults)
        view.addSubview(imageCloud)
        view.addSubview(labelEmpty)
        
        //-------------------------------------------------------------------------------------------------------------------------------------------
        NSLayoutConstraint.activate([
            viewDefaults.topAnchor.constraint(equalTo: view.topAnchor),
            viewDefaults.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewDefaults.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewDefaults.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        //-------------------------------------------------------------------------------------------------------------------------------------------
        
        NSLayoutConstraint.activate([
            imageCloud.topAnchor.constraint(equalTo: viewDefaults.topAnchor, constant: 200),
            imageCloud.heightAnchor.constraint(equalToConstant: 200),
            imageCloud.widthAnchor.constraint(equalToConstant: 200),
            imageCloud.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        //-------------------------------------------------------------------------------------------------------------------------------------------
        NSLayoutConstraint.activate([
            labelEmpty.topAnchor.constraint(equalTo: imageCloud.bottomAnchor, constant: 75),
            labelEmpty.leadingAnchor.constraint(equalTo: viewDefaults.leadingAnchor, constant: 20),
            labelEmpty.trailingAnchor.constraint(equalTo: viewDefaults.trailingAnchor, constant: -20)
            
            
        ])
        
        
    }
    
    

}

//MARK: - tableView Delegation


//-------------------------------------------------------------------------------------------------------------------------------------------
extension HistoryPlacesViewController: UITableViewDelegate , UITableViewDataSource{
    //-------------------------------------------------------------------------------------------------------------------------------------------
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Places.shared.landmarks.count
    }
    
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryPlacesCell.idintifier, for: indexPath) as! HistoryPlacesCell
        
        cell.configureLabelData(landMark: Places.shared.landmarks[indexPath.row])
        return cell
    }
    
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: false)
        
        
        let latitude:CLLocationDegrees = Places.shared.landmarks[indexPath.row].latitude
        let longitude:CLLocationDegrees =  Places.shared.landmarks[indexPath.row].longtude
        
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        
        
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.openInMaps(launchOptions: options)
    }
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
     func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: "Delete") { [self] action, view, complection in
            
            let landMark = Places.shared.landmarks[indexPath.row]
            
            try! realm.write({
                realm.delete(landMark)
            })
            updateUI()
            tableView.reloadData()
        }
        
        delete.backgroundColor = .red
        
        let swap = UISwipeActionsConfiguration(actions: [delete])
        swap.performsFirstActionWithFullSwipe = false
        return swap
    }
    
}
