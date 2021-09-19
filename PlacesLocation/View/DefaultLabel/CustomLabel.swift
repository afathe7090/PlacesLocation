//
//  CustomLabel.swift
//  PlacesLocation
//
//  Created by Ahmed Fathy on 18/07/2021.
//

import UIKit

class CustomLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    init(textAlignment: NSTextAlignment , fontSize: CGFloat, fontWeight: UIFont.Weight ,numberOfLines: Int ,textColor: UIColor){
        super.init(frame: .zero)
        
        configure()
        
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        self.numberOfLines = numberOfLines
        self.textColor = textColor
   }
    
    
    private func configure(){self.translatesAutoresizingMaskIntoConstraints = false}
    
}
