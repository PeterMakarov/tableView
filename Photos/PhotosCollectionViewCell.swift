//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Петр Макаров on 20.05.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    weak var myCats:ProfileViewController?
    
    private let imagePhoto: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "cats")
//        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.backgroundColor = .black
        return $0
    }(UIImageView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ photo: UIImage){
        imagePhoto.image = photo
    }
    
    private func layout(){

        contentView.addSubview(imagePhoto)
        
         NSLayoutConstraint.activate([
            imagePhoto.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            imagePhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            imagePhoto.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            imagePhoto.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
            ])
    }
    
}
