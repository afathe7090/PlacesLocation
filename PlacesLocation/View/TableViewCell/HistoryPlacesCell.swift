//
//  HistoryPlacesCell.swift
//  PlacesLocation
//
//  Created by Ahmed Fathy on 18/07/2021.
//

import UIKit

class HistoryPlacesCell: UITableViewCell {

    static let idintifier = "HistoryPlacesCell"
    
    let placeNameLabel = CustomLabel(textAlignment: .left, fontSize: 20, fontWeight: .medium, numberOfLines: 0,textColor: .label)
    let dateLabel = CustomLabel(textAlignment: .right, fontSize: 17, fontWeight: .regular, numberOfLines: 0, textColor: .label)
    let aboutLabel = CustomLabel(textAlignment: .left, fontSize: 16, fontWeight: .regular, numberOfLines: 0, textColor: .label)

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureConstrains()
    }

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureConstrains()
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    func configureLabelData(landMark: Landmark){
        
        self.placeNameLabel.text = landMark.name
        self.aboutLabel.text = landMark.decribtion
        self.dateLabel.text = DateFormatter.localizedString(from: landMark.time, dateStyle: .short, timeStyle: .short)
    }
    
    
    //MARK: - Constrains
    private func configureConstrains(){
        
        contentView.addSubview(placeNameLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(aboutLabel)
        
        NSLayoutConstraint.activate([
            placeNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor ,constant: 10),
            placeNameLabel.bottomAnchor.constraint(equalTo: aboutLabel.topAnchor,constant: -10),
            placeNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor ,constant: 20),
            placeNameLabel.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor, constant: -5),
   
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            aboutLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            aboutLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            aboutLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
        
    }
    

}
