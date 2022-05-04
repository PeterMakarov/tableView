//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Петр Макаров on 09.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileView: UIView = {
        let profileView = ProfileHeaderView()
        profileView.translatesAutoresizingMaskIntoConstraints = false
        return profileView
    }()
    
    private let workingScreen: UIImageView = {
        let workingscreen = UIImageView()
        workingscreen.backgroundColor = .lightGray
        workingscreen.translatesAutoresizingMaskIntoConstraints = false
        return workingscreen
    }()
    
    let newButtonDidPressed: UIButton = {
        let newButtonDidPressed = UIButton()
        newButtonDidPressed.setTitle("New Title", for: .normal)
        newButtonDidPressed.backgroundColor = .systemBlue
        newButtonDidPressed.layer.cornerRadius = 4
        newButtonDidPressed.translatesAutoresizingMaskIntoConstraints = false
        return newButtonDidPressed
    }()
    
    override func viewWillLayoutSubviews() {
        view.addSubview(newButtonDidPressed)
        
        NSLayoutConstraint.activate([
            newButtonDidPressed.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            newButtonDidPressed.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            newButtonDidPressed.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let profileView = ProfileHeaderView()
        view.addSubview(workingScreen)
        view.addSubview(profileView)
        profileView.frame = view.safeAreaLayoutGuide.layoutFrame
        profileView.viewProfile()
        
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            profileView.heightAnchor.constraint(equalToConstant: 220)
        ])
        
        NSLayoutConstraint.activate([
            workingScreen.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            workingScreen.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            workingScreen.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            workingScreen.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
}
