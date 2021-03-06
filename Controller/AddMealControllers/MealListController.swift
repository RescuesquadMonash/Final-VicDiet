//
//  MealListController.swift
//  VicDiet
//
//  Created by Ming Yang on 18/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class MealListController: UITableViewController {

    var homePageController: HomePageController?
    var searchForMealViewController: SearchForMealViewController?
    var mealPlanResultController: MealPlanResultController?
    var mealObjectList = [MealObject]()
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func loadMealList(notification: NSNotification) {
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0{
            return false
        }
        return true
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if tableView.isEditing{
            if indexPath.section == 0 {
                return .none
            }
            return .delete
        }
        return .none
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deletedFood = mealObjectList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
        }
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

        tableView.register(MealListCell.self, forCellReuseIdentifier: "createMealListCell")
        tableView.register(MealListCell.self, forCellReuseIdentifier: "existingMealListCell")
        view.backgroundColor = .white
        editButtonItem.tintColor = .white
        navigationItem.rightBarButtonItem = editButtonItem
        self.navigationItem.title = "Meal List"
        setupBackButton()
        tableView.tableFooterView = UIView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadMealList(notification:)), name: NSNotification.Name(rawValue: "reloadMealListData"), object: nil)
        
    }
    
    @objc func handleBack(){
        
        self.homePageController?.mealObjectList = self.mealObjectList
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func setupBackButton(){
        self.navigationItem.hidesBackButton = true
        let backImage = UIImage(named: "icon_back")?.withRenderingMode((.alwaysOriginal))
        let backBarButtonItem = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(handleBack))
        navigationItem.leftBarButtonItem = backBarButtonItem
        navigationItem.leftBarButtonItem?.tintColor = UIColor(red: 125/255, green: 206/255, blue: 148/255, alpha: 1)
    }
   

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 1
        }else{
            return mealObjectList.count
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        if(indexPath.section == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "createMealListCell", for: indexPath) as! MealListCell
            cell.mealImageView.image = UIImage(named: "icon_addNewMeal")
            cell.mealNameLabel.text = "Create A Meal"
            cell.mealDescriptionLabel.text = "By creating a meal, you can add a lot of food in your meal."
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "existingMealListCell", for: indexPath) as! MealListCell
            cell.mealNameLabel.text = mealObjectList[indexPath.row].name
            cell.mealDescriptionLabel.text = "your meal."
            return cell
            
        }
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: true)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0){
            return self.view.frame.height*0.2
        }else{
            return self.view.frame.height*0.2
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.section == 0){
            let searchForMealViewController = SearchForMealViewController()
            
            searchForMealViewController.homePageController = self.homePageController
            searchForMealViewController.mealListController = self
            let oldNavigationController = self.navigationController
            oldNavigationController?.pushViewController(searchForMealViewController, animated: true)
        }else{
            let foodOfMealController = FoodOfMealController()
            foodOfMealController.mealTag = indexPath.row
            foodOfMealController.mealObjectList = self.mealObjectList
            foodOfMealController.mealListController = self
            foodOfMealController.homePageController = self.homePageController
            foodOfMealController.mealPlanResultController = self.mealPlanResultController
            let oldNavigationController = self.navigationController
            oldNavigationController?.pushViewController(foodOfMealController, animated: true)
        }
    }


}
