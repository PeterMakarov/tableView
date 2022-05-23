//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Петр Макаров on 20.05.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private lazy var photoCell: UIImageView = {
        let photoCell = UIImageView()
        photoCell.translatesAutoresizingMaskIntoConstraints = false
        return photoCell
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        customCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customCell() {
        
        contentView.addSubview(photoCell)
        
        NSLayoutConstraint.activate([
            photoCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setupCell(photo: Photo) {
        photoCell.image = photo.image
    }
}


