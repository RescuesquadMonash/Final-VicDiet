//
//  FoodOfMealController.swift
//  VicDiet
//
//  Created by Ming Yang on 18/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class FoodOfMealController: UIViewController,UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        return tv
        
    }()
    var tableIsEditing = false
    var homePageController: HomePageController?
    var mealListController: MealListController?
    var mealTag: Int?
    var mealObjectList = [MealObject]()
    var mealPlanResultController: MealPlanResultController?
    
    private let chooseToEatButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Eat them now", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.addTarget(self, action: #selector(handleChooseToEat), for: .touchUpInside)
        
        return button
    }()
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
   
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
  
        tableView.setEditing(tableIsEditing, animated: true)
        if let title = tableView.cellForRow(at: IndexPath(item: 0, section: 0)){
            let mealTitleCell = title as! MealTitleCell
            mealTitleCell.mealNameTextField.isUserInteractionEnabled = tableIsEditing
            if tableIsEditing{
                mealTitleCell.mealNameTextField.textColor = .gray
            }else{
                let stringMealName = mealTitleCell.mealNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                if stringMealName != ""{
                    mealObjectList[mealTag!].name = stringMealName
                }
                mealTitleCell.mealNameTextField.textColor = .black
            }
        }
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
        print(editing)
        if editing == true{
            tableIsEditing = editing
            super.setEditing(tableIsEditing, animated: animated)
            if tableView.cellForRow(at: IndexPath(item: 0, section: 0)) == nil{
                tableView.setContentOffset(CGPoint(x: 0, y: 0), animated:true)
                return
            }else{
                tableView.setEditing(tableIsEditing, animated: true)
                let mealTitleCell = tableView.cellForRow(at: IndexPath(item: 0, section: 0)) as! MealTitleCell
                mealTitleCell.mealNameTextField.isUserInteractionEnabled = tableIsEditing
                if tableIsEditing{
                    mealTitleCell.mealNameTextField.textColor = .gray
                }else{
                    let stringMealName = mealTitleCell.mealNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    if stringMealName != ""{
                        mealObjectList[mealTag!].name = stringMealName
                    }
                    mealTitleCell.mealNameTextField.textColor = .black
                }
                return
            }
        }else{
            tableIsEditing = editing
            super.setEditing(tableIsEditing, animated: animated)
            tableView.setEditing(tableIsEditing, animated: true)
            if tableView.cellForRow(at: IndexPath(item: 0, section: 0)) == nil{
                tableView.setContentOffset(CGPoint(x: 0, y: 0), animated:true)
                return
            }else{
                tableView.setEditing(tableIsEditing, animated: true)
                let mealTitleCell = tableView.cellForRow(at: IndexPath(item: 0, section: 0)) as! MealTitleCell
                mealTitleCell.mealNameTextField.isUserInteractionEnabled = tableIsEditing
                if tableIsEditing{
                    mealTitleCell.mealNameTextField.textColor = .gray
                }else{
                    let stringMealName = mealTitleCell.mealNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    if stringMealName != ""{
                        mealObjectList[mealTag!].name = stringMealName
                    }
                    mealTitleCell.mealNameTextField.textColor = .black
                }
                return
            }
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editButtonItem.tintColor = .white
        navigationItem.rightBarButtonItem = editButtonItem
        navigationItem.title = "Meal Information"
        //tableView.contentInset = UIEdgeInsets(top:(self.navigationController?.navigationBar.frame.height)!, left: 0, bottom: 0, right: 0)
        setupBackButton()
        setupBottomMenu()
        
        view.backgroundColor = .white
        tableView.register(MealTitleCell.self, forCellReuseIdentifier: "MealTitleCell")
        tableView.register(FoodInMealCell.self, forCellReuseIdentifier: "FoodInMealCell")
        tableView.register(AddFoodButtonCell.self, forCellReuseIdentifier: "AddFoodButtonCell")
        
        tableView.tableFooterView = UIView()
        //collectionView?.contentInset = UIEdgeInsets(top: -64, left: 0, bottom: 0, right: 0)
        tableView.contentInset = UIEdgeInsets(top: -64, left: 0, bottom: 0, right: 0)
        tableView.frame.size = CGSize(width: view.frame.width, height: view.frame.height)
        NotificationCenter.default.addObserver(self, selector: #selector(loadList(notification:)), name: NSNotification.Name(rawValue: "reloadFoodOfMealData"), object: nil)
        setupLayout()
    }
    
    @objc func loadList(notification: NSNotification) {
        self.tableView.reloadData()
    }
    func setupLayout(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    }
    
    fileprivate func setupBottomMenu(){
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [chooseToEatButton])
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
    
    func setupBackButton(){
        self.navigationItem.hidesBackButton = true
        let backImage = UIImage(named: "icon_back")?.withRenderingMode((.alwaysOriginal))
        let backBarButtonItem = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(handleBack))
        navigationItem.leftBarButtonItem = backBarButtonItem
        navigationItem.leftBarButtonItem?.tintColor = UIColor(red: 125/255, green: 206/255, blue: 148/255, alpha: 1)
    }
    
    @objc func handleBack(){
        
        self.mealListController?.mealObjectList = self.mealObjectList
        NotificationCenter.default.post(name: NSNotification.Name("reloadMealListData"), object: nil)
        self.navigationController?.popViewController(animated: true)
        
        
    }
    @objc func handleAddFood(){
     
        print("Food Sucessfully added!")
        let searchForMealViewController = SearchForMealViewController()
        
        searchForMealViewController.homePageController = self.homePageController
        searchForMealViewController.foodOfMealController = self
        searchForMealViewController.mealObject = self.mealObjectList[mealTag!]
        let oldNavigationController = self.navigationController
        oldNavigationController?.pushViewController(searchForMealViewController, animated: true)
    }
    @objc private func handleChooseToEat(){
        if mealObjectList[mealTag!].foodObjectList.count != 0{
            for i in 0...mealObjectList[mealTag!].foodObjectList.count - 1{
                let foodItem = mealObjectList[mealTag!].foodObjectList[i]
                self.homePageController?.foodIntakeTodayList.append(foodItem)
            }
            NotificationCenter.default.post(name: NSNotification.Name("reloadHomePageData"), object: nil)
        }
        //self.mealListController?.mealObjectList = self.mealObjectList
        self.homePageController?.mealObjectList = self.mealObjectList
        //NotificationCenter.default.post(name: NSNotification.Name("reloadMealListData"), object: nil)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        if mealPlanResultController != nil{
            self.navigationController?.popViewControllers(controllersToPop: 3, animated: true)
        }else{
            self.navigationController?.popViewControllers(controllersToPop: 2, animated: true)
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 1
        }
        if(section == 1){
            return mealObjectList[mealTag!].foodObjectList.count
            
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "MealTitleCell", for: indexPath) as! MealTitleCell
            cell.selectionStyle = .none
            cell.mealNameTextField.text = mealObjectList[mealTag!].name
            //cell.mealNameTextField.placeholder = mealObjectList[mealTag!].name
            return cell
        }
        if(indexPath.section == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: "FoodInMealCell", for: indexPath) as! FoodInMealCell
            cell.foodNameLabel.text = mealObjectList[mealTag!].foodObjectList[indexPath.row].name
            cell.foodDescriptionLabel.text = mealObjectList[mealTag!].foodObjectList[indexPath.row].surveyFlag
            cell.foodWeightLabel.text = "\(mealObjectList[mealTag!].foodObjectList[indexPath.row].num*100)g"
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddFoodButtonCell", for: indexPath) as! AddFoodButtonCell
            cell.addFoodButton.addTarget(self, action: #selector(handleAddFood), for: .touchUpInside)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0){
            return self.view.frame.height*0.3
        }
        if(indexPath.section == 1){
            return self.view.frame.height*0.15
        }else{
            return self.view.frame.height*0.15
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if tableView.isEditing{
            if indexPath.section == 1 {
                return .delete
            }
            return .none
        }
        return .none
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && editingStyle == .delete{
            self.mealObjectList[mealTag!].foodObjectList.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 || indexPath.section == 2{
            return false
        }
        return true
    }
    
}
