import UIKit

class HomePageMenuCell: UITableViewCell {
    
    let mealImageView: UIImageView = {
        let mealImageView = UIImageView()
        mealImageView.image = UIImage(named: "icon_meal_1")
        return mealImageView
    }()
    let mealNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.text = "MealName"
        label.font = UIFont(name: "Verdana", size: 15)
        return label
    }()

    let mealImageAccessoryView: UIImageView = {
        let mealImageView = UIImageView()
        mealImageView.image = UIImage(named: "icon_forward")
        return mealImageView
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
        setupCellView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
 
    }
    
    func setupCellView(){
        backgroundColor = .white
        
        self.addSubview(mealImageView)
        mealImageView.translatesAutoresizingMaskIntoConstraints = false
        mealImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        mealImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        mealImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25).isActive = true
        mealImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8).isActive = true

        self.addSubview(mealNameLabel)
        mealNameLabel.translatesAutoresizingMaskIntoConstraints = false
        mealNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        mealNameLabel.leadingAnchor.constraint(equalTo: mealImageView.trailingAnchor, constant: 0).isActive = true
        mealNameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        mealNameLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8).isActive = true

        self.addSubview(mealImageAccessoryView)
        mealImageAccessoryView.translatesAutoresizingMaskIntoConstraints = false
        mealImageAccessoryView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        mealImageAccessoryView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -self.frame.width*0.1).isActive = true
        mealImageAccessoryView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.22).isActive = true
        mealImageAccessoryView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.05).isActive = true
    }
}
