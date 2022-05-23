//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Петр Макаров on 03.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    // MARK: - Private Properties

    private lazy var statusTextField: UITextField = {
        let status = UITextField()
        status.placeholder = "Waiting for something..."
        status.textColor = UIColor.gray
        status.backgroundColor = .white
        status.layer.cornerRadius = 10
        status.font = UIFont.boldSystemFont(ofSize: 14)
        status.translatesAutoresizingMaskIntoConstraints = false
        status.addTarget(self, action: #selector(statusTextFieldValueChanged(_:)), for: .valueChanged)
        return status
    }()

    private lazy var statusButton: UIButton = {
        let showStatus = UIButton()
        showStatus.addTarget(self, action: #selector(statusButtonTapped(_:)), for: .touchUpInside)
        showStatus.setTitle("Set status", for: .normal)
        showStatus.tintColor = UIColor.white
        showStatus.layer.cornerRadius = 4
        showStatus.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatus.layer.shadowOpacity = 1.0
        showStatus.layer.shadowColor = UIColor.black.cgColor
        showStatus.backgroundColor = .blue
        showStatus.translatesAutoresizingMaskIntoConstraints = false
        return showStatus
    }()

    private lazy var hearLabel: UILabel = {
        var heading = UILabel()
        heading.font = UIFont.boldSystemFont(ofSize: 18)
        heading.text = "Hipster cat"
        heading.translatesAutoresizingMaskIntoConstraints = false
        return heading
    }()

    private lazy var profileLabel: UILabel = {
        let profile = UILabel()
        profile.font = UIFont.boldSystemFont(ofSize: 18)
        profile.text = "Profile"
        profile.translatesAutoresizingMaskIntoConstraints = false
        return profile
    }()

    private lazy var catImageView: UIImageView = {
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

    // MARK: - IBActions

    @IBAction private func statusTextFieldValueChanged(_ sender: UITextField) {
        restorationIdentifier = sender.text
    }

    @IBAction private func statusButtonTapped(_ sender: UIButton) {
        hearLabel.text = statusTextField.text
        print(hearLabel.text ?? statusTextField.placeholder)
    }

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        viewProfile()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func viewProfile() {

        [catImageView, hearLabel, statusButton, statusTextField].forEach { addSubview($0) }

        NSLayoutConstraint.activate([
            catImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            catImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            catImageView.widthAnchor.constraint(equalToConstant: 100),
            catImageView.heightAnchor.constraint(equalToConstant: 100),
       
            hearLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            hearLabel.leadingAnchor.constraint(equalTo: catImageView.trailingAnchor, constant: 27),

            statusButton.topAnchor.constraint(equalTo: catImageView.bottomAnchor, constant: 16),
            statusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),

            statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34),
            statusTextField.leadingAnchor.constraint(equalTo: catImageView.trailingAnchor, constant: 27),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
}
