//
//  DefaultButton.swift
//  PlacesLocation
//
//  Created by Ahmed Fathy on 19/07/2021.
//

import UIKit

class DefaultButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    init(title: String ,backgroundColor: UIColor,cornerRadius: CGFloat) {
        super.init(frame: .zero)
        
        configure()
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        
    }
    
    private func configure(){translatesAutoresizingMaskIntoConstraints = false}

}
