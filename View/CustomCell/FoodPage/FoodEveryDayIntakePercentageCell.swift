//
//  FoodEveryDayIntakePercentageCell.swift
//  VicDiet
//
//  Created by Ming Yang on 26/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class FoodEveryDayIntakePercentageCell: UITableViewCell{

    
    var foodDetailForMealTableViewController: FoodDetailForMealTableViewController?
    var foodDetailTableViewController: FoodDetailTableViewController?
    var homePageController: HomePageController?
    
    let FoodEveryDayPercentageLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.text = "Percentage of requirement"
        label.font =  UIFont.systemFont(ofSize: 17)
        label.backgroundColor = .clear
        label.textAlignment = .left
        
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    let flagLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.textAlignment = .center
        label.text = "1 serve ( = 100 grams)"
        label.font =  UIFont.systemFont(ofSize: 13)
        label.backgroundColor = .clear
        label.textAlignment = .left
        
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    lazy var collectionViewNested: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        
        collectionViewNested.register(NutrientProgressInFoodCell.self, forCellWithReuseIdentifier: "NutrientProgressInFoodCell0")
        collectionViewNested.register(NutrientProgressInFoodCell.self, forCellWithReuseIdentifier: "NutrientProgressInFoodCell1")
        collectionViewNested.register(NutrientProgressInFoodCell.self, forCellWithReuseIdentifier: "NutrientProgressInFoodCell2")
        collectionViewNested.register(NutrientProgressInFoodCell.self, forCellWithReuseIdentifier: "NutrientProgressInFoodCell3")
        collectionViewNested.register(NutrientProgressInFoodCell.self, forCellWithReuseIdentifier: "NutrientProgressInFoodCell4")
        collectionViewNested.register(NutrientProgressInFoodCell.self, forCellWithReuseIdentifier: "NutrientProgressInFoodCell5")
        
        setupCellView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCellView(){
        addSubview(collectionViewNested)
        collectionViewNested.translatesAutoresizingMaskIntoConstraints = false
        collectionViewNested.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.82).isActive = true
        collectionViewNested.leadingAnchor.constraint(equalTo: leadingAnchor, constant: frame.width*0.01).isActive = true
        collectionViewNested.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -frame.width*0.01).isActive = true
        collectionViewNested.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(flagLabel)
        flagLabel.translatesAutoresizingMaskIntoConstraints = false
        flagLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.07).isActive = true
        flagLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        flagLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        flagLabel.bottomAnchor.constraint(equalTo: collectionViewNested.topAnchor).isActive = true
        
        addSubview(FoodEveryDayPercentageLabel)
        FoodEveryDayPercentageLabel.translatesAutoresizingMaskIntoConstraints = false
        FoodEveryDayPercentageLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.13).isActive = true
        FoodEveryDayPercentageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        FoodEveryDayPercentageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        FoodEveryDayPercentageLabel.bottomAnchor.constraint(equalTo: flagLabel.topAnchor).isActive = true
    }
    
    
    
}

