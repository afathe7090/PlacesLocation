//
//  DefaultView.swift
//  PlacesLocation
//
//  Created by Ahmed Fathy on 19/07/2021.
//

import UIKit

class DefaultView: UIView {

  
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    init(backgroundColor: UIColor,opacity: Float, cornerRadius:CGFloat){
        super.init(frame: .zero)
        configure()
        
        self.backgroundColor = backgroundColor
        self.layer.opacity = opacity
        self.layer.cornerRadius = cornerRadius
        
    }
    
    
    
    private func configure(){
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
