//
//  FoodEveryDayIntakePercentageCell.swift
//  VicDiet
//
//  Created by Ming Yang on 26/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class SubstituteResultCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource{

    var substituteFifthController:SubstituteFifthController?
    var homePageController: HomePageController?
//    let foodLabelOld: UILabel = {
//        let label = UILabel()
//        label.textColor = UIColor.black
//        label.textAlignment = .center
//        label.text = "Old Food"
//        label.font =  UIFont.boldSystemFont(ofSize: 18)
//        label.backgroundColor = .clear
//        label.textAlignment = .center
//        label.backgroundColor = .white
//        label.numberOfLines = 0
//        label.lineBreakMode = .byWordWrapping
//        return label
//    }()
//    let foodLabelNew: UILabel = {
//        let label = UILabel()
//        label.textColor = UIColor.black
//        label.textAlignment = .center
//        label.text = "New Food"
//        label.font =  UIFont.boldSystemFont(ofSize: 18)
//        label.backgroundColor = .clear
//        label.textAlignment = .center
//        label.backgroundColor = .white
//        label.numberOfLines = 0
//        label.lineBreakMode = .byWordWrapping
//        return label
//    }()
    
    let foodLabelOld: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "150g", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 25)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\nFood Name", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    let foodLabelNew: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "150g", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 25)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\nFood Name", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    lazy var tableView0: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        return tv
        
    }()
    lazy var tableView1: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        return tv
        
    }()

    let nutrientOverviewProtein: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "150", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\nProtein", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    let nutrientOverviewCalcium: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "150", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\nCalcium", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    let nutrientOverviewFat: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "150", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\nFat", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    let nutrientOverviewSodium: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "150", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\nSodium", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    let nutrientOverviewVitaminC: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "150", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\nVitaminC", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    let nutrientOverviewVitaminA: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "150", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\nVitaminA", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()

    
    let nutrientOverviewProteinNew: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "150", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\nProtein", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    let nutrientOverviewCalciumNew: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "150", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\nCalcium", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    let nutrientOverviewFatNew: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "150", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\nFat", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    let nutrientOverviewSodiumNew: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "150", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\nSodium", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    let nutrientOverviewVitaminCNew: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "150", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\nVitaminC", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    let nutrientOverviewVitaminANew: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "150", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\nVitaminA", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
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

        tableView0.register(UITableViewCell.self, forCellReuseIdentifier: "cellId00")
        tableView0.register(UITableViewCell.self, forCellReuseIdentifier: "cellId01")
        tableView0.register(UITableViewCell.self, forCellReuseIdentifier: "cellId02")
        tableView0.register(UITableViewCell.self, forCellReuseIdentifier: "cellId03")
        tableView0.register(UITableViewCell.self, forCellReuseIdentifier: "cellId04")
        tableView0.register(UITableViewCell.self, forCellReuseIdentifier: "cellId05")
        self.tableView0.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        
        tableView1.register(UITableViewCell.self, forCellReuseIdentifier: "cellId10")
        tableView1.register(UITableViewCell.self, forCellReuseIdentifier: "cellId11")
        tableView1.register(UITableViewCell.self, forCellReuseIdentifier: "cellId12")
        tableView1.register(UITableViewCell.self, forCellReuseIdentifier: "cellId13")
        tableView1.register(UITableViewCell.self, forCellReuseIdentifier: "cellId14")
        tableView1.register(UITableViewCell.self, forCellReuseIdentifier: "cellId15")
        self.tableView1.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        
        setupLeftSideData(protein: 0, calcium: 0, fat: 0, sodium: 0, vitaminC: 0, vitaminA: 0)
        setupRightSideData(protein: 0, calcium: 0, fat: 0, sodium: 0, vitaminC: 0, vitaminA: 0)
        setupViews()
    }
    
    func setupSubTitle(oldQuantity: Double,oldName: String, newQuantity: Double,newName:String){
        let physicalAttributedText0 = NSMutableAttributedString(string: "\(String(format: "%.1f\n\("Grams")", oldQuantity))", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22)])
        physicalAttributedText0.append(NSMutableAttributedString(string: "\n\(oldName)", attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        foodLabelOld.attributedText = physicalAttributedText0
        foodLabelOld.textAlignment = .center
        
        let physicalAttributedText1 = NSMutableAttributedString(string: "\(String(format: "%.1f\n\("Grams")", newQuantity))", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22)])
        physicalAttributedText1.append(NSMutableAttributedString(string: "\n\(newName)", attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        foodLabelNew.attributedText = physicalAttributedText1
        foodLabelNew.textAlignment = .center
    }
    
    
    func setupLeftSideData(protein: Double,calcium: Double, fat: Double, sodium: Double, vitaminC:Double, vitaminA: Double){
        let physicalAttributedText0 = NSMutableAttributedString(string: "\(String(format: "%.1f\("g")", protein))", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        physicalAttributedText0.append(NSMutableAttributedString(string: "\nProtein", attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        nutrientOverviewProtein.attributedText = physicalAttributedText0
        nutrientOverviewProtein.textAlignment = .center
        
        let physicalAttributedText1 = NSMutableAttributedString(string: "\(String(format: "%.1f\("mg")", calcium))", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        physicalAttributedText1.append(NSMutableAttributedString(string: "\nCalcium", attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        nutrientOverviewCalcium.attributedText = physicalAttributedText1
        nutrientOverviewCalcium.textAlignment = .center
        
        let physicalAttributedText2 = NSMutableAttributedString(string: "\(String(format: "%.1f\("g")", fat))", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        physicalAttributedText2.append(NSMutableAttributedString(string: "\nFat", attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        nutrientOverviewFat.attributedText = physicalAttributedText2
        nutrientOverviewFat.textAlignment = .center
        
        let physicalAttributedText3 = NSMutableAttributedString(string: "\(String(format: "%.1f\("mg")", sodium))", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        physicalAttributedText3.append(NSMutableAttributedString(string: "\nSodium", attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        nutrientOverviewSodium.attributedText = physicalAttributedText3
        nutrientOverviewSodium.textAlignment = .center
        
        let physicalAttributedText4 = NSMutableAttributedString(string: "\(String(format: "%.1f\("mg")", vitaminC))", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        physicalAttributedText4.append(NSMutableAttributedString(string: "\nVitaminC", attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        nutrientOverviewVitaminC.attributedText = physicalAttributedText4
        nutrientOverviewVitaminC.textAlignment = .center
        
        let physicalAttributedText5 = NSMutableAttributedString(string: "\(String(format: "%.1f\("µg")", vitaminA))", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        physicalAttributedText5.append(NSMutableAttributedString(string: "\nVitaminA", attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        nutrientOverviewVitaminA.attributedText = physicalAttributedText5
        nutrientOverviewVitaminA.textAlignment = .center
        
    }
    func setupRightSideData(protein: Double,calcium: Double, fat: Double, sodium: Double, vitaminC:Double, vitaminA: Double){
        let physicalAttributedText0 = NSMutableAttributedString(string: "\(String(format: "%.1f\("g")", protein))", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        physicalAttributedText0.append(NSMutableAttributedString(string: "\nProtein", attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        nutrientOverviewProteinNew.attributedText = physicalAttributedText0
        nutrientOverviewProteinNew.textAlignment = .center
        
        let physicalAttributedText1 = NSMutableAttributedString(string: "\(String(format: "%.1f\("mg")", calcium))", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        physicalAttributedText1.append(NSMutableAttributedString(string: "\nCalcium", attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        nutrientOverviewCalciumNew.attributedText = physicalAttributedText1
        nutrientOverviewCalciumNew.textAlignment = .center
        
        let physicalAttributedText2 = NSMutableAttributedString(string: "\(String(format: "%.1f\("g")", fat))", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        physicalAttributedText2.append(NSMutableAttributedString(string: "\nFat", attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        nutrientOverviewFatNew.attributedText = physicalAttributedText2
        nutrientOverviewFatNew.textAlignment = .center
        
        let physicalAttributedText3 = NSMutableAttributedString(string: "\(String(format: "%.1f\("mg")", sodium))", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        physicalAttributedText3.append(NSMutableAttributedString(string: "\nSodium", attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        nutrientOverviewSodiumNew.attributedText = physicalAttributedText3
        nutrientOverviewSodiumNew.textAlignment = .center
        
        let physicalAttributedText4 = NSMutableAttributedString(string: "\(String(format: "%.1f\("mg")", vitaminC))", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        physicalAttributedText4.append(NSMutableAttributedString(string: "\nVitaminC", attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        nutrientOverviewVitaminCNew.attributedText = physicalAttributedText4
        nutrientOverviewVitaminCNew.textAlignment = .center
        
        let physicalAttributedText5 = NSMutableAttributedString(string: "\(String(format: "%.1f\("µg")", vitaminA))", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        physicalAttributedText5.append(NSMutableAttributedString(string: "\nVitaminA", attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        nutrientOverviewVitaminANew.attributedText = physicalAttributedText5
        nutrientOverviewVitaminANew.textAlignment = .center
        
    }

    func setupViews(){
        
        addSubview(foodLabelOld)
        foodLabelOld.translatesAutoresizingMaskIntoConstraints = false
        foodLabelOld.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        foodLabelOld.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        foodLabelOld.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        foodLabelOld.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        addSubview(foodLabelNew)
        foodLabelNew.translatesAutoresizingMaskIntoConstraints = false
        foodLabelNew.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        foodLabelNew.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        foodLabelNew.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        foodLabelNew.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
        
        addSubview(tableView0)
        tableView0.translatesAutoresizingMaskIntoConstraints = false
        tableView0.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7).isActive = true
        tableView0.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView0.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        tableView0.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(tableView1)
        tableView1.translatesAutoresizingMaskIntoConstraints = false
        tableView1.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7).isActive = true
        tableView1.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView1.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        tableView1.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableView0{
            return 6
        }else{
            return 6
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableView0{
            if indexPath.row == 0{
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId00")
                
                cell.addSubview(nutrientOverviewProtein)
                nutrientOverviewProtein.translatesAutoresizingMaskIntoConstraints = false
                nutrientOverviewProtein.centerXAnchor.constraint(equalTo: cell.centerXAnchor, constant: 0).isActive = true
                nutrientOverviewProtein.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
                nutrientOverviewProtein.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 1).isActive = true
                nutrientOverviewProtein.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 1).isActive = true
                return cell
            }
            if indexPath.row == 1{
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId01")
                
                cell.addSubview(nutrientOverviewCalcium)
                nutrientOverviewCalcium.translatesAutoresizingMaskIntoConstraints = false
                nutrientOverviewCalcium.centerXAnchor.constraint(equalTo: cell.centerXAnchor, constant: 0).isActive = true
                nutrientOverviewCalcium.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
                nutrientOverviewCalcium.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 1).isActive = true
                nutrientOverviewCalcium.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 1).isActive = true
                return cell
            }
            if indexPath.row == 2 {
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId02")
                
                cell.addSubview(nutrientOverviewFat)
                nutrientOverviewFat.translatesAutoresizingMaskIntoConstraints = false
                nutrientOverviewFat.centerXAnchor.constraint(equalTo: cell.centerXAnchor, constant: 0).isActive = true
                nutrientOverviewFat.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
                nutrientOverviewFat.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 1).isActive = true
                nutrientOverviewFat.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 1).isActive = true
                return cell
            }
            if indexPath.row == 3 {
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId03")
                
                cell.addSubview(nutrientOverviewSodium)
                nutrientOverviewSodium.translatesAutoresizingMaskIntoConstraints = false
                nutrientOverviewSodium.centerXAnchor.constraint(equalTo: cell.centerXAnchor, constant: 0).isActive = true
                nutrientOverviewSodium.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
                nutrientOverviewSodium.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 1).isActive = true
                nutrientOverviewSodium.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 1).isActive = true
                return cell
            }
            if indexPath.row == 4 {
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId04")
                
                cell.addSubview(nutrientOverviewVitaminC)
                nutrientOverviewVitaminC.translatesAutoresizingMaskIntoConstraints = false
                nutrientOverviewVitaminC.centerXAnchor.constraint(equalTo: cell.centerXAnchor, constant: 0).isActive = true
                nutrientOverviewVitaminC.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
                nutrientOverviewVitaminC.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 1).isActive = true
                nutrientOverviewVitaminC.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 1).isActive = true
                return cell
            }else{
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId05")
                
                cell.addSubview(nutrientOverviewVitaminA)
                nutrientOverviewVitaminA.translatesAutoresizingMaskIntoConstraints = false
                nutrientOverviewVitaminA.centerXAnchor.constraint(equalTo: cell.centerXAnchor, constant: 0).isActive = true
                nutrientOverviewVitaminA.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
                nutrientOverviewVitaminA.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 1).isActive = true
                nutrientOverviewVitaminA.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 1).isActive = true
                return cell
            }
            
        }else{
            if indexPath.row == 0{
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId10")
                
                cell.addSubview(nutrientOverviewProteinNew)
                nutrientOverviewProteinNew.translatesAutoresizingMaskIntoConstraints = false
                nutrientOverviewProteinNew.centerXAnchor.constraint(equalTo: cell.centerXAnchor, constant: 0).isActive = true
                nutrientOverviewProteinNew.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
                nutrientOverviewProteinNew.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 1).isActive = true
                nutrientOverviewProteinNew.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 1).isActive = true
                return cell
            }
            if indexPath.row == 1{
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId11")
                
                cell.addSubview(nutrientOverviewCalciumNew)
                nutrientOverviewCalciumNew.translatesAutoresizingMaskIntoConstraints = false
                nutrientOverviewCalciumNew.centerXAnchor.constraint(equalTo: cell.centerXAnchor, constant: 0).isActive = true
                nutrientOverviewCalciumNew.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
                nutrientOverviewCalciumNew.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 1).isActive = true
                nutrientOverviewCalciumNew.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 1).isActive = true
                return cell
            }
            if indexPath.row == 2 {
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId12")
                
                cell.addSubview(nutrientOverviewFatNew)
                nutrientOverviewFatNew.translatesAutoresizingMaskIntoConstraints = false
                nutrientOverviewFatNew.centerXAnchor.constraint(equalTo: cell.centerXAnchor, constant: 0).isActive = true
                nutrientOverviewFatNew.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
                nutrientOverviewFatNew.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 1).isActive = true
                nutrientOverviewFatNew.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 1).isActive = true
                return cell
            }
            if indexPath.row == 3 {
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId13")
                
                cell.addSubview(nutrientOverviewSodiumNew)
                nutrientOverviewSodiumNew.translatesAutoresizingMaskIntoConstraints = false
                nutrientOverviewSodiumNew.centerXAnchor.constraint(equalTo: cell.centerXAnchor, constant: 0).isActive = true
                nutrientOverviewSodiumNew.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
                nutrientOverviewSodiumNew.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 1).isActive = true
                nutrientOverviewSodiumNew.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 1).isActive = true
                return cell
            }
            if indexPath.row == 4 {
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId14")
                
                cell.addSubview(nutrientOverviewVitaminCNew)
                nutrientOverviewVitaminCNew.translatesAutoresizingMaskIntoConstraints = false
                nutrientOverviewVitaminCNew.centerXAnchor.constraint(equalTo: cell.centerXAnchor, constant: 0).isActive = true
                nutrientOverviewVitaminCNew.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
                nutrientOverviewVitaminCNew.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 1).isActive = true
                nutrientOverviewVitaminCNew.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 1).isActive = true
                return cell
            }else{
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId15")
                
                cell.addSubview(nutrientOverviewVitaminANew)
                nutrientOverviewVitaminANew.translatesAutoresizingMaskIntoConstraints = false
                nutrientOverviewVitaminANew.centerXAnchor.constraint(equalTo: cell.centerXAnchor, constant: 0).isActive = true
                nutrientOverviewVitaminANew.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
                nutrientOverviewVitaminANew.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 1).isActive = true
                nutrientOverviewVitaminANew.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 1).isActive = true
                return cell
            }
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == tableView0{
            return 1
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == tableView0{
            return tableView.frame.height/6
        }else{
            return tableView.frame.height/6
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