extension FoodEveryDayIntakePercentageCell: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if foodDetailForMealTableViewController != nil{
            if indexPath.item == 0{
                let progress = Float((self.foodDetailForMealTableViewController?.selectedFoodObject?.protein.doubleValue)!/Double(truncating: self.homePageController!.targetPersonGroupList[0].protein))
                let cell = setupSectionThreeCell(collectionView: collectionView, indexPath: indexPath, cellProgressLabel: "Protein", progress: progress, identifier: "NutrientProgressInFoodCell0")
                return cell
            }
            if indexPath.item == 1{
                let progress = Float((self.foodDetailForMealTableViewController?.selectedFoodObject?.calcium.doubleValue)!/Double(truncating: self.homePageController!.targetPersonGroupList[0].calcium))
                let cell = setupSectionThreeCell(collectionView: collectionView, indexPath: indexPath, cellProgressLabel: "Calcium", progress: progress, identifier: "NutrientProgressInFoodCell1")
                return cell
            }
            if indexPath.item == 2{
                let progress = Float((self.foodDetailForMealTableViewController?.selectedFoodObject?.totalFat.doubleValue)!/Double(truncating: self.homePageController!.targetPersonGroupList[0].totalFat))
                let cell = setupSectionThreeCell(collectionView: collectionView, indexPath: indexPath, cellProgressLabel: "Fat", progress: progress, identifier: "NutrientProgressInFoodCell2")
                return cell
            }
            if indexPath.item == 3{
                let progress = Float((self.foodDetailForMealTableViewController?.selectedFoodObject?.sodium.doubleValue)!/Double(truncating: self.homePageController!.targetPersonGroupList[0].sodium))
                let cell = setupSectionThreeCell(collectionView: collectionView, indexPath: indexPath, cellProgressLabel: "Sodium", progress: progress, identifier: "NutrientProgressInFoodCell3")
                return cell
            }
            if indexPath.item == 4{
                let progress = Float((self.foodDetailForMealTableViewController?.selectedFoodObject?.vitaminC.doubleValue)!/Double(truncating: self.homePageController!.targetPersonGroupList[0].vitaminC))
                let cell = setupSectionThreeCell(collectionView: collectionView, indexPath: indexPath, cellProgressLabel: "VitaminC", progress: progress, identifier: "NutrientProgressInFoodCell4")
                return cell
            }else{
                let progress = Float((self.foodDetailForMealTableViewController?.selectedFoodObject?.vitaminA.doubleValue)!/Double(truncating: self.homePageController!.targetPersonGroupList[0].vitaminA))
                let cell = setupSectionThreeCell(collectionView: collectionView, indexPath: indexPath, cellProgressLabel: "VitaminA", progress: progress, identifier: "NutrientProgressInFoodCell5")
                return cell
            }
        }else{
            if indexPath.item == 0{
                let progress = Float((self.foodDetailTableViewController?.selectedFoodObject?.protein.doubleValue)!/Double(truncating: self.homePageController!.targetPersonGroupList[0].protein))
                let cell = setupSectionThreeCell(collectionView: collectionView, indexPath: indexPath, cellProgressLabel: "Protein", progress: progress, identifier: "NutrientProgressInFoodCell0")
                
                return cell
            }
            if indexPath.item == 1{
                let progress = Float((self.foodDetailTableViewController?.selectedFoodObject?.calcium.doubleValue)!/Double(truncating: self.homePageController!.targetPersonGroupList[0].calcium))
                let cell = setupSectionThreeCell(collectionView: collectionView, indexPath: indexPath, cellProgressLabel: "Calcium", progress: progress, identifier: "NutrientProgressInFoodCell1")
                return cell
            }
            if indexPath.item == 2{
                let progress = Float((self.foodDetailTableViewController?.selectedFoodObject?.totalFat.doubleValue)!/Double(truncating: self.homePageController!.targetPersonGroupList[0].totalFat))
                let cell = setupSectionThreeCell(collectionView: collectionView, indexPath: indexPath, cellProgressLabel: "Fat", progress: progress, identifier: "NutrientProgressInFoodCell2")
                return cell
            }
            if indexPath.item == 3{
                let progress = Float((self.foodDetailTableViewController?.selectedFoodObject?.sodium.doubleValue)!/Double(truncating: self.homePageController!.targetPersonGroupList[0].sodium))
                let cell = setupSectionThreeCell(collectionView: collectionView, indexPath: indexPath, cellProgressLabel: "Sodium", progress: progress, identifier: "NutrientProgressInFoodCell3")
                return cell
            }
            if indexPath.item == 4{
                let progress = Float((self.foodDetailTableViewController?.selectedFoodObject?.vitaminC.doubleValue)!/Double(truncating: self.homePageController!.targetPersonGroupList[0].vitaminC))
                let cell = setupSectionThreeCell(collectionView: collectionView, indexPath: indexPath, cellProgressLabel: "VitaminC", progress: progress, identifier: "NutrientProgressInFoodCell4")
                return cell
            }else{
                let progress = Float((self.foodDetailTableViewController?.selectedFoodObject?.vitaminA.doubleValue)!/Double(truncating: self.homePageController!.targetPersonGroupList[0].vitaminA))
                let cell = setupSectionThreeCell(collectionView: collectionView, indexPath: indexPath, cellProgressLabel: "VitaminA", progress: progress, identifier: "NutrientProgressInFoodCell5")
               
                return cell
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height/3)
    }
    
    func setupSectionThreeCell(collectionView: UICollectionView, indexPath: IndexPath, cellProgressLabel: String, progress: Float, identifier: String) -> (NutrientProgressInFoodCell){
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! NutrientProgressInFoodCell
        cell.middleKeyReferenceLabel.text = cellProgressLabel
        
        if progress > 1{
            cell.middleKeyLabel.backgroundColor = UIColor(red: 255/255, green: 99/255, blue: 71/255, alpha: 1)
            cell.progressView.progressTintColor = UIColor(red: 255/255, green: 99/255, blue: 71/255, alpha: 1)
        }
        if progress <= 1{
            cell.middleKeyLabel.text = "\(Double(Int(progress*1000))/10)%"
            cell.progressView.setProgress(progress, animated: true)
        }else{
            cell.middleKeyLabel.text = "\(Double(Int(progress*1000))/10)%"
            cell.progressView.setProgress(1, animated: true)
        }
        return cell 
    }
    
}
