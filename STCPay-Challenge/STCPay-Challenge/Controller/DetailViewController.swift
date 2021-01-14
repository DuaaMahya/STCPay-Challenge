//
//  DetailViewController.swift
//  STCPay-Challenge
//
//  Created by Duaa on 01/06/1442 AH.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - Properties
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 9
        view.clipsToBounds = false
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowRadius = 7
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.backgroundColor = .white
        
        view.addSubview(senatorInfoStackView)
        senatorInfoStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        senatorInfoStackView.anchor(top: view.topAnchor,
                                    left: view.leftAnchor,
                                    right: view.rightAnchor,
                                    paddingTop: 63)
        
        
        view.addSubview(senatorRoleNTeamStackView)
        senatorRoleNTeamStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        senatorRoleNTeamStackView.anchor(top: senatorInfoStackView.bottomAnchor,
                                         left: view.leftAnchor,
                                         right: view.rightAnchor,
                                         paddingTop: 30,
                                         paddingLeft: 10,
                                         paddingRight: 10)
        
        view.addSubview(imagesStackView)
        imagesStackView.anchor(top: senatorRoleNTeamStackView.bottomAnchor,
                                         left: view.leftAnchor,
                                         right: view.rightAnchor,
                                         paddingTop: 30,
                                         paddingLeft: 30,
                                         paddingRight: 30,
                                         height: 70)
        
        
        
        return view
    }()
    
    lazy var senatorInfoStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        
        stack.addArrangedSubview(nameLabel)
        stack.addArrangedSubview(linkLabel)
        
        return  stack
    }()
    
    lazy var senatorRoleStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        
        stack.addArrangedSubview(bioGuideIDLabel)
        stack.addArrangedSubview(senatorBioGuideIDLabel)
        
        return  stack
    }()
    
    
    lazy var senatorTeamStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        
        stack.addArrangedSubview(teamLabel)
        stack.addArrangedSubview(senatorTeamLabel)
        
        return  stack
    }()
    
    lazy var senatorRoleNTeamStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        
        stack.addArrangedSubview(senatorRoleStackView)
        stack.addArrangedSubview(senatorTeamStackView)
        
        return  stack
    }()
    
    lazy var imagesStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        
        var image1 = UIImageView()
        image1.image = #imageLiteral(resourceName: "cc0bbb38-6072-4711-bff3-d6e0ac3d7eb2")
        image1.layer.cornerRadius = 50/2
        var image2 = UIImageView()
        image2.image = #imageLiteral(resourceName: "53cc0ead-6a10-4f89-8e6d-a441d097e2bc")
        image2.layer.cornerRadius = 50/2
        var image3 = UIImageView()
        image3.image = #imageLiteral(resourceName: "06aa4e48-ee38-40c5-9e83-1f18ef657852")
        image3.layer.cornerRadius = 50/2

        image1.anchor(width: 50, height: 50)
        image2.anchor(width: 50, height: 50)
        image2.anchor(width: 50, height: 50)
        
        stack.addArrangedSubview(image1)
        stack.addArrangedSubview(image2)
        stack.addArrangedSubview(image3)

        return  stack
    }()
    
    lazy var detailedInfoStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        
        stack.addArrangedSubview(addressLabel)
        stack.addArrangedSubview(officeLabel)
        stack.addArrangedSubview(birthdayLabel)
        stack.addArrangedSubview(enddateLabel)
        stack.addArrangedSubview(genderLabel)
        stack.addArrangedSubview(sortNameLabel)
        stack.addArrangedSubview(websiteLabel)
        stack.addArrangedSubview(phoneLabel)
        
        return  stack
    }()
    
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
        label.text = "name"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor(named: "Donna Hicks label")
        label.textAlignment = .center
        return label
    }()
    
    let linkLabel: UILabel = {
        let label = UILabel()
        label.text = "link"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = UIColor(named: "Address label")
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let bioGuideIDLabel: UILabel = {
        let label = UILabel()
        label.text = "Bio Guide ID"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(named: "Address label")
        label.textAlignment = .center
        return label
    }()
    
    let teamLabel: UILabel = {
        let label = UILabel()
        label.text = "Team"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor(named: "Address label")
        label.textAlignment = .center
        return label
    }()
    
    let senatorTeamLabel: UILabel = {
        let label = UILabel()
        label.text = "Kindom Centre"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor(named: "Donna Hicks label")
        label.textAlignment = .right
        return label
    }()
    
    let senatorBioGuideIDLabel: UILabel = {
        let label = UILabel()
        label.text = "Kindom Centre"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor(named: "Donna Hicks label")
        label.textAlignment = .right
        return label
    }()
    
    
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Kindom Centre"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor(named: "Address label")
        label.textAlignment = .left
        return label
    }()
    
    let officeLabel: UILabel = {
        let label = UILabel()
        label.text = "Kindom Centre"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor(named: "Address label")
        label.textAlignment = .left
        return label
    }()
    
    let birthdayLabel: UILabel = {
        let label = UILabel()
        label.text = "Kindom Centre"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor(named: "Address label")
        label.textAlignment = .left
        return label
    }()
    
    let enddateLabel: UILabel = {
        let label = UILabel()
        label.text = "Kindom Centre"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor(named: "Address label")
        label.textAlignment = .left
        return label
    }()
    
    let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Kindom Centre"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor(named: "Address label")
        label.textAlignment = .left
        return label
    }()
    
    let sortNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Kindom Centre"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor(named: "Address label")
        label.textAlignment = .left
        return label
    }()
    
    let websiteLabel: UILabel = {
        let label = UILabel()
        label.text = "Kindom Centre"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor(named: "Address label")
        label.textAlignment = .left
        return label
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Kindom Centre"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor(named: "Address label")
        label.textAlignment = .left
        return label
    }()

    //MARK: - Override
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "Screen Background Color")
        
        view.addSubview(containerView)
        containerView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                             left: view.leftAnchor,
                             right: view.leftAnchor,
                             paddingTop: 70,
                             paddingLeft: 20,
                             paddingRight: 20,
                             width: view.frame.size.width - 40,
                             height: 300)
        
        view.addSubview(profileImage)
        profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImage.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                            paddingTop: 10,
                            width: 100,
                            height: 100)
        
        profileImage.layer.cornerRadius = 100/2
        
        view.addSubview(detailedInfoStackView)
        detailedInfoStackView.anchor(top: containerView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
    }
    


}
