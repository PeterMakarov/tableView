//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Петр Макаров on 09.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    let profile: UILabel = {
        let profile = UILabel(frame: CGRect(x: 155, y: 57, width: 100, height: 100))
        profile.font = UIFont.boldSystemFont(ofSize: 18)
        profile.text = "Profile"
        return profile
    }()
    
    let workingScreen: UIImageView = {
       let workingscreen = UIImageView(frame: CGRect(x: 0, y: 80, width: 600, height: 730))
        workingscreen.backgroundColor = .lightGray
        return workingscreen
    }()
    
    
    
    let catView: UIImageView = {
        let catView = UIImageView(frame: CGRect(x: 16, y: 120, width: 100, height: 100))
        catView.image = UIImage(named: "cat")
        catView.layer.borderWidth = 3
        catView.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1).cgColor
        catView.layer.cornerRadius = 50
        catView.contentMode = .scaleAspectFill
        catView.clipsToBounds = true
        return catView
    }()
    
    let heading: UILabel = {
        let heading = UILabel(frame: CGRect(x: 155, y: 87, width: 100, height: 100))
        heading.font = UIFont.boldSystemFont(ofSize: 18)
        heading.text = "Hipster cat"
        return heading
    }()
    
    let showStatus: UIImageView = {
        let showStatus = UIImageView(frame: CGRect(x: 16, y: 236, width: 390, height: 60))
        showStatus.layer.cornerRadius = 4
        showStatus.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatus.layer.shadowOpacity = 1.0
        showStatus.layer.shadowColor = UIColor.black.cgColor
        showStatus.backgroundColor = .blue
        return showStatus
    }()
    
    
    

    override func viewWillLayoutSubviews() {
        view.backgroundColor = .white
        view.addSubview(profile)
        view.addSubview(workingScreen)
        let maket = ProfileHeaderView(frame: view.frame)
        view.addSubview(maket)
        view.addSubview(catView)
        view.addSubview(heading)
        view.addSubview(showStatus)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewWillLayoutSubviews()
    }

}
