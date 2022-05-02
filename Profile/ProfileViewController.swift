//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Петр Макаров on 09.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //    var profile = ProfileHeaderView()
    
    let heading: UILabel = {
        var heading = UILabel(frame: CGRect(x: 155, y: 87, width: 200, height: 100))
        UIFont.boldSystemFont(ofSize: 18)
        heading.text = "Hipster cat"
        return heading
    }()
    
    let showStatus: UIButton = {
        let showStatus = UIButton(frame: CGRect(x: 16, y: 236, width: 390, height: 60))
        showStatus.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        showStatus.setTitle("Show status", for: .normal)
        showStatus.tintColor = UIColor.white
        showStatus.layer.cornerRadius = 4
        showStatus.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatus.layer.shadowOpacity = 1.0
        showStatus.layer.shadowColor = UIColor.black.cgColor
        showStatus.backgroundColor = .blue
        return showStatus
    }()
    
    let status: UITextField = {
        let status = UITextField(frame: CGRect(x: 155, y: 172, width: 130, height: 30))
        status.placeholder = "Waiting for something..."
        status.textColor = UIColor.gray
        status.font = UIFont.boldSystemFont(ofSize: 14)
        return status
    }()
    
    
    @objc func statusTextChanged(_ textField: UITextField) {
        restorationIdentifier = status.text
    }
    
    @objc func buttonPressed(sender: UIButton!) {
        heading.text = status.text
        heading.text = status.text
        print(heading.text ?? status.placeholder)
    }
    
    
    
    
    override func viewWillLayoutSubviews() {
        let maket = ProfileHeaderView(frame: view.frame)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let profileView = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: 400, height: 700))
        profileView.viewProfile()
        view.addSubview(profileView)
        view.addSubview(heading)
        view.addSubview(showStatus)
        view.addSubview(status)
    }
    
}
