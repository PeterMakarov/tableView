//
//  PostViewController.swift
//  Navigation
//
//  Created by Петр Макаров on 04.04.2022.
//

import UIKit

class PostViewController: UIViewController {
    
//    var post = PostModel(title: "go go", author: "It's me", description: "VP", likes: 241, views: 321)
//
//    private lazy var tableView: UITableView = {
//       let tableView = UITableView()
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
//        return tableView
//    }()
//
//    convenience init(post: PostModel){
//        self.init()
//        self.post = post
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        
        view.backgroundColor = .yellow
//        navigationItem.title = post.title
//        layout()
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
    
//    private func layout() {
//
//        view.addSubview(tableView)
//
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//    }
//
//}

// MARK: - UITableViewDataSource
//
//extension PostViewController: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
//
//        cell.setupCell(post)
//        cell.selectionStyle = .none
//
//        return cell
//    }
//}
//
// MARK: - UITableViewDelegate
//
//extension PostViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        UITableView.automaticDimension
//    }
//}
