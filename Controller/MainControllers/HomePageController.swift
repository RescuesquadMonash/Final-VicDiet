//
//  HomePageController.swift
//  VicDiet
//
//  Created by Ming Yang on 2/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//
import Foundation
import UIKit
import Firebase

let navigationTitles = ["Home","Intake List","Me"]

class HomePageController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    let logOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("LOG OUT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .clear
        //button.addTarget(self, action: #selector(handleLogOut), for: .touchUpInside)
        return button
    }()
    
    let tutorialButton: UIButton = {
        
        let button = UIButton(type: UIButton.ButtonType.custom) as UIButton
        //button.setTitle("Food Items", for: .normal)
        button.setImage(UIImage(named: "icon_tutorial_unclicked"), for: .normal)
        //button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        //button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    var guidanceLauncher: GuidanceLauncher?
    var foodIntakeTodayList = [FoodObject]()
    var mealObjectList = [MealObject]()
    //var personGroupList = [AveragePersonGroupObject]()
    var intakeProgressObject = IntakeProgressObject(proteinProgress: 0, calciumProgress: 0, totalFatProgress: 0, sodiumProgress: 0, vitaminCProgress: 0, vitaminAProgress: 0, progressMark: 0)
    var intakeRestProgressObject = IntakeProgressObject(proteinProgress: 0, calciumProgress: 0, totalFatProgress: 0, sodiumProgress: 0, vitaminCProgress: 0, vitaminAProgress: 0, progressMark: 0)
    var targetPersonGroupList = [AveragePersonGroupObject]()
    var userBasicInfo: UserBasicInfoObject?
    lazy var mainMenuBar: MainMenuBar = {
        let mmb = MainMenuBar()
        mmb.homePageController = self
        return mmb
    }()
    
    let firstCellId = "firstCellId"
    //let secondCellId = "secondCellId"
    //let thirdCellId = "thirdCellId"
    let forthCellId = "forthCellId"
    
    var guideViewCounter: Int = 0
    let homePageGuideViewFirst: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        view.alpha = 0
        return view
    }()
    
    var tutorialSwitch = TutorialSwitch(physicalInputGuideSwitch: false, progressLevelGuideSwitch: false, addOptionsGuideSwitch: false,mainMenuGuideSwitch: false)
    var physicalInputGuideView: PhysicalInputGuideView?
    var progressLevelGuideView: ProgressLevelGuideView?
    var addOptionsFoodGuideView: AddOptionsFoodGuideView?
    var addOptionsMealGuideView: AddOptionsMealGuideView?
    var addOptionsSubstituteGuideView: AddOptionsSubstituteGuideView?
    var addOptionsMealPlannerGuideView: AddOptionsMealPlannerGuideView?
    var mainMenuHomeGuideView: MainMenuHomeGuideView?
    var mainMenuMeGuideView: MainMenuMeGuideView?
    var mainMenuIntakeListGuideView: MainMenuIntakeListGuideView?
    
    var intakeListGuideView: IntakeListGuideView?
    var intakeListEditGuideView: IntakeListEditGuideView?
    
    var addFoodGuideView: AddFoodGuideView?
    var addMealGuideView: AddMealGuideView?
    var addSubstituteGuideView: AddSubstituteGuideView?
    var mealPlannerGuideView: MealPlannerGuideView?
    
    
    
    //[0,0,0,0] = [addFood,addSubstitute,addMeal,mealPlanner]
    var addButtonFirstClick = [0,0,0,0]
    
    var fixedDimensionalArray = [ExpandableNames]()
    var rightButton = UIBarButtonItem()
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        //tableView.setEditing(editing, animated: true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }


    override func viewWillDisappear(_ animated: Bool) {
        //self.navigationItem.leftBarButtonItem?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true
//        self.navigationController!.navigationBar.backgroundColor = UIColor.clear
        
        var nav = self.navigationController?.navigationBar
//        let gradient = CAGradientLayer()
//        var bounds = navigationController!.navigationBar.bounds
//        bounds.size.height += UIApplication.shared.statusBarFrame.size.height
//        gradient.frame = bounds
//        gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
//        gradient.startPoint = CGPoint(x: 0, y: 0)
//        gradient.endPoint = CGPoint(x: 1, y: 0)
//        if let image = getImageFrom(gradientLayer: gradient) {
//            navigationController!.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
//        }
        
//        nav?.barStyle = UIBarStyle.black
//        nav?.tintColor = UIColor.white
        //nav?.prefersLargeTitles = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

    }
