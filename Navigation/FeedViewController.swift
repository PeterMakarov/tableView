//
//  ViewController.swift
//  Navigation
//
//  Created by Петр Макаров on 04.04.2022.
//

import UIKit

struct Post {
    var title: String
}

class FeedViewController: UIViewController {
    
    let postOne = Post(title: "Post")
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
    }()
    
    private let buttonTop: UIButton = {
        let buttonTop = UIButton()
        buttonTop.setTitle("Top", for: .normal)
        buttonTop.backgroundColor = .lightGray
        buttonTop.addTarget(self, action: #selector(tapAction), for: .touchDown)
        buttonTop.translatesAutoresizingMaskIntoConstraints = false
        return buttonTop
    }()
    
    private let buttonBottom: UIButton = {
        let buttonBottom = UIButton()
        buttonBottom.setTitle("Bottom", for: .normal)
        buttonBottom.backgroundColor = .lightGray
        buttonBottom.addTarget(self, action: #selector(tapAction), for: .touchDown)
        buttonBottom.translatesAutoresizingMaskIntoConstraints = false
        return buttonBottom
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        view.addSubview(stackView)
        
        [buttonTop, buttonBottom].forEach {stackView.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 100),
            stackView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc private func tapAction() {
        let vc = InfoViewController()
//        vc.post = PostModel(title: "new title2", author: "new autor2", description: "new description2", likes: 123, views: 234)
        navigationController?.pushViewController(vc, animated: true)
    }

}

