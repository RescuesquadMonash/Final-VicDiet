//
//  HomePageFirstCell.swift
//  VicDiet
//
//  Created by Ming Yang on 3/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class HomePageFirstCell: UICollectionViewCell,UITableViewDelegate, UITableViewDataSource{
    
    var homePageController: HomePageController?
    lazy var tableViewInFirstPage: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        return tv
        
    }()
    
    
    let addFoodButton: UIButton = {
        
        let button = UIButton(type: UIButton.ButtonType.custom) as UIButton
        //button.setTitle("Food Items", for: .normal)
        button.setImage(UIImage(named: "icon_addFood"), for: .normal)
        //button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        //button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    let addMealButton: UIButton = {
        
        let button = UIButton(type: UIButton.ButtonType.custom) as UIButton
        //button.setTitle("Meal Intakes", for: .normal)
        //button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        //button.setTitleColor(.white, for: .normal)
        button.setImage(UIImage(named: "icon_addMeal"), for: .normal)
        return button
    }()
    
    let addSubstituteButton: UIButton = {
        
        let button = UIButton(type: UIButton.ButtonType.custom) as UIButton
        //button.setTitle("Substitute", for: .normal)
        button.setImage(UIImage(named: "icon_substitute"), for: .normal)
        //button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        //button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    let autoMealPlannerButton: UIButton = {
        
        let button = UIButton(type: UIButton.ButtonType.custom) as UIButton
        //button.setTitle("AutoMealPlanner", for: .normal)
        //button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        //button.setTitleColor(.white, for: .normal)
        button.setImage(UIImage(named: "icon_autoMealPlanner"), for: .normal)
        return button
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableViewInFirstPage.register(DashboardOverviewCell.self, forCellReuseIdentifier: "DashboardOverviewCellId0")
        tableViewInFirstPage.register(DashboardOverviewCell.self, forCellReuseIdentifier: "DashboardOverviewCellId1")
        tableViewInFirstPage.register(DashboardOverviewCell.self, forCellReuseIdentifier: "DashboardOverviewCellId2")
        tableViewInFirstPage.register(DashboardOverviewCell.self, forCellReuseIdentifier: "DashboardOverviewCellId3")
        tableViewInFirstPage.register(DashboardOverviewCell.self, forCellReuseIdentifier: "DashboardOverviewCellId4")
        tableViewInFirstPage.register(DashboardOverviewCell.self, forCellReuseIdentifier: "DashboardOverviewCellId5")
        tableViewInFirstPage.register(FoodIntakeTodayTableViewCell.self, forCellReuseIdentifier: "FoodIntakeTodayTableViewCellId")
        tableViewInFirstPage.register(HomePageMenuCell.self, forCellReuseIdentifier: "HomePageMenuCellId0")
        tableViewInFirstPage.register(HomePageMenuCell.self, forCellReuseIdentifier: "HomePageMenuCellId1")
        tableViewInFirstPage.register(HomePageMenuCell.self, forCellReuseIdentifier: "HomePageMenuCellId2")
        tableViewInFirstPage.register(HomePageMenuCell.self, forCellReuseIdentifier: "HomePageMenuCellId3")
        tableViewInFirstPage.register(HomePageMenuCell.self, forCellReuseIdentifier: "HomePageMenuCellId4")
        backgroundColor = UIColor.white
        
        tableViewInFirstPage.separatorStyle = .none
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.section == 0){
            if(indexPath.row == 0){
                let dashBoardDetailController = DashBoardDetailController()
                dashBoardDetailController.homePageController = self.homePageController
                dashBoardDetailController.intakeProgressObject = self.homePageController!.intakeProgressObject
                dashBoardDetailController.targetPersonGroupList = self.homePageController!.targetPersonGroupList
                let oldNavigationController = self.homePageController!.navigationController
                oldNavigationController?.pushViewController(dashBoardDetailController, animated: true)
            }
        }
        if(indexPath.section == 1){
//            if indexPath.row == 0{
//                let dailyIntakedFoodController = DailyIntakedFoodController()
//                dailyIntakedFoodController.homePageController = self.homePageController
//                let oldNavigationController = self.homePageController!.navigationController
//                oldNavigationController?.pushViewController(dailyIntakedFoodController, animated: true)
//            }
            if indexPath.row == 0{
                let searchingViewController = SearchingViewController()
                searchingViewController.homePageController = self.homePageController
                let oldNavigationController = self.homePageController!.navigationController
                oldNavigationController?.pushViewController(searchingViewController, animated: true)
            }
            if indexPath.row == 1{
                let mealListController = MealListController()
                mealListController.homePageController = self.homePageController
                mealListController.mealObjectList = (self.homePageController?.mealObjectList)!
                let oldNavigationController = self.homePageController!.navigationController
                oldNavigationController?.pushViewController(mealListController, animated: true)
            }
            if indexPath.row == 2{
                let substituteZeroController = SubstituteZeroController()
                substituteZeroController.homePageController = self.homePageController
                let oldNavigationController = self.homePageController!.navigationController
                oldNavigationController?.pushViewController(substituteZeroController, animated: true)
            }
            if indexPath.row == 3{
                let mealPlanResultController = MealPlanResultController()
                mealPlanResultController.homePageController = self.homePageController
                mealPlanResultController.mealObjectList = (self.homePageController?.mealObjectList)!
                mealPlanResultController.intakeRestProgressObject = (self.homePageController?.intakeRestProgressObject)!.copy() as! IntakeProgressObject
                let oldNavigationController = self.homePageController!.navigationController
                oldNavigationController?.pushViewController(mealPlanResultController, animated: true)
            }
            
            
            
            
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 1
        }else{
            return 4
        }
