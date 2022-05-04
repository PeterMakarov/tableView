//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Петр Макаров on 03.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private let status: UITextField = {
        let status = UITextField()
        status.placeholder = "Waiting for something..."
        status.textColor = UIColor.gray
        status.font = UIFont.boldSystemFont(ofSize: 14)
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()
    
    private let showStatus: UIButton = {
        let showStatus = UIButton()
        showStatus.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        showStatus.setTitle("Show status", for: .normal)
        showStatus.tintColor = UIColor.white
        showStatus.layer.cornerRadius = 4
        showStatus.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatus.layer.shadowOpacity = 1.0
        showStatus.layer.shadowColor = UIColor.black.cgColor
        showStatus.backgroundColor = .blue
        showStatus.translatesAutoresizingMaskIntoConstraints = false
        return showStatus
    }()
    
    private let heading: UILabel = {
        var heading = UILabel()
        UIFont.boldSystemFont(ofSize: 18)
        heading.text = "Hipster cat"
        heading.translatesAutoresizingMaskIntoConstraints = false
        return heading
    }()
    
    private let profile: UILabel = {
        let profile = UILabel()
        profile.font = UIFont.boldSystemFont(ofSize: 18)
        profile.text = "Profile"
        profile.translatesAutoresizingMaskIntoConstraints = false
        return profile
    }()
    
    private let catView: UIImageView = {
        let catView = UIImageView()
        catView.image = UIImage(named: "cat")
        catView.layer.borderWidth = 3
        catView.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1).cgColor
        catView.layer.cornerRadius = 50
        catView.contentMode = .scaleAspectFill
        catView.clipsToBounds = true
        catView.translatesAutoresizingMaskIntoConstraints = false
        return catView
    }()
    
    @objc func statusTextChanged(_ textField: UITextField) {
        restorationIdentifier = status.text
    }
    
    @objc func buttonPressed(sender: UIButton!) {
        heading.text = status.text
        print(heading.text ?? status.placeholder)
    }
    

    
    func viewProfile() {
        [catView, heading, showStatus, status].forEach { addSubview($0) }
        
        NSLayoutConstraint.activate([
            catView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            catView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            catView.widthAnchor.constraint(equalToConstant: 100),
            catView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            heading.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            heading.leadingAnchor.constraint(equalTo: catView.trailingAnchor, constant: 27)
        ])

        NSLayoutConstraint.activate([
            showStatus.topAnchor.constraint(equalTo: catView.bottomAnchor, constant: 16),
            showStatus.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            showStatus.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            showStatus.heightAnchor.constraint(equalToConstant: 50)
        ])

        NSLayoutConstraint.activate([
            status.bottomAnchor.constraint(equalTo: showStatus.topAnchor, constant: -34),
            status.leadingAnchor.constraint(equalTo: catView.trailingAnchor, constant: 27),
        ])

    }

}
