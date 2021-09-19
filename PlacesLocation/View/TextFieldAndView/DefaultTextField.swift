//
//  DefaultTextField.swift
//  PlacesLocation
//
//  Created by Ahmed Fathy on 19/07/2021.
//

import UIKit

class DefaultTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented") }
    
    init(placeholder: String ,textAlignment: NSTextAlignment, cornerRadius: CGFloat ,borderColor: CGColor){
        super.init(frame: .zero)
        
        configure()
        
        self.placeholder = placeholder
        self.textAlignment  = textAlignment
        self.clearButtonMode = .always
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor
        self.layer.borderWidth = 1
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowOpacity = 1
    }
    
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        returnKeyType                             = .done
        minimumFontSize                           = 10
        adjustsFontSizeToFitWidth                 = true
        autocorrectionType                        = .no
    }

}