//        if section == 1{
//            return 4
//            //return (homePageController?.foodIntakeTodayList.count)!
//        }
    }
    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        if indexPath.section == 1 {
//            return .delete
//        }
//        return .none
//    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            let deletedFood = homePageController?.foodIntakeTodayList.remove(at: indexPath.row)
//            NotificationCenter.default.post(name: NSNotification.Name("reloadHomePageData"), object: nil)
//            tableViewInFirstPage.deleteRows(at: [indexPath], with: .automatic)
//        }
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            let mark = homePageController!.intakeProgressObject.progressMark*100
            
            if mark < 50{
                let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardOverviewCellId0", for: indexPath) as! DashboardOverviewCell
                cell.setupCellView(grade: "D")
                return cell
            }
            if mark >= 50 && mark < 60{
                let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardOverviewCellId1", for: indexPath) as! DashboardOverviewCell
                cell.setupCellView(grade: "C")
                return cell
            }
            if mark >= 60 && mark < 70{
                let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardOverviewCellId2", for: indexPath) as! DashboardOverviewCell
                cell.setupCellView(grade: "B")
                return cell
            }
            if mark >= 70 && mark < 80{
                let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardOverviewCellId3", for: indexPath) as! DashboardOverviewCell
                cell.setupCellView(grade: "A")
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardOverviewCellId4", for: indexPath) as! DashboardOverviewCell
                cell.setupCellView(grade: "S")
                return cell
            }
            
            
        }else{
            if indexPath.row == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageMenuCellId0", for: indexPath) as! HomePageMenuCell
                cell.mealImageView.image = UIImage(named: "icon_addFood")
                cell.mealNameLabel.text = "Add Food"
                return cell
                
                
            }
            if indexPath.row == 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageMenuCellId1", for: indexPath) as! HomePageMenuCell
                cell.mealImageView.image = UIImage(named: "icon_addMeal")
                cell.mealNameLabel.text = "Add Meal"
                
                return cell
                
                
            }
            if indexPath.row == 2{
                let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageMenuCellId2", for: indexPath) as! HomePageMenuCell
                cell.mealImageView.image = UIImage(named: "icon_substitute")
                cell.mealNameLabel.text = "Add Substitute"
                
                return cell
                
                
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageMenuCellId3", for: indexPath) as! HomePageMenuCell
                cell.mealImageView.image = UIImage(named: "icon_autoMealPlanner")
                cell.mealNameLabel.text = "Auto Meal Plan"
                
                return cell
            }
        }
//            let cell = tableView.dequeueReusableCell(withIdentifier: "FoodIntakeTodayTableViewCellId", for: indexPath) as! FoodIntakeTodayTableViewCell
//            cell.foodNameLabel.text = homePageController?.foodIntakeTodayList[indexPath.row].name
//            cell.foodDescriptionLabel.text = homePageController?.foodIntakeTodayList[indexPath.row].surveyFlag
//            cell.foodWeightLabel.text = "\((homePageController?.foodIntakeTodayList[indexPath.row].num)!*100)g"
//
//            return nil
//        }else{
//            if indexPath.row == 0{
//                let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageMenuCellId4", for: indexPath) as! HomePageMenuCell
//                cell.mealImageView.image = UIImage(named: "icon_intakeList")
//                cell.mealNameLabel.text = "See Your Intake"
//
//                return cell
//
//
//            }
            
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if section == 1{
//            let header = FoodIntakeTodayheaderView()
//            return header
//        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 1{
//            return self.frame.width*0.2
//        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0){
            return self.frame.height*0.5
        }else{
            return self.frame.height*0.2
        }
    }
    
    func setupLayout(){
        addSubview(tableViewInFirstPage)
        tableViewInFirstPage.translatesAutoresizingMaskIntoConstraints = false
        tableViewInFirstPage.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        tableViewInFirstPage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        tableViewInFirstPage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        tableViewInFirstPage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50).isActive = true
    }
    
}

