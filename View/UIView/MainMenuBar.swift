//
//  MainMenuBar.swift
//  VicDiet
//
//  Created by Ming Yang on 3/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit


class MainMenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    var homePageController: HomePageController?
    var addTabLauncher: AddTabLauncher?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //cv.backgroundColor = UIColor(red: 255/255, green: 204/255, blue: 103/255, alpha: 1)
        cv.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        //cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        //cv.backgroundColor = homePageController?.navigationController?.navigationBar.backgroundColor
        
        return cv
        
    }()
    
    let mainMenuCellId = "mainMenuCellId"

    let selectedImages = ["icon_home", "icon_add_clicked", "icon_aboutMe"]
    let imageNames = ["icon_home_clicked", "icon_add_unclicked", "icon_aboutMe_clicked"]
  
    var previousIndexClicked: IndexPath?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: mainMenuCellId)
        
        
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainMenuCellId, for: indexPath) as! MenuCell

        
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])
        if(indexPath.item == 0){
            cell.imageView.image = UIImage(named: selectedImages[indexPath.item])
            previousIndexClicked = indexPath
        }
        //cell.tintColor = UIColor(red: 255/255, green: 204/255, blue: 103/255, alpha: 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
   
        return CGSize(width: frame.width / 3, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        if indexPath.item == 1{
//            //the center menu button is clicked, addTabLauncher activated
//            addTabLauncher = AddTabLauncher()
//            addTabLauncher?.navigationController = self.homePageController?.navigationController
//            addTabLauncher?.homePageController = self.homePageController
//            addTabLauncher?.mainMenuBar = self
//            addTabLauncher?.showLauncher()
//
//            return
//        }
        
        let previousCell = collectionView.cellForItem(at: previousIndexClicked!) as! MenuCell
        previousCell.imageView.image = UIImage(named: imageNames[previousIndexClicked!.item])
        
        let cell = collectionView.cellForItem(at: indexPath) as! MenuCell
        cell.imageView.image = UIImage(named: selectedImages[indexPath.item])
        previousIndexClicked = indexPath
        
        if indexPath.item == 2{
            homePageController?.scrollToMainMenuIndex(menuIndex: indexPath.item)
            homePageController?.navigationItem.title = navigationTitles[indexPath.item]
            
            
            let guidanceImage = UIImage(named: "icon_guidance")?.withRenderingMode((.alwaysOriginal))
            let guidanceBarButtonItem = UIBarButtonItem(image: guidanceImage, style: .plain, target: self.homePageController, action: #selector(homePageController?.handleGuidance))
            homePageController?.navigationItem.rightBarButtonItem = guidanceBarButtonItem
            homePageController?.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: (homePageController?.tutorialButton)!)
            
            
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
        if indexPath.item == 0{
            homePageController?.scrollToMainMenuIndex(menuIndex: indexPath.item)
            homePageController?.navigationItem.title = navigationTitles[indexPath.item]
            homePageController?.tutorialButton.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
            
            let guidanceImage = UIImage(named: "icon_guidance")?.withRenderingMode((.alwaysOriginal))
            let guidanceBarButtonItem = UIBarButtonItem(image: guidanceImage, style: .plain, target: self.homePageController, action: #selector(homePageController?.handleGuidance))
            homePageController?.navigationItem.rightBarButtonItem = guidanceBarButtonItem
            homePageController?.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: (homePageController?.tutorialButton)!)
            
            self.homePageController?.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.homePageController?.navigationController?.navigationBar.shadowImage = UIImage()
            self.homePageController?.navigationController?.navigationBar.isTranslucent = true
            
            
            //homePageController?.navigationItem.leftBarButtonItem?.isEnabled = true
        }
        if indexPath.item == 1{
            homePageController?.scrollToMainMenuIndex(menuIndex: indexPath.item)
            homePageController?.navigationItem.title = navigationTitles[indexPath.item]
            //homePageController?.logOutButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
            
            self.homePageController?.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: (homePageController?.tutorialButton)!)
            self.homePageController?.rightButton = UIBarButtonItem(title: "Edit", style: .plain, target: self.homePageController, action: #selector(self.homePageController?.showEditing))
            //self.homePageController?.rightButton.ti
            self.homePageController?.navigationItem.rightBarButtonItem = self.homePageController?.rightButton
            //self.homePageController?.navigationItem.rightBarButtonItem = self.homePageController?.rightButton
//            self.homePageController?.navigationItem.rightBarButtonItem = self.homePageController?.editButtonItem
            //homePageController?.editButtonItem.tintColor = .white
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
            //homePageController?.navigationItem.leftBarButtonItem?.isEnabled = true
        }
        
        
    }
    
    
}
