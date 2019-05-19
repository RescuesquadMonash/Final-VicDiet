//
//  SubstituteSecondController.swift
//  VicDiet
//
//  Created by Ming Yang on 2/5/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit
import StepIndicator

class SubstituteFifthController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
//    var substituteForthController: SubstituteForthController?
    var homePageController: HomePageController?
//    var detailList = [String]()
    
    var selectedOldFoodObject: FoodObject?
    var selectedNewFoodObject: FoodObject?
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        return tv
        
    }()
    
//    var fixedDimensionalArray = [ExpandableNames]()
    var detailTitle = ["Food Name","Detail","Protein (g)","Calcium (Ca) (mg)","Total fat (g)","Sodium (Na) (mg)","Vitamin C (mg)","Vitamin A retinol equivalents (µg)"]
    
    let navigationTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "Result"
        label.font =  UIFont.boldSystemFont(ofSize: 18)
        label.backgroundColor = .clear
        label.textAlignment = .center
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.text = "Result"
        label.font =  UIFont.boldSystemFont(ofSize: 18)
        label.backgroundColor = .clear
        label.textAlignment = .center
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    let stepIndicatorView: StepIndicatorView = {
        let stepIndicator = StepIndicatorView()
        stepIndicator.numberOfSteps = 6
        stepIndicator.currentStep = 5
        stepIndicator.backgroundColor = .white
        return stepIndicator
    }()


    private let chooseToEatButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Confirm", for: .normal)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        setupNavigationBar()
        setupBottomButton()
        setupLayout()
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId0")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId1")
        tableView.register(SubstituteResultCell.self, forCellReuseIdentifier: "cellId20")
        
        
        tableView.tableFooterView = UIView()
        
        tableView.separatorStyle = .none
    }
    func setupLayout(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    }
    
    func setupNavigationBar(){
        self.navigationItem.hidesBackButton = true
        let backImage = UIImage(named: "icon_back")?.withRenderingMode((.alwaysOriginal))
        let backBarButtonItem = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(handleBack))
        navigationItem.leftBarButtonItem = backBarButtonItem
        navigationItem.leftBarButtonItem?.tintColor = UIColor(red: 125/255, green: 206/255, blue: 148/255, alpha: 1)
        
        navigationTitleLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width*1/3, height: self.navigationController?.navigationBar.frame.height ?? 20)
        navigationItem.titleView = navigationTitleLabel
    }
    
    func setupBottomButton(){
        
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
    
    @objc func handleBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func handleChooseToEat(){
        
        self.homePageController?.foodIntakeTodayList.append(selectedNewFoodObject!)
        NotificationCenter.default.post(name: NSNotification.Name("reloadHomePageData"), object: nil)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.popViewControllers(controllersToPop: 6, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 1
        }
        if(section == 1){
            return 1
            
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellId0", for: indexPath) as! UITableViewCell
            cell.selectionStyle = .none
            subTitleLabel.frame = CGRect(x: cell.frame.width*0.1, y: 0, width: cell.frame.width*0.8, height: cell.frame.height)
            cell.addSubview(subTitleLabel)
            
            return cell
        }
        if(indexPath.section == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellId1", for: indexPath) as! UITableViewCell
            cell.selectionStyle = .none
            stepIndicatorView.frame = CGRect(x: cell.frame.width*0.1, y: 0, width: cell.frame.width*0.8, height: cell.frame.height)
            stepIndicatorView.currentStep = 5
            cell.addSubview(stepIndicatorView)
            
            return cell
        }else{
            
                
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellId20", for: indexPath) as! SubstituteResultCell
            
            cell.substituteFifthController = self
            cell.homePageController = self.homePageController
            
            cell.backgroundColor = .yellow
            
            cell.selectionStyle = .none

            cell.setupSubTitle(oldQuantity: 100*(selectedOldFoodObject?.num)!, oldName: (selectedOldFoodObject?.name)!, newQuantity: 100*(selectedNewFoodObject?.num)!, newName: (selectedNewFoodObject?.name)!)
            cell.setupLeftSideData(protein: Double(Int((selectedOldFoodObject?.protein.doubleValue)!*1000))*0.001, calcium: Double(Int((selectedOldFoodObject?.calcium.doubleValue)!*1000))*0.001, fat: Double(Int((selectedOldFoodObject?.totalFat.doubleValue)!*1000))*0.001, sodium: Double(Int((selectedOldFoodObject?.sodium.doubleValue)!*1000))*0.001, vitaminC: Double(Int((selectedOldFoodObject?.vitaminC.doubleValue)!*1000))*0.001, vitaminA: Double(Int((selectedOldFoodObject?.vitaminA.doubleValue)!*1000))*0.001)
            cell.setupRightSideData(protein: Double(Int((selectedNewFoodObject?.protein.doubleValue)!*1000))*0.001, calcium: Double(Int((selectedNewFoodObject?.calcium.doubleValue)!*1000))*0.001, fat: Double(Int((selectedNewFoodObject?.totalFat.doubleValue)!*1000))*0.001, sodium: Double(Int((selectedNewFoodObject?.sodium.doubleValue)!*1000))*0.001, vitaminC: Double(Int((selectedNewFoodObject?.vitaminC.doubleValue)!*1000))*0.001, vitaminA: Double(Int((selectedNewFoodObject?.vitaminA.doubleValue)!*1000))*0.001)
                
                
                
            return cell
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0){
            return self.view.frame.height*0
        }
        if(indexPath.section == 1){
            return self.view.frame.height*0.1
        }else{
            return self.view.frame.height*0.7
        }
    }
    
    
    
}
