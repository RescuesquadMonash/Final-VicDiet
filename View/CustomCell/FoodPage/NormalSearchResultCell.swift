//
//  MatchingCell.swift
//  VicDiet
//
//  Created by Ming Yang on 13/5/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class NormalSearchResultCell: UITableViewCell {
    
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
    let foodImageView: UIImageView = {
        let foodImageView = UIImageView()
        foodImageView.image = UIImage(named: "icon_food")
        return foodImageView
    }()
    let foodNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
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
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupData(foodName: String,foodDetail:String){
        
        foodNameLabel.text = "\(foodName)"
        foodDetailLabel.text = "\(foodDetail)"
    }
    
    func setupViews(){
        addSubview(foodImageView)
        foodImageView.translatesAutoresizingMaskIntoConstraints = false
        foodImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7).isActive = true
        foodImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        foodImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        foodImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.14).isActive = true
        
        
        addSubview(foodNameLabel)
        foodNameLabel.translatesAutoresizingMaskIntoConstraints = false
        foodNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        foodNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        foodNameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        foodNameLabel.leadingAnchor.constraint(equalTo: foodImageView.trailingAnchor, constant: 0).isActive = true
        
        addSubview(foodDetailLabel)
        foodDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        foodDetailLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        foodDetailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        foodDetailLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        foodDetailLabel.leadingAnchor.constraint(equalTo: foodImageView.trailingAnchor, constant: 0).isActive = true
        
    }
    
}
