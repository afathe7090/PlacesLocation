//
//  DefaultTextView.swift
//  PlacesLocation
//
//  Created by Ahmed Fathy on 19/07/2021.
//

import UIKit

class DefaultTextView: UITextView {
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: .zero, textContainer: .none)
        configure()
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    init(fontSize: CGFloat , fontWeight: UIFont.Weight) {
        super.init(frame: .zero,textContainer: .none)
        
        configure()
        self.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowOpacity = 1
        
    }
    
    private func configure(){self.translatesAutoresizingMaskIntoConstraints = false}
    
}
