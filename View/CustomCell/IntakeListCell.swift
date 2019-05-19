//
//  TipsCell.swift
//  VicDiet
//
//  Created by Ming Yang on 5/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class IntakeListCell: UICollectionViewCell,UITableViewDataSource, UITableViewDelegate {
    
    
    var homePageController: HomePageController?
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        return tableView
        
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.register(FoodIntakeTodayTableViewCell.self, forCellReuseIdentifier: "FoodIntakeTodayTableViewCellId")
        tableView.separatorStyle = .none
        setupViews()
        backgroundColor = .yellow
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    func setupViews(){
        
        addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topAnchor, constant: 64).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50).isActive = true
        
        
        
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (homePageController?.foodIntakeTodayList.count)!
    }
    
    
//    func showEditing(sender: UIBarButtonItem)
//    {
//        if(self.tableView.isEditing == true)
//        {
//            self.tableView.isEditing = false
//            self.homePageController!.navigationItem.rightBarButtonItem?.title = "Done"
//        }
//        else
//        {
//            self.tableView.isEditing = true
//            self.homePageController!.navigationItem.rightBarButtonItem?.title = "Edit"
//        }
//    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0{
            return true
        }
        return true
    }
    
//    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        if tableView.isEditing{
//            if indexPath.section == 0 {
//                return .none
//            }
//            return .delete
//        }
//        return .none
//    }
//
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            let deletedFood = mealObjectList.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//            tableView.reloadData()
//        }
//    }
    
    func showEditing()
    {
        if(self.tableView.isEditing == true)
        {
            tableView.setEditing(false, animated: true)
            self.homePageController?.navigationItem.rightBarButtonItem?.title = "Edit"
        }
        else
        {
            tableView.setEditing(true, animated: true)
            self.homePageController?.navigationItem.rightBarButtonItem?.title = "Done"
        }
        
        //tableView.setEditing(true, animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if tableView.isEditing{
            if indexPath.section == 0 {
                return .delete
            }
            return .none
        }
        return .none
 
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deletedFood = homePageController?.foodIntakeTodayList.remove(at: indexPath.row)
            NotificationCenter.default.post(name: NSNotification.Name("reloadHomePageData"), object: nil)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodIntakeTodayTableViewCellId", for: indexPath) as! FoodIntakeTodayTableViewCell
        cell.foodNameLabel.text = homePageController?.foodIntakeTodayList[indexPath.row].name
        cell.foodDescriptionLabel.text = homePageController?.foodIntakeTodayList[indexPath.row].surveyFlag
        cell.foodWeightLabel.text = "\((homePageController?.foodIntakeTodayList[indexPath.row].num)!*100)g"
        
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.frame.height*0.2
    }
    
}
