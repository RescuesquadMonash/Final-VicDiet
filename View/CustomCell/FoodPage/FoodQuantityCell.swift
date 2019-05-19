//
//  FoodQuantityCell.swift
//  VicDiet
//
//  Created by Ming Yang on 26/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class FoodQuantityCell: UITableViewCell {

    let inputTextField: LogInTextField = {
        let textField = LogInTextField()
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    let gramLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.textAlignment = .center
        label.text = "serves"
        label.font =  UIFont.systemFont(ofSize: 14)
        label.backgroundColor = .clear
        label.textAlignment = .center
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let quantityLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.text = "Quantity"
        label.font =  UIFont.systemFont(ofSize: 16)
        label.backgroundColor = .clear
        label.textAlignment = .center
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let quantitySelection : UISegmentedControl = {
        let quantityS = UISegmentedControl(items: ["serves","grams"])
        quantityS.selectedSegmentIndex = 0
        quantityS.layer.cornerRadius = 5.0
        return quantityS
    }()
    
    let inputConsoleView = UIView()
    
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
        addSubview(quantityLabel)
        addSubview(inputTextField)
        addSubview(gramLabel)
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        inputTextField.translatesAutoresizingMaskIntoConstraints = false
        gramLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            quantityLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            quantityLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            quantityLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2),
            quantityLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8)
            ])
        
        NSLayoutConstraint.activate([
            inputTextField.leftAnchor.constraint(equalTo: quantityLabel.rightAnchor, constant: frame.width*0.15),
            inputTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            inputTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            inputTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4)
            ])
        NSLayoutConstraint.activate([
            gramLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            gramLabel.centerYAnchor.constraint(equalTo: inputTextField.centerYAnchor, constant: 0),
            gramLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            gramLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8)
            ])
        
        
        
    }
    
    
    
    
}
