//
//  InfoViewController.swift
//  Navigation
//
//  Created by Петр Макаров on 04.04.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        makeButton()
    }
    
    private func makeButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.center = view.center
        button.setTitle("info", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func tapAction() {
        let alert = UIAlertController(title: "Вернуться", message: "Вы уверены ?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Покинуть", style: .default) {
            _ in
            self.dismiss(animated: true)
            self.navigationController?.popViewController(animated: true)
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive)
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