//    override func viewDidDisappear(_ animated: Bool) {
//        <#code#>
//    }
    func getImageFrom(gradientLayer:CAGradientLayer) -> UIImage? {
        var gradientImage:UIImage?
        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        return gradientImage
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //UINavigationBar.appearance().tintColor=UIColor.yellow
        
        
        tutorialButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: tutorialButton)

        
        logOutButton.addTarget(self, action: #selector(handleLogOut), for: .touchUpInside)
        tutorialButton.addTarget(self, action: #selector(handleOpenTutorial), for: .touchUpInside)
        //self.navigationItem.leftBarButtonItem?.isEnabled = false
        collectionView.isScrollEnabled = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadList(notification:)), name: NSNotification.Name(rawValue: "reloadHomePageData"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(loadNewGuideView(notification:)), name: NSNotification.Name(rawValue: "showPossibleGuideView"), object: nil)
        
        //guidanceLauncher = GuidanceLauncher()
        //guidanceLauncher?.homePageController = self
        mainMenuBar.homePageController = self
        navigationItem.title = "Home"
        setupGuidanceBarButtons()
        setupCollectionView()
        setupBottomMenu()
        updateUserInfoAndTargetPersonGroup()
    }
    
    @objc func handleDismiss(){
        self.physicalInputGuideView?.alpha = 0
        self.progressLevelGuideView?.alpha = 0
        self.addOptionsFoodGuideView?.alpha = 0
        self.addOptionsMealGuideView?.alpha = 0
        self.addOptionsSubstituteGuideView?.alpha = 0
        self.addOptionsMealPlannerGuideView?.alpha = 0
        self.mainMenuHomeGuideView?.alpha = 0
        self.mainMenuMeGuideView?.alpha = 0
        self.mainMenuIntakeListGuideView?.alpha = 0
        
        self.intakeListGuideView?.alpha = 0
        self.intakeListEditGuideView?.alpha = 0
        
        self.addFoodGuideView?.alpha = 0
        self.addMealGuideView?.alpha = 0
        self.addSubstituteGuideView?.alpha = 0
        self.mealPlannerGuideView?.alpha = 0
        
        self.tutorialButton.setImage(UIImage(named: "icon_tutorial_unclicked"), for: .normal)
    }
    @objc func loadNewGuideView(notification: NSNotification) {
        
        if self.navigationItem.title == "Home"{
            
            UIView.animate(withDuration: 0.2, animations: {
                self.handleShowPhysicalInputGuide()
            })
            
        }
        if self.navigationItem.title == "Intake List"{
            UIView.animate(withDuration: 0.2, animations: {
                self.handleIntakeListGuide()
            })
            
        }
        if self.navigationItem.title == "Me"{
            
            
        }
    }
    func handleIntakeListGuide(){
        if let window = UIApplication.shared.keyWindow{
            self.intakeListGuideView = IntakeListGuideView(frame: window.frame)
            window.addSubview(self.intakeListGuideView!)
            self.intakeListGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismissIntakeListGuide)))
            self.intakeListGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
            UIView.animate(withDuration: 0.5, animations: {self.intakeListGuideView!.alpha = 1})
        }
    }
    @objc func handleDismissIntakeListGuide(){
        UIView.animate(withDuration: 0.2, animations: {
            self.intakeListGuideView?.alpha = 0
            
            if let window = UIApplication.shared.keyWindow{
                self.intakeListEditGuideView = IntakeListEditGuideView(frame: window.frame)
                window.addSubview(self.intakeListEditGuideView!)
                self.intakeListEditGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismissIntakeListEditGuide)))
                self.intakeListEditGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
                UIView.animate(withDuration: 0.5, animations: {self.intakeListEditGuideView!.alpha = 1})
            }
            
        })
    }
    @objc func handleDismissIntakeListEditGuide(){
        UIView.animate(withDuration: 0.2, animations: {
            self.intakeListEditGuideView?.alpha = 0
            self.tutorialButton.setImage(UIImage(named: "icon_tutorial_unclicked"), for: .normal)
        })
    }
    
    func handleShowPhysicalInputGuide(){
        if let window = UIApplication.shared.keyWindow{
            self.physicalInputGuideView = PhysicalInputGuideView(frame: window.frame)
            window.addSubview(self.physicalInputGuideView!)
            self.physicalInputGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismissPhysicalInputGuide)))
            self.physicalInputGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
            UIView.animate(withDuration: 0.5, animations: {self.physicalInputGuideView!.alpha = 1})
        }
    }
    @objc func handleDismissPhysicalInputGuide(){
        UIView.animate(withDuration: 0.2, animations: {
            self.physicalInputGuideView?.alpha = 0
            let cell = self.collectionView.cellForItem(at: IndexPath(item: 0, section: 0)) as! HomePageFirstCell
            cell.tableViewInFirstPage.setContentOffset(CGPoint(x: 0, y: 0), animated:true)
            if let window = UIApplication.shared.keyWindow{
                self.progressLevelGuideView = ProgressLevelGuideView(frame: window.frame)
                window.addSubview(self.progressLevelGuideView!)
                self.progressLevelGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismissProgressLevelGuide)))
                self.progressLevelGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
                UIView.animate(withDuration: 0.5, animations: {self.progressLevelGuideView!.alpha = 1})
            }
            
        })
    }
    
