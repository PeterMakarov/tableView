//
//  PostViewController.swift
//  Navigation
//
//  Created by Петр Макаров on 04.04.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    private let nc = NotificationCenter.default
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        return $0
    }(UIView())
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    let likes: UILabel = {
       let likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.font = .systemFont(ofSize: 16, weight: .medium)
        likes.textColor = .black
        return likes
    }()
    
    let views: UILabel = {
       let views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        views.font = .systemFont(ofSize: 16, weight: .medium)
        views.textColor = .black
        return views
    }()
    
    private let textLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .systemGray
        $0.font = .systemFont(ofSize: 24)
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
//    private lazy var textField: UITextField = {
//        let textField = UITextField()
//        textField.borderStyle = .roundedRect
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        textField.placeholder = "Введите текст"
//        textField.delegate = self
//        textField.isSecureTextEntry = true
//        return textField
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }
    
    @objc private func kbdHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

    func setupVC(model: PostModel) {
        nameLabel.text = model.title
        ImageView.image = model.image
        textLabel.text = model.description
        likes.text = "Likes: \(model.likes)"
        views.text = "Views: \(model.views)"
        
//        guard let text = model.title else { return }
//        textLabel.text = title + title
    }
    
    private func layout() {
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            /// Обязательно выставить ширину contentView !!!!
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        [nameLabel, ImageView, textLabel, likes, views].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            ImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            ImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: ImageView.bottomAnchor, constant: 16),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            likes.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 16),
            likes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likes.heightAnchor.constraint(equalToConstant: 50),
            likes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            views.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 16),
            views.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            views.heightAnchor.constraint(equalToConstant: 50),
            views.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
//        NSLayoutConstraint.activate([
//            textField.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 16),
//            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            textField.heightAnchor.constraint(equalToConstant: 40),
//            /// Обязательно закрепиться к низу  contentView !!!!
//            textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
    }
}

// MARK: - UITextFieldDelegate

extension PostViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
    
//    var post = PostModel(title: "go go", author: "It's me", description: "VP", likes: 241, views: 321)
//
//    private var tableView: UITableView = {
//       let tableView = UITableView()
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.backgroundColor = .red
////        tableView.dataSource = self
////        tableView.delegate = self
//        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
//        return tableView
//    }()
////
////    convenience init(post: PostModel){
////        self.init()
////        self.post = post
////    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        navigationController?.navigationBar.isHidden = false
//
//        view.backgroundColor = .yellow
////        navigationItem.title = post.title
//        layout()
//        makeBarItem()
//    }
//
//    private func makeBarItem() {
//        let barItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(tapAction))
//        navigationItem.rightBarButtonItem = barItem
//        barItem.tintColor = .black
//    }
//
//    @objc private func tapAction() {
//        let vc = PostViewController()
//        vc.post = PostModel(title: "New title", author: "New autor", description: "New description", likes: 345, views: 435)
//        vc.title = "Information"
//        navigationController?.pushViewController(vc, animated: true)
//    }
//
//
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
//
//// MARK: - UITableViewDataSource
//
//extension PostViewController: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//
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
////  MARK: - UITableViewDelegate
//
//extension PostViewController: UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        UITableView.automaticDimension
//    }
//}
