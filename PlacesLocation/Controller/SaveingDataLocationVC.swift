//
//  SaveingDataLocationVC.swift
//  PlacesLocation
//
//  Created by Ahmed Fathy on 19/07/2021.
//

import UIKit
import RealmSwift

class SaveingDataLocationVC: UIViewController {
    
    //MARK: - Variables
    
    let newLandMark = Landmark()
    
    let realm = try! Realm()
    
    //MARK: - view
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    let mainView = DefaultView(backgroundColor: UIColor.systemGray, opacity: 0.8,cornerRadius: 0)
    let viewsText = DefaultView(backgroundColor: .white, opacity: 1,cornerRadius: 20)
    let textField = DefaultTextField(placeholder: "Place", textAlignment: .left, cornerRadius: 10, borderColor: UIColor.systemGray.cgColor)
    let textView = DefaultTextView(fontSize: 19, fontWeight: .regular)
    let saveButton = DefaultButton(title: "Save", backgroundColor: UIColor.systemBlue, cornerRadius: 10)
    
    //MARK: - loadView
    override func loadView() {
        super.loadView()
        view = mainView
        configureConstrains()
    }

    
    //MARK: - Life cicle
    
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureConstrains()
        setActionSavingBtbPressed()
    }
    
    
    //MARK: - Helper Function
    

    //-------------------------------------------------------------------------------------------------------------------------------------------
    //MARK: - Constrains
    
    private func configureConstrains(){
        
        mainView.addSubview(viewsText)
        viewsText.addSubview(textField)
        viewsText.addSubview(textView)
        viewsText.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            
            viewsText.heightAnchor.constraint(equalToConstant: 400),
            viewsText.widthAnchor.constraint(equalToConstant: 350),
            viewsText.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            viewsText.centerYAnchor.constraint(equalTo: mainView.centerYAnchor, constant: -100),
            
            textField.topAnchor.constraint(equalTo: viewsText.topAnchor,constant: 20),
            textField.leadingAnchor.constraint(equalTo: viewsText.leadingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: viewsText.trailingAnchor, constant: -10),
            textField.heightAnchor.constraint(equalToConstant: 50),
            
            textView.topAnchor.constraint(equalTo: textField.bottomAnchor,constant: 10),
            textView.trailingAnchor.constraint(equalTo: viewsText.trailingAnchor, constant: -10),
            textView.leadingAnchor.constraint(equalTo: viewsText.leadingAnchor, constant: 10),
            textView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -10),
            
            saveButton.leadingAnchor.constraint(equalTo: viewsText.leadingAnchor, constant: 50),
            saveButton.trailingAnchor.constraint(equalTo: viewsText.trailingAnchor, constant: -50),
            saveButton.bottomAnchor.constraint(equalTo: viewsText.bottomAnchor, constant: -10),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
            
            
        ])
    }
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    private func setActionSavingBtbPressed(){
        saveButton.addTarget(self, action: #selector(actionSaving), for: .touchUpInside)
    }
    
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    @objc func actionSaving(){
        
        guard !textField.text!.isEmpty , !textView.text.isEmpty else{return}
        
        newLandMark.name = textField.text!
        newLandMark.decribtion = textView.text!
        newLandMark.latitude = Places.shared.userLatitude
        newLandMark.longtude = Places.shared.userLongitude
        
        try! realm.write {
            realm.add(newLandMark)
        }
        
        dismiss(animated: true, completion: nil)
    }

}