//    @objc func handleShowProgressLevelGuide(){
//        
//        if let window = UIApplication.shared.keyWindow{
//            self.progressLevelGuideView = ProgressLevelGuideView(frame: window.frame)
//            
//            
//            
//            window.addSubview(self.progressLevelGuideView!)
//            self.progressLevelGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismissProgressLevelGuide)))
//            self.progressLevelGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
//            UIView.animate(withDuration: 0.5, animations: {self.progressLevelGuideView!.alpha = 1})
//        }
//    }
    @objc func handleDismissProgressLevelGuide(){
        UIView.animate(withDuration: 0.2, animations: {
            self.progressLevelGuideView?.alpha = 0
            let cell = self.collectionView.cellForItem(at: IndexPath(item: 0, section: 0)) as! HomePageFirstCell
            cell.tableViewInFirstPage.setContentOffset(CGPoint(x: 0, y: cell.frame.height*0.4), animated:true)
            if let window = UIApplication.shared.keyWindow{
                self.addOptionsFoodGuideView = AddOptionsFoodGuideView(frame: window.frame)
                window.addSubview(self.addOptionsFoodGuideView!)
                self.addOptionsFoodGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleShowAddOptionsMealGuide)))
                self.addOptionsFoodGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
                UIView.animate(withDuration: 0.5, animations: {self.addOptionsFoodGuideView!.alpha = 1})
            }
        })
    }
    @objc func handleShowAddOptionsMealGuide(){
        UIView.animate(withDuration: 0.2, animations: {
            self.addOptionsFoodGuideView?.alpha = 0
            if let window = UIApplication.shared.keyWindow{
                self.addOptionsMealGuideView = AddOptionsMealGuideView(frame: window.frame)
                window.addSubview(self.addOptionsMealGuideView!)
                self.addOptionsMealGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismissAddOptionsMealGuide)))
                self.addOptionsMealGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
                UIView.animate(withDuration: 0.5, animations: {self.addOptionsMealGuideView!.alpha = 1})
            }
        })
    }
    @objc func handleDismissAddOptionsMealGuide(){
        UIView.animate(withDuration: 0.2, animations: {
            self.addOptionsMealGuideView?.alpha = 0
            if let window = UIApplication.shared.keyWindow{
                self.addOptionsSubstituteGuideView = AddOptionsSubstituteGuideView(frame: window.frame)
                window.addSubview(self.addOptionsSubstituteGuideView!)
                self.addOptionsSubstituteGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismissAddOptionsSubstituteGuide)))
                self.addOptionsSubstituteGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
                UIView.animate(withDuration: 0.5, animations: {self.addOptionsSubstituteGuideView!.alpha = 1})
            }
        })
    }
    @objc func handleDismissAddOptionsSubstituteGuide(){
        UIView.animate(withDuration: 0.2, animations: {
            self.addOptionsSubstituteGuideView?.alpha = 0
            if let window = UIApplication.shared.keyWindow{
                self.addOptionsMealPlannerGuideView = AddOptionsMealPlannerGuideView(frame: window.frame)
                window.addSubview(self.addOptionsMealPlannerGuideView!)
                self.addOptionsMealPlannerGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismissAddOptionsMealPlannerGuide)))
                self.addOptionsMealPlannerGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
                UIView.animate(withDuration: 0.5, animations: {self.addOptionsMealPlannerGuideView!.alpha = 1})
            }
        })
    }
    @objc func handleDismissAddOptionsMealPlannerGuide(){
        UIView.animate(withDuration: 0.2, animations: {
            self.addOptionsMealPlannerGuideView?.alpha = 0
            if let window = UIApplication.shared.keyWindow{
                self.mainMenuHomeGuideView = MainMenuHomeGuideView(frame: window.frame)
                window.addSubview(self.mainMenuHomeGuideView!)
                self.mainMenuHomeGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleShowMainMenuMeGuide)))
                self.mainMenuHomeGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
                UIView.animate(withDuration: 0.5, animations: {self.mainMenuHomeGuideView!.alpha = 1})
            }
        })
    }
