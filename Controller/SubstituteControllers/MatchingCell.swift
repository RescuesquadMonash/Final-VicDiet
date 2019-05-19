//
//  MatchingCell.swift
//  VicDiet
//
//  Created by Ming Yang on 13/5/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class MatchingCell: UITableViewCell {
    
    var substituteForthController:SubstituteForthController?
    var homePageController: HomePageController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    let matchNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 66/255, green: 134/255, blue: 244/255, alpha: 1)
        label.textAlignment = .center
        label.text = "80%"
        label.font = label.font.withSize(17)
        return label
    }()
    let foodNameLabel: UILabel = {
        let label = UILabel()
        //label.textColor = UIColor(red: 255/255, green: 199/255, blue: 116/255, alpha: 1)
        label.textColor = UIColor(red: 55/255, green: 59/255, blue: 68/255, alpha: 1)
        label.textAlignment = .left
        label.text = "FoodName"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    let foodDetailLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.textAlignment = .left
        label.text = "FoodDetail"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
      
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupData(matchNumber: Double,foodName: String,foodDetail:String){
        matchNumberLabel.text = "\(String(format: "%.1f", matchNumber))%"
        foodNameLabel.text = "\(foodName)"
        foodDetailLabel.text = "\(foodDetail)"
    }
    
    func setupViews(){
        addSubview(matchNumberLabel)
        matchNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        matchNumberLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        matchNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        matchNumberLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        matchNumberLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2).isActive = true
        
        
        addSubview(foodNameLabel)
        foodNameLabel.translatesAutoresizingMaskIntoConstraints = false
        foodNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        foodNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        foodNameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        foodNameLabel.leadingAnchor.constraint(equalTo: matchNumberLabel.trailingAnchor, constant: 0).isActive = true
        
        addSubview(foodDetailLabel)
        foodDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        foodDetailLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        foodDetailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        foodDetailLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        foodDetailLabel.leadingAnchor.constraint(equalTo: matchNumberLabel.trailingAnchor, constant: 0).isActive = true
        
    }
    
}
