//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Петр Макаров on 09.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    private let postModel = PostModel.makeSomePost()
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return tableView
    }()
    
    private let headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.textColor = .black
        headerLabel.font = UIFont.boldSystemFont(ofSize: 20)
        headerLabel.numberOfLines = 2
        return headerLabel
    }()
    
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
    
    func tableViewLayOut() {
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: workingScreen.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let profileView = ProfileHeaderView()
        view.addSubview(workingScreen)
        view.addSubview(profileView)
        profileView.frame = view.safeAreaLayoutGuide.layoutFrame
        profileView.viewProfile()
        tableViewLayOut()
        
        
        
        view.addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 34),
            headerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
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

//     MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    
    
    func numberOfSection(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postModel.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.section == 0 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
//            cell.delegate = self
//            return cell
//    } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as! CustomTableViewCell
            
            cell.setupCell(postModel[indexPath.section][indexPath.row])
            
            return cell
//        }
    }
}


//    MARK: - UItableViewDalegate

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return PhotosTableViewCell()
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = PostViewController()
        detailVC.setupVC(model: postModel[indexPath.section][indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section == 0 ? 220 : 0
    }
}

//    MARK: - PhotosTableViewCellDelegate

extension ProfileViewController: PhotosTableViewCellDelegate {
    func buttonPressed() {
        let detailVC = PhotosViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

