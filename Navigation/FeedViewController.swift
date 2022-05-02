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
    
    var postTitle: Post?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        postButton()
    }
    
    private func postButton() {
        let button = UIButton(frame: CGRect.init(x: 0, y: 0, width: 200, height: 50))
        button.center = view.center
        button.setTitle("Post", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(button)
        
    }
    
    @objc private func tapAction() {
        let vc = PostViewController()
        vc.title = "Post"
        navigationController?.pushViewController(vc, animated: true)
    }

}

