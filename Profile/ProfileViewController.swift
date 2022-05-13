//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Петр Макаров on 09.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
//    private let postModel: [[PostModel]] = PostModel.makeSomePost()
//
//    private lazy var tableView: UITableView = {
//        let tableView = UITableView(frame: .zero, style: .grouped)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
//        return tableView
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
//        view.addSubview(tableView)
//        tableViewLayOut()
    }
    
    
//    func tableViewLayOut() {
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


//     MARK: - UITableViewDataSource

//extension ProfileViewController: UITableViewDataSource {
//
//
//    func numberOfSection(in tableView: UITableView) -> Int {
//        return 2
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0 {
//            return 1
//        } else {
//            return postModel.count
//        }
//    }
//
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            {
//                let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
//                cell.setupCell(postModel[indexPath.section][indexPath.row])
//                return cell
//            }()
//        }
//    }
//
//
////    MARK: - UItableViewDalegate
//
//extension ProfileViewController: UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//       150
//        }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        section % 2 == 0 ? 150 : 50
//    }
//
//}


//        if indexPath.section == 0 {
//            return 150
//        } else {
//            return UITableView.automaticDimension
//        }
//    }

//
//    //        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//    //            let header = CustomHeaderView()
//    //            let text = "Это хедер секции \(section)"
//    //            header.setupHeader(text: text)
//    //            return header
//    //        }
//
//    //        func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//    //            let header = CustomHeaderView()
//    //            let text = "Это футор секции \(section)"
//    //            header.setupHeader(text: text)
//    //            return header
//    //        }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 0 {
//            return 200
//        } else {
//            return 0
//        }
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        if section == 0 {
//            let phv = ProfileHeaderView()
//            return phv
//        } else {
//            return nil
//        }
//    }
//
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        tableView.deselectRow(at: indexPath, animated: true)
        //            let detailVC = DetailViewController()
        //            detailVC.setupVC(model: carModel[indexPath.section][indexPath.row])
        //            navigationController?.pushViewController(detailVC, animated: true)
        //        present(detailVC, animated: true)
//    }
//
//}


}
