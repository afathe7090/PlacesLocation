//
//  DefaultImage.swift
//  PlacesLocation
//
//  Created by Ahmed Fathy on 27/07/2021.
//

import UIKit

class DefaultImage: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    
    
    init(image: UIImage ,contentMode: UIImageView.ContentMode, tintColor: UIColor){
        super.init(frame: .zero)
        configure()
        
        self.image = image
        self.contentMode = contentMode
        self.tintColor = tintColor
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    private func configure(){self.translatesAutoresizingMaskIntoConstraints = false}
}