//    @objc func handleShowMainMenuHomeGuide(){
//        UIView.animate(withDuration: 0.2, animations: {
//            //self.foodIntakeTodayGuideView?.alpha = 0
//            if let window = UIApplication.shared.keyWindow{
//                self.mainMenuHomeGuideView = MainMenuHomeGuideView(frame: window.frame)
//                window.addSubview(self.mainMenuHomeGuideView!)
//                self.mainMenuHomeGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleShowMainMenuMeGuide)))
//                self.mainMenuHomeGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
//                UIView.animate(withDuration: 0.5, animations: {self.mainMenuHomeGuideView!.alpha = 1})
//            }
//        })
//    }
    @objc func handleShowMainMenuMeGuide(){
        UIView.animate(withDuration: 0.2, animations: {
            self.mainMenuHomeGuideView?.alpha = 0
            if let window = UIApplication.shared.keyWindow{
                self.mainMenuMeGuideView = MainMenuMeGuideView(frame: window.frame)
                window.addSubview(self.mainMenuMeGuideView!)
                self.mainMenuMeGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleShowMainMenuIntakeListGuideView)))
                self.mainMenuMeGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
                UIView.animate(withDuration: 0.5, animations: {self.mainMenuMeGuideView!.alpha = 1})
            }
        })
    }
    @objc func handleShowMainMenuIntakeListGuideView(){
        UIView.animate(withDuration: 0.2, animations: {
            self.mainMenuMeGuideView?.alpha = 0
            if let window = UIApplication.shared.keyWindow{
                self.mainMenuIntakeListGuideView = MainMenuIntakeListGuideView(frame: window.frame)
                window.addSubview(self.mainMenuIntakeListGuideView!)
                self.mainMenuIntakeListGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismissMainMenuIntakeListGuide)))
                self.mainMenuIntakeListGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
                UIView.animate(withDuration: 0.5, animations: {self.mainMenuIntakeListGuideView!.alpha = 1})
            }
        })
    }
    @objc func handleDismissMainMenuIntakeListGuide(){
        UIView.animate(withDuration: 0.2, animations: {
            self.mainMenuIntakeListGuideView?.alpha = 0
            self.tutorialButton.setImage(UIImage(named: "icon_tutorial_unclicked"), for: .normal)
            let cell = self.collectionView.cellForItem(at: IndexPath(item: 0, section: 0)) as! HomePageFirstCell
            cell.tableViewInFirstPage.setContentOffset(CGPoint(x: 0, y: 0), animated:true)
        })
    }
    @objc func handleShowAddFoodGuide(){
        UIView.animate(withDuration: 0.2, animations: {
            
            if let window = UIApplication.shared.keyWindow{
                self.addFoodGuideView = AddFoodGuideView(frame: window.frame)
                window.addSubview(self.addFoodGuideView!)
                
                self.addFoodGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismiss)))
                self.addFoodGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
                UIView.animate(withDuration: 0.5, animations: {self.addFoodGuideView!.alpha = 1 })
                
            }
        })
       
    }
    @objc func handleShowAddMealGuide(){
        UIView.animate(withDuration: 0.2, animations: {
            
            if let window = UIApplication.shared.keyWindow{
                self.addMealGuideView = AddMealGuideView(frame: window.frame)
                window.addSubview(self.addMealGuideView!)
                
                self.addMealGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismiss)))
                self.addMealGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
                UIView.animate(withDuration: 0.5, animations: {self.addMealGuideView!.alpha = 1 })
                
            }
        })
    }
    @objc func handleShowAddSubstituteGuide(){
        UIView.animate(withDuration: 0.2, animations: {
            
            if let window = UIApplication.shared.keyWindow{
                self.addSubstituteGuideView = AddSubstituteGuideView(frame: window.frame)
                window.addSubview(self.addSubstituteGuideView!)
                
                self.addSubstituteGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismiss)))
                self.addSubstituteGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
                UIView.animate(withDuration: 0.5, animations: {self.addSubstituteGuideView!.alpha = 1 })
                
            }
        })
    }
    @objc func handleShowMealPlannerGuide(){
        UIView.animate(withDuration: 0.2, animations: {
            
            if let window = UIApplication.shared.keyWindow{
                self.mealPlannerGuideView = MealPlannerGuideView(frame: window.frame)
                window.addSubview(self.mealPlannerGuideView!)
                
                self.mealPlannerGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismiss)))
                self.mealPlannerGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
                UIView.animate(withDuration: 0.5, animations: {self.mealPlannerGuideView!.alpha = 1 })
            }
        })
    }
    
    
    
    @objc func handleLogOut(){
        print("sss")
        
        do {
            try Auth.auth().signOut()
        } catch{
            
        }
        let logInPage = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "LogInViewController") as? LogInViewController
        let appDelegate = UIApplication.shared.delegate
        appDelegate?.window??.rootViewController = logInPage
        
        
    }
    
    @objc func handleOpenTutorial(){
        if self.navigationItem.title == "Home"{
            
            tutorialButton.setImage(UIImage(named: "icon_tutorial_clicked"), for: .normal)
            UserDefaults.standard.set(true, forKey:"everLaunched")
            NotificationCenter.default.post(name: NSNotification.Name("showPossibleGuideView"), object: nil)
        
        }
        if self.navigationItem.title == "Intake List"{
            
            tutorialButton.setImage(UIImage(named: "icon_tutorial_clicked"), for: .normal)
            UserDefaults.standard.set(true, forKey:"everLaunched")
            NotificationCenter.default.post(name: NSNotification.Name("showPossibleGuideView"), object: nil)
            
        }
        
    }
    func setupCollectionView(){
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
        collectionView?.register(HomePageFirstCell.self, forCellWithReuseIdentifier: firstCellId)
        collectionView?.register(IntakeListCell.self, forCellWithReuseIdentifier: "IntakeListCellId")
        //collectionView?.register(TipsCell.self, forCellWithReuseIdentifier: thirdCellId)
        collectionView?.register(MeCell.self, forCellWithReuseIdentifier: forthCellId)
        collectionView?.contentInset = UIEdgeInsets(top: -64, left: 0, bottom: 0, right: 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView?.isPagingEnabled = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.item == 0){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: firstCellId, for: indexPath) as! HomePageFirstCell
            cell.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 153/255, alpha: 1)
            
          
           
            
            
            cell.homePageController = self
            cell.tableViewInFirstPage.reloadData()
            return cell
        }
        if (indexPath.item == 1){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IntakeListCellId", for: indexPath) as! IntakeListCell
            
            
            
            
            
            cell.homePageController = self
            cell.backgroundColor = UIColor.white
            cell.tableView.reloadData()
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: forthCellId, for: indexPath) as! MeCell
            
            
            cell.backgroundColor = UIColor.white
            cell.homePageController = self
            cell.collectionViewNestedFirst.reloadData()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: view.frame.height - 35 - (self.navigationController?.navigationBar.frame.height)!)
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.move().x / view.frame.width
//        if index > 0{
//            let indexPath = NSIndexPath(item: Int(index)+1, section: 0)
//            let previousCell = mainMenuBar.collectionView.cellForItem(at: mainMenuBar.previousIndexClicked!) as! MenuCell
//            previousCell.imageView.image = UIImage(named: mainMenuBar.imageNames[mainMenuBar.previousIndexClicked!.item])
//            let cell = mainMenuBar.collectionView.cellForItem(at: indexPath as IndexPath) as! MenuCell
//            cell.imageView.image = UIImage(named: mainMenuBar.selectedImages[indexPath.item])
//            mainMenuBar.previousIndexClicked = indexPath as IndexPath
//            navigationItem.title = navigationTitles[indexPath.item - 1]
//        }else{
            let indexPath = NSIndexPath(item: Int(index), section: 0)
            let previousCell = mainMenuBar.collectionView.cellForItem(at: mainMenuBar.previousIndexClicked!) as! MenuCell
            previousCell.imageView.image = UIImage(named: mainMenuBar.imageNames[mainMenuBar.previousIndexClicked!.item])
            let cell = mainMenuBar.collectionView.cellForItem(at: indexPath as IndexPath) as! MenuCell
            cell.imageView.image = UIImage(named: mainMenuBar.selectedImages[indexPath.item])
            mainMenuBar.previousIndexClicked = indexPath as IndexPath
            navigationItem.title = navigationTitles[indexPath.item]
            //UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1)]
        if index == 0{
//            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//            self.navigationController?.navigationBar.shadowImage = UIImage()
//            self.navigationController?.navigationBar.isTranslucent = true
            
            
            
            let guidanceImage = UIImage(named: "icon_guidance")?.withRenderingMode((.alwaysOriginal))
            let guidanceBarButtonItem = UIBarButtonItem(image: guidanceImage, style: .plain, target: self, action: #selector(handleGuidance))
            navigationItem.rightBarButtonItem = guidanceBarButtonItem
            
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.isTranslucent = true
            return
        }
        if index == 1{
            let gradient = CAGradientLayer()
            var bounds = navigationController!.navigationBar.bounds
            bounds.size.height += UIApplication.shared.statusBarFrame.size.height
            gradient.frame = bounds
            gradient.colors = [UIColor(red: 55/255, green: 59/255, blue: 68/255, alpha: 1).cgColor, UIColor(red: 66/255, green: 134/255, blue: 244/255, alpha: 1).cgColor]
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 1, y: 0)
            if let image = getImageFrom(gradientLayer: gradient) {
                navigationController!.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
            }
//            navigationItem.rightBarButtonItem = editButtonItem
//            editButtonItem.tintColor = .red
            
            
            rightButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(showEditing))
            self.navigationItem.rightBarButtonItem = rightButton
