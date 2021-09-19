//
//  MainTabBarController.swift
//  PlacesLocation
//
//  Created by Ahmed Fathy on 18/07/2021.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTabBar()
    }
    
    
    func configureTabBar(){
        
        let mapViewController = UINavigationController(rootViewController: MapViewController())
        mapViewController.tabBarItem.image = UIImage(systemName: "map")
        mapViewController.tabBarItem.title = "Map"
        
        
        let historyViewController = UINavigationController(rootViewController: HistoryPlacesViewController())
        historyViewController.tabBarItem.image = UIImage(systemName: "book.fill")
        historyViewController.tabBarItem.title = "History" 
        
        self.tabBar.backgroundColor = .white
        self.viewControllers = [mapViewController , historyViewController]
        
    }
    

}
