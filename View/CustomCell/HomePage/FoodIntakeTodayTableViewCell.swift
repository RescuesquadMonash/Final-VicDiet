//
//  FoodIntakeTodayTableViewCell.swift
//  VicDiet
//
//  Created by Ming Yang on 17/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class FoodIntakeTodayTableViewCell: UITableViewCell {

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
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    let foodDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.textAlignment = .left
        label.text = "FoodDescription"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    let foodWeightLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .right
        label.text = "100g"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
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
        setupCellView()
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellView(){
        backgroundColor = .white
        
        self.contentView.addSubview(foodImageView)
        foodImageView.translatesAutoresizingMaskIntoConstraints = false
        foodImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        foodImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        foodImageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.25).isActive = true
        foodImageView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.7).isActive = true
        self.contentView.addSubview(foodNameLabel)
        foodNameLabel.translatesAutoresizingMaskIntoConstraints = false
        foodNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        foodNameLabel.leadingAnchor.constraint(equalTo: foodImageView.trailingAnchor).isActive = true
        foodNameLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.48).isActive = true
        foodNameLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.6).isActive = true
        self.contentView.addSubview(foodDescriptionLabel)
        foodDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        foodDescriptionLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        foodDescriptionLabel.leadingAnchor.constraint(equalTo: self.foodImageView.trailingAnchor).isActive = true
        foodDescriptionLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.48).isActive = true
        foodDescriptionLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.4).isActive = true
        self.contentView.addSubview(foodWeightLabel)
        foodWeightLabel.translatesAutoresizingMaskIntoConstraints = false
        foodWeightLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 0).isActive = true
        foodWeightLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -self.contentView.frame.width*0.02).isActive = true
        foodWeightLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.6).isActive = true
        foodWeightLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.25).isActive = true
    }
}
