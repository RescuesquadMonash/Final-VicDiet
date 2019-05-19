//
//  FoodDetailTableViewController.swift
//  VicDiet
//
//  Created by Ming Yang on 26/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class FoodDetailForMealTableViewController: UITableViewController{


    
    var searchForMealViewController: SearchForMealViewController?
    var homePageController: HomePageController?
    var detailList = [String]()
    var selectedFoodObject: FoodObject?
    var fixedDimensionalArray = [ExpandableNames]()
    var detailTitle = ["Food Name","Detail","Protein (g)","Calcium (Ca) (mg)","Total fat (g)","Sodium (Na) (mg)","Vitamin C (mg)","Vitamin A retinol equivalents (µg)"]

    let inputConsoleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        return view
    }()
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("OK", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor(red: 66/255, green: 134/255, blue: 244/255, alpha: 1), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.separatorStyle = .none
        self.navigationItem.hidesBackButton = true
        setupBackBarButtons()
        //setupConfirmBarButtons()
        setupBottomMenu()
        
        tableView.register(FoodNameCell.self, forCellReuseIdentifier: "FoodNameCell")
        tableView.register(FoodDetailCell.self, forCellReuseIdentifier: "FoodDetailCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "BlankCell")
        tableView.register(FoodQuantityCell.self, forCellReuseIdentifier: "FoodQuantityCell")
        tableView.register(FoodEveryDayIntakePercentageCell.self, forCellReuseIdentifier: "FoodEveryDayIntakePercentageCell")
        
        self.navigationItem.title = "Food Information"
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        if section == 1{
            return 2
        }
        if section == 2{
            return 1
        }else {
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FoodNameCell", for: indexPath) as! FoodNameCell
            cell.foodNameLabel.text = detailList[0]
            return cell
        }
        if indexPath.section == 1{
            if indexPath.row == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "FoodDetailCell", for: indexPath) as! FoodDetailCell
                cell.foodNameLabel.text = detailList[0]
                cell.foodDetailLabel.text = detailList[1]
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "BlankCell", for: indexPath) as! UITableViewCell
                cell.backgroundColor = .white
                return cell
            }
        }
        if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FoodEveryDayIntakePercentageCell", for: indexPath) as! FoodEveryDayIntakePercentageCell
            cell.foodDetailForMealTableViewController = self
            cell.homePageController = self.homePageController
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FoodQuantityCell", for: indexPath) as! FoodQuantityCell
            inputConsoleView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/10)
            cell.inputTextField.inputAccessoryView = inputConsoleView
            
            
            inputConsoleView.addSubview(closeButton)
            closeButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                closeButton.topAnchor.constraint(equalTo: inputConsoleView.topAnchor, constant: inputConsoleView.frame.height/50),
                closeButton.leftAnchor.constraint(equalTo: inputConsoleView.leftAnchor, constant: inputConsoleView.frame.width*4/5),
                closeButton.rightAnchor.constraint(equalTo: inputConsoleView.rightAnchor, constant: 0),
                closeButton.bottomAnchor.constraint(equalTo: inputConsoleView.bottomAnchor, constant: -inputConsoleView.frame.height/50)
                ])
            closeButton.addTarget(self, action: #selector(handleCloseKeyboard), for: .touchUpInside)
            
            
            inputConsoleView.addSubview(cell.quantitySelection)
            cell.quantitySelection.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                cell.quantitySelection.topAnchor.constraint(equalTo: inputConsoleView.topAnchor, constant: cell.frame.height/15),
                cell.quantitySelection.leftAnchor.constraint(equalTo: inputConsoleView.leftAnchor, constant: cell.frame.width/5),
                cell.quantitySelection.rightAnchor.constraint(equalTo: inputConsoleView.rightAnchor, constant: -cell.frame.width/5),
                cell.quantitySelection.bottomAnchor.constraint(equalTo: inputConsoleView.bottomAnchor, constant: -cell.frame.height/15)
                ])
            cell.quantitySelection.addTarget(self, action: #selector(handleQuantityMetric(sender:)), for: .valueChanged)
            
            return cell
        }
    }
    
    @objc func handleQuantityMetric(sender: UISegmentedControl){
        let indexPath = NSIndexPath(row: 0, section: 3) as IndexPath
        let cell = tableView.cellForRow(at: indexPath) as! FoodQuantityCell
        switch sender.selectedSegmentIndex {
        case 1:
            cell.gramLabel.text = "grams"
        default:
            cell.gramLabel.text = "serves"
        }
        
    }
    @objc func handleCloseKeyboard(){
            let indexPath = NSIndexPath(row: 0, section: 3) as IndexPath
            let cell = tableView.cellForRow(at: indexPath) as! FoodQuantityCell
            cell.inputTextField.endEditing(true)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
//        if section == 0{
//            let header = FoodDetailTitleView()
//            header.titleLabel.text = "Description"
//            return header
//        }
        if section == 1{
            let header = FoodDetailTitleView()
            header.titleLabel.text = "Detail"
            return nil
        }
        if section == 2{
            let header = FoodDetailTitleView()
            header.titleLabel.text = "Quantity"
            return nil
        }
        if section == 3{
            let header = FoodDetailTitleView()
            header.titleLabel.text = "Everyday Intake Percentage"
            return nil
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 0{
//            return self.view.frame.height*0.1
//        }
        if section == 1{
            //return self.view.frame.height*0.15
            return 0
        }
        if section == 2{
            //return self.view.frame.height*0.15
            return 0
        }
        if section == 3{
            //return self.view.frame.height*0.15
            return 0
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            //return self.view.frame.height*0.2
            return 0
        }
        if indexPath.section == 1{
            if indexPath.row == 0{
                return (self.view.frame.height-50)*0.15
            }else{
                return 0
            }
            
        }
        if indexPath.section == 2{
            return (self.view.frame.height-50)*0.6
        }else {
            return (self.view.frame.height-50)*0.15
        }
    }
    
    
    func setupBackBarButtons(){
        let backImage = UIImage(named: "icon_back")?.withRenderingMode((.alwaysOriginal))
        let backBarButtonItem = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(handleBack))
        navigationItem.leftBarButtonItem = backBarButtonItem
        navigationItem.leftBarButtonItem?.tintColor = UIColor(red: 125/255, green: 206/255, blue: 148/255, alpha: 1)
    }
//    func setupConfirmBarButtons(){
//
//        let confirmImage = UIImage(named: "icon_confirm")?.withRenderingMode((.alwaysOriginal))
//        let confirmBarButtonItem = UIBarButtonItem(image: confirmImage, style: .plain, target: self, action: #selector(handleAddFood))
//        navigationItem.rightBarButtonItem = confirmBarButtonItem
//        navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 125/255, green: 206/255, blue: 148/255, alpha: 1)
//    }
    let chooseToAddButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add it now", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.addTarget(self, action: #selector(handleAddFood), for: .touchUpInside)
        
        return button
    }()
    func setupBottomMenu(){
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [chooseToAddButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    @objc func handleBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func handleAddFood(){
        let indexPath = NSIndexPath(row: 0, section: 3) as IndexPath
        let cell = tableView.cellForRow(at: indexPath) as! FoodQuantityCell
        let multipler = Double(cell.inputTextField.text!)
        if multipler != nil{
            if cell.quantitySelection.selectedSegmentIndex == 0{
                self.selectedFoodObject?.setWithMultipler(multipler: multipler!)
            }else{
                self.selectedFoodObject?.setWithMultipler(multipler: multipler!*0.01)
            }

        }else{
            self.selectedFoodObject?.setWithMultipler(multipler: 0)
        }
        self.searchForMealViewController?.mealObject.foodObjectList.append(selectedFoodObject!)
        self.navigationController?.popViewController(animated: true)
    }
    
}
