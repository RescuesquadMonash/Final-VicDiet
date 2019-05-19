//
//  FoodDetailCell.swift
//  VicDiet
//
//  Created by Ming Yang on 26/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class FoodDetailCell: UITableViewCell {
    let foodNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.text = "FoodName"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()

    let foodDetailLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.textAlignment = .center
        label.text = "Different ages in people will be very important to evalute your standard intake and health condition."
        label.font =  UIFont.systemFont(ofSize: 16)
        label.backgroundColor = .clear
        label.textAlignment = .left
        
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
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
        self.selectionStyle = .none
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupCell(){
//        addSubview(foodDetailLabel)
//        foodDetailLabel.translatesAutoresizingMaskIntoConstraints = false
//        foodDetailLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
//        foodDetailLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
//        foodDetailLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
//        foodDetailLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        
        
        
        
        addSubview(foodNameLabel)
        foodNameLabel.translatesAutoresizingMaskIntoConstraints = false
        foodNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        foodNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        foodNameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.55).isActive = true
        foodNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
        addSubview(foodDetailLabel)
        foodDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        foodDetailLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        foodDetailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        foodDetailLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.45).isActive = true
        foodDetailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    }
}
