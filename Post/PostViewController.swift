//
//  PostViewController.swift
//  Navigation
//
//  Created by Петр Макаров on 04.04.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        makeBarItem()
    }
    
    private func makeBarItem() {
        let barItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(tapAction))
        navigationItem.rightBarButtonItem = barItem
        barItem.tintColor = .black
    }

    @objc private func tapAction() {
        let vc = InfoViewController()
        vc.title = "Information"
        navigationController?.pushViewController(vc, animated: true)
    }

}
