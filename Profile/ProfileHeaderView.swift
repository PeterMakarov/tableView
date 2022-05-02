//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Петр Макаров on 09.04.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    let profile: UILabel = {
        let profile = UILabel(frame: CGRect(x: 175, y: 25, width: 70, height: 70))
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
    
    
    func viewProfile() {
        addSubview(profile)
        addSubview(workingScreen)
        addSubview(catView)
    }
}
