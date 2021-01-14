//
//  ContactTableViewCell.swift
//  STCPay-Challenge
//
//  Created by Duaa on 01/06/1442 AH.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    let profileImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 84, height: 66))
        image.image = #imageLiteral(resourceName: "06aa4e48-ee38-40c5-9e83-1f18ef657852")
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 9
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Kindom Centre"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor(named: "Donna Hicks label")
        return label
    }()
    
    let partyLabel: UILabel = {
        let label = UILabel()
        label.text = "Local Flavor"
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = UIColor(named: "Admin label")
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "open"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor(named: "Finance & Admin label")
        return label
    }()

    
    lazy var infoStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillEqually
        
        
        stack.addArrangedSubview(nameLabel)
        stack.addArrangedSubview(partyLabel)
        stack.addArrangedSubview(descriptionLabel)
        
        return stack
    }()
    
    lazy var backgroundColorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 9
        view.backgroundColor = UIColor.white
        view.clipsToBounds = false
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowRadius = 7
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        
        
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        addSubview(backgroundColorView)
        backgroundColorView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 18, paddingLeft: 20, paddingBottom: 18, paddingRight: 20, height: 100)
        
        addSubview(profileImage)
        profileImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImage.anchor(left: leftAnchor, paddingTop: 15, paddingLeft: 30, paddingBottom: 15, width:60, height: 60)
        profileImage.layer.cornerRadius = 60/2
        
        addSubview(infoStackView)
        infoStackView.anchor(top: topAnchor, left: profileImage.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 25, paddingLeft: 20, paddingBottom: 25, paddingRight: 20)
        
    }



}
