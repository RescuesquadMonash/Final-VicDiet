//
//  SearchingViewController.swift
//  VicDiet
//
//  Created by Ming Yang on 5/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

import Firebase
import FirebaseStorage


class SearchingViewController: UIViewController{
    
    var homePageController: HomePageController?
    
    private let letterArray = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    private let ref = Database.database().reference().child("OpenDataRepository").child("FoodNutrient")
    
    private var dataRefHandle: DatabaseHandle?
    //let uid = Auth.auth().currentUser?.uid
    
    let sv = SearchingView()
    
    let realSearchBar: UISearchBar = UISearchBar()
    
    let inputConsoleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        
        
        return view
    }()
//    let gradient = CAGradientLayer()
//    //gradient.transform = CATransform3DMakeRotation(.pi / 4, 0, 0, 1)
//    gradient.frame = inputConsoleView.bounds
//    gradient.startPoint = CGPoint(x: 0, y: 0)
//    gradient.endPoint = CGPoint(x: 1, y: 1)
//    gradient.colors = [UIColor(red: 66/255, green: 134/255, blue: 244/255, alpha: 1).cgColor,UIColor(red: 55/255, green: 59/255, blue: 68/255, alpha: 1).cgColor]
//    //gradient.locations = [0, 0.5, 1]
//    inputConsoleView.layer.addSublayer(gradient)
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("OK", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor(red: 66/255, green: 134/255, blue: 244/255, alpha: 1), for: .normal)
        return button
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Cancel", for: .normal)
        //button.setTitleColor(UIColor(red: 125/255, green: 206/255, blue: 148/255, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
        
        return button
    }()
    
    @objc func handleCancel(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true

        self.navigationController?.popViewController(animated: true)
    }
    
    
    /*
     Remove all observers when deinitializing
     */
    deinit {
        
        ref.removeAllObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let gradient = CAGradientLayer()
        var bounds = homePageController?.navigationController!.navigationBar.bounds
        bounds!.size.height += UIApplication.shared.statusBarFrame.size.height
        gradient.frame = bounds!
        gradient.colors = [UIColor(red: 55/255, green: 59/255, blue: 68/255, alpha: 1).cgColor, UIColor(red: 66/255, green: 134/255, blue: 244/255, alpha: 1).cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        if let image = homePageController?.getImageFrom(gradientLayer: gradient) {
            homePageController?.navigationController!.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        sv.searchingViewController = self
        sv.homePageController = self.homePageController
        
        Service.sharedInstance.fetchAllFoodNutrient { (fixedDimensionalArray) in
            self.sv.fixedDimensionalArray = fixedDimensionalArray
            self.sv.tableView.reloadData()

        }
        
        //fetchSearching()
        setupViews()
        closeButton.addTarget(self, action: #selector(handleCloseKeyboard), for: .touchUpInside)
    }
    
    
    
    func  setupViews(){
        
        sv.backgroundColor = .white
        
        //setup searching bar on the top
        realSearchBar.frame = CGRect(x: 0, y: 0, width: view.frame.width*1/2, height: self.navigationController?.navigationBar.frame.height ?? 20)
        realSearchBar.placeholder = "Click To Search"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: realSearchBar)
        realSearchBar.delegate = self
        realSearchBar.keyboardType = .default
        
        //setup cancel button on the top
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: cancelButton)
        
        //setup searching result view at the bottom of searching bar
        view.addSubview(sv)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        sv.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        sv.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        sv.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        inputConsoleView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/10)
        
        
        
        
        
        
        
        realSearchBar.inputAccessoryView = inputConsoleView
        inputConsoleView.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: inputConsoleView.topAnchor, constant: inputConsoleView.frame.height/50),
            closeButton.leftAnchor.constraint(equalTo: inputConsoleView.leftAnchor, constant: inputConsoleView.frame.width*4/5),
            closeButton.rightAnchor.constraint(equalTo: inputConsoleView.rightAnchor, constant: 0),
            closeButton.bottomAnchor.constraint(equalTo: inputConsoleView.bottomAnchor, constant: -inputConsoleView.frame.height/50)
            ])
        
        realSearchBar.becomeFirstResponder()
    }
    
    @objc func handleCloseKeyboard(){
        realSearchBar.endEditing(true)
    }
}