//            let guidanceImage = UIImage(named: "icon_guidance")?.withRenderingMode((.alwaysOriginal))
//            let guidanceBarButtonItem = UIBarButtonItem(title: "EE", style: .plain, target: self, action: #selector(handleGuidance))
            
            
            return
        }else{
            let gradient = CAGradientLayer()
            var bounds = navigationController!.navigationBar.bounds
            bounds.size.height += UIApplication.shared.statusBarFrame.size.height
            gradient.frame = bounds
            gradient.colors = [UIColor(red: 55/255, green: 59/255, blue: 68/255, alpha: 1).cgColor, UIColor(red: 66/255, green: 134/255, blue: 244/255, alpha: 1).cgColor]
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 1, y: 0)
            if let image = getImageFrom(gradientLayer: gradient) {
                navigationController!.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
            }
            
            
            let guidanceImage = UIImage(named: "icon_guidance")?.withRenderingMode((.alwaysOriginal))
            let guidanceBarButtonItem = UIBarButtonItem(image: guidanceImage, style: .plain, target: self, action: #selector(handleGuidance))
            navigationItem.rightBarButtonItem = guidanceBarButtonItem
        }

        return 
    }
    
    @objc func showEditing(){
        let indexPath = NSIndexPath(item: 1, section: 0)
        let cell = collectionView?.cellForItem(at: indexPath as IndexPath) as! IntakeListCell
        cell.showEditing()
        
    }
    
    
    func scrollToMainMenuIndex(menuIndex: Int){
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
    }
    
    func updateUserInfoAndTargetPersonGroup(){
        Service.sharedInstance.fetchUser { (userBasicInfoObject) in
            self.foodIntakeTodayList = [FoodObject]()
            self.mealObjectList = [MealObject]()
            self.intakeProgressObject = IntakeProgressObject(proteinProgress: 0, calciumProgress: 0, totalFatProgress: 0, sodiumProgress: 0, vitaminCProgress: 0, vitaminAProgress: 0, progressMark: 0)
            self.userBasicInfo = userBasicInfoObject
            NotificationCenter.default.post(name: NSNotification.Name("reloadHomePageData"), object: nil)
            Service.sharedInstance.fetchAllPersonGroupStandard { (personGroupList) in
                var target = [AveragePersonGroupObject]()
                for i in 0...(personGroupList.count - 1){
                    if Double(exactly: personGroupList[i].ageLower)! <= Double(exactly: (self.userBasicInfo?.age)!)! && Double(exactly: personGroupList[i].ageUpper)! >= Double(exactly: (self.userBasicInfo?.age)!)! && personGroupList[i].gender.lowercased() == self.userBasicInfo?.gender.lowercased(){
                        target.append(personGroupList[i])
                        break
                    }
                }
                self.targetPersonGroupList = target
                print("Target user standard is matched based on the current user!")
                NotificationCenter.default.post(name: NSNotification.Name("reloadHomePageData"), object: nil)
            }
        }
    }
    
    func setupGuidanceBarButtons(){
        let guidanceImage = UIImage(named: "icon_guidance")?.withRenderingMode((.alwaysOriginal))
        let guidanceBarButtonItem = UIBarButtonItem(image: guidanceImage, style: .plain, target: self, action: #selector(handleGuidance))
        navigationItem.rightBarButtonItem = guidanceBarButtonItem
    }
    
    @objc func handleGuidance(){
        guidanceLauncher = GuidanceLauncher()
        guidanceLauncher?.showGuidance()
        guidanceLauncher?.homePageController = self
    }
    
    fileprivate func setupBottomMenu(){
        let bottomControlsStackView = UIStackView(arrangedSubviews: [mainMenuBar])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 55)
            ])
  
    }
    
    @objc func loadList(notification: NSNotification) {
        updateIntakeProgress()
        self.collectionView.reloadData()
    }
    
    func updateIntakeProgress(){
        let intakeProgressObject = IntakeProgressObject(proteinProgress: 0, calciumProgress: 0, totalFatProgress: 0, sodiumProgress: 0, vitaminCProgress: 0, vitaminAProgress: 0, progressMark: 0)
        let intakeRestProgressObject = IntakeProgressObject(proteinProgress: 0, calciumProgress: 0, totalFatProgress: 0, sodiumProgress: 0, vitaminCProgress: 0, vitaminAProgress: 0, progressMark: 0)
        if foodIntakeTodayList.count == 0 && self.targetPersonGroupList.count == 0{
            self.intakeProgressObject = intakeProgressObject
            
            
            return
        }
        if foodIntakeTodayList.count == 0 && self.targetPersonGroupList.count > 0{
            self.intakeProgressObject = intakeProgressObject
            self.intakeRestProgressObject.proteinProgress = Double(truncating: self.targetPersonGroupList[0].protein)
            self.intakeRestProgressObject.calciumProgress = Double(truncating: self.targetPersonGroupList[0].calcium)
            self.intakeRestProgressObject.totalFatProgress = Double(truncating: self.targetPersonGroupList[0].totalFat)
            self.intakeRestProgressObject.sodiumProgress = Double(truncating: self.targetPersonGroupList[0].sodium)
            self.intakeRestProgressObject.vitaminCProgress = Double(truncating: self.targetPersonGroupList[0].vitaminC)
            self.intakeRestProgressObject.vitaminAProgress = Double(truncating: self.targetPersonGroupList[0].vitaminA)
            self.intakeRestProgressObject.progressMark = 1
            
            print("Progess Mark: ",self.intakeProgressObject.progressMark*100," Points")
            print("Rest Progess Mark: ",self.intakeRestProgressObject.progressMark*100," Points")
            return
        }
        
        for i in 0...foodIntakeTodayList.count - 1{
            intakeProgressObject.proteinProgress = intakeProgressObject.proteinProgress + Double(truncating: self.foodIntakeTodayList[i].protein)
            intakeProgressObject.calciumProgress = Double(truncating: self.foodIntakeTodayList[i].calcium) + intakeProgressObject.calciumProgress
            intakeProgressObject.totalFatProgress = intakeProgressObject.totalFatProgress + Double(truncating: self.foodIntakeTodayList[i].totalFat)
            intakeProgressObject.sodiumProgress = intakeProgressObject.sodiumProgress + Double(truncating: self.foodIntakeTodayList[i].sodium)
            intakeProgressObject.vitaminCProgress = intakeProgressObject.vitaminCProgress + Double(truncating: self.foodIntakeTodayList[i].vitaminC)
            intakeProgressObject.vitaminAProgress = intakeProgressObject.vitaminAProgress + Double(truncating: self.foodIntakeTodayList[i].vitaminA)
            
            
            intakeRestProgressObject.proteinProgress = Double(truncating: self.targetPersonGroupList[0].protein) - intakeProgressObject.proteinProgress
            intakeRestProgressObject.calciumProgress = Double(truncating: self.targetPersonGroupList[0].calcium) - intakeProgressObject.calciumProgress
            intakeRestProgressObject.totalFatProgress = Double(truncating: self.targetPersonGroupList[0].totalFat) - intakeProgressObject.totalFatProgress
            intakeRestProgressObject.sodiumProgress = Double(truncating: self.targetPersonGroupList[0].sodium) - intakeProgressObject.sodiumProgress
            intakeRestProgressObject.vitaminCProgress = Double(truncating: self.targetPersonGroupList[0].vitaminC) - intakeProgressObject.vitaminCProgress
            intakeRestProgressObject.vitaminAProgress = Double(truncating: self.targetPersonGroupList[0].vitaminA) - intakeProgressObject.vitaminAProgress
            if intakeRestProgressObject.proteinProgress < 0{
                intakeRestProgressObject.proteinProgress = 0
            }
            if intakeRestProgressObject.calciumProgress < 0{
                intakeRestProgressObject.calciumProgress = 0
            }
            if intakeRestProgressObject.sodiumProgress < 0{
                intakeRestProgressObject.sodiumProgress = 0
            }
            if intakeRestProgressObject.totalFatProgress < 0{
                intakeRestProgressObject.totalFatProgress = 0
            }
            if intakeRestProgressObject.vitaminCProgress < 0{
                intakeRestProgressObject.vitaminCProgress = 0
            }
            if intakeRestProgressObject.vitaminAProgress < 0{
                intakeRestProgressObject.vitaminAProgress = 0
            }
            
        }
        var proteinPercent = intakeProgressObject.proteinProgress/Double(truncating: self.targetPersonGroupList[0].protein)
        var calciumPercent = intakeProgressObject.calciumProgress/Double(truncating: self.targetPersonGroupList[0].calcium)
        var totalFatPercent = intakeProgressObject.totalFatProgress/Double(truncating: self.targetPersonGroupList[0].totalFat)
        var sodiumPercent = intakeProgressObject.sodiumProgress/Double(truncating: self.targetPersonGroupList[0].sodium)
        var CPercent = intakeProgressObject.vitaminCProgress/Double(truncating: self.targetPersonGroupList[0].vitaminC)
        var APercent = intakeProgressObject.vitaminAProgress/Double(truncating: self.targetPersonGroupList[0].vitaminA)
//        
//        var proteinRestPercent = intakeRestProgressObject.proteinProgress/Double(truncating: self.targetPersonGroupList[0].protein)
//        var calciumRestPercent = intakeRestProgressObject.calciumProgress/Double(truncating: self.targetPersonGroupList[0].calcium)
//        var totalFatRestPercent = intakeRestProgressObject.totalFatProgress/Double(truncating: self.targetPersonGroupList[0].totalFat)
//        var sodiumRestPercent = intakeRestProgressObject.sodiumProgress/Double(truncating: self.targetPersonGroupList[0].sodium)
//        var CRestPercent = intakeRestProgressObject.vitaminCProgress/Double(truncating: self.targetPersonGroupList[0].vitaminC)
//        var ARestPercent = intakeRestProgressObject.vitaminAProgress/Double(truncating: self.targetPersonGroupList[0].vitaminA)
//        
        if proteinPercent > 1{
            proteinPercent = 1
        }
        if calciumPercent > 1{
            calciumPercent = 1
        }
        if totalFatPercent > 1{
            totalFatPercent = 1
        }
        if sodiumPercent > 1{
            sodiumPercent = 1
        }
        if CPercent > 1{
            CPercent = 1
        }
        if APercent > 1{
            APercent = 1
        }
        let average = (proteinPercent + calciumPercent +
            totalFatPercent + sodiumPercent + CPercent +
            APercent)/6
        let averageRest = 1 - average
        intakeProgressObject.progressMark = average
        intakeRestProgressObject.progressMark = averageRest
        self.intakeProgressObject = intakeProgressObject
        self.intakeRestProgressObject = intakeRestProgressObject
        print("Progess Mark: ",self.intakeProgressObject.progressMark*100," Points")
        print("Rest Progess Mark: ",self.intakeRestProgressObject.progressMark*100," Points")
    }
    
}
extension UINavigationController {
    
    func popToViewControllerOfType(classForCoder: AnyClass) {
        for controller in viewControllers {
            if controller.classForCoder == classForCoder {
                popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    func popViewControllers(controllersToPop: Int, animated: Bool) {
        if viewControllers.count > controllersToPop {
            popToViewController(viewControllers[viewControllers.count - (controllersToPop + 1)], animated: animated)
        } else {
            print("Trying to pop \(controllersToPop) view controllers but navigation controller contains only \(viewControllers.count) controllers in stack")
        }
    }
}


extension UINavigationController {
    
    public func presentTransparentNavigationBar() {
        navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationBar.isTranslucent = true
        navigationBar.shadowImage = UIImage()
        setNavigationBarHidden(false, animated:true)
    }
    
    public func hideTransparentNavigationBar() {
        setNavigationBarHidden(true, animated:false)
        navigationBar.setBackgroundImage(UINavigationBar.appearance().backgroundImage(for: UIBarMetrics.default), for:.default)
        navigationBar.isTranslucent = UINavigationBar.appearance().isTranslucent
        navigationBar.shadowImage = UINavigationBar.appearance().shadowImage
    }
}
