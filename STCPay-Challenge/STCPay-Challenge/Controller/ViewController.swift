//
//  ViewController.swift
//  STCPay-Challenge
//
//  Created by Duaa on 01/06/1442 AH.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    
    var tableView = UITableView()
    var senators = [Object]()
    var manger = SenatorJsonManger()
    
    //MARK: - Override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        setupTableView()
        setupNav()
        
        manger.delegate = self
        manger.fetchLocalFile { (result) in
            print(result)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func setupNav() {
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    }
    
    //MARK: - Functions
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 200
        tableView.separatorColor = .clear
        tableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor(named: "Screen Background Color")
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }


}

//MARK: - Extensions

extension ViewController: jsonDelegate {
    
    func updateData(_ manger: SenatorJsonManger, senator: SenatorsResponse) {
        self.senators = senator.objects
        DispatchQueue.main.async {
            self.tableView.reloadData()
            
        }
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        senators.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContactTableViewCell
        let item = senators[indexPath.row]
        cell.profileImage.image = UIImage(named: item.party)
        cell.nameLabel.text = "\(item.person.firstname) \(item.person.lastname)"
        cell.partyLabel.text = item.party
        cell.descriptionLabel.text = item.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "DetailPage", bundle: nil)
        let dVC = storyboard.instantiateViewController(identifier: "DetailVC") as! DetailViewController
        let item = senators[indexPath.row]
        
        dVC.profileImage.image = UIImage(named: item.party)
        dVC.nameLabel.text = "\(item.person.firstname) \(item.person.lastname)"
        dVC.linkLabel.text = item.person.link
        dVC.senatorBioGuideIDLabel.text = item.person.bioguideid
        dVC.senatorTeamLabel.text = item.party
        dVC.addressLabel.text = item.extra.address
        dVC.officeLabel.text = item.extra.office
        dVC.birthdayLabel.text = item.person.birthday
        dVC.enddateLabel.text = item.enddate
        dVC.genderLabel.text = item.person.sortname
        dVC.websiteLabel.text = item.website
        dVC.phoneLabel.text = item.phone
        self.navigationController?.pushViewController(dVC, animated: true)
    }
    
}


