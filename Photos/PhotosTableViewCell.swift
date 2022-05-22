//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Петр Макаров on 20.05.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    weak var delegate: PhotosTableViewCellDelegate?
    
    private let photo = Photo.makePhoto()
    
    private lazy var cellView: UIView = {
        let cellView = UIView()
        cellView.translatesAutoresizingMaskIntoConstraints = false
        return cellView
    }()
    
    private let titlePhotos: UILabel = {
        let titlePhotos = UILabel()
        titlePhotos.translatesAutoresizingMaskIntoConstraints = false
        titlePhotos.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titlePhotos.textColor = .black
        titlePhotos.text = "Photos"
        return titlePhotos
    }()
    
//    private let back: UILabel = {
//        let next = UILabel()
//        next.translatesAutoresizingMaskIntoConstraints = false
//        next.font = UIFont.systemFont(ofSize: 24, weight: .bold)
//        next.textColor = .black
//        next.text = "-->"
//        return next
//    }()
    
    private let nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.translatesAutoresizingMaskIntoConstraints = false
//        arrow.turn.up.right
        nextButton.setBackgroundImage(UIImage(systemName: "arrow.turn.up.right"), for: .normal)
        nextButton.addTarget(self, action: #selector(detailVCDelegate), for: .touchUpInside)
        return nextButton
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let photoCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        photoCollection.translatesAutoresizingMaskIntoConstraints = false
        photoCollection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        photoCollection.dataSource = self
        photoCollection.delegate = self
        return photoCollection
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func detailVCDelegate() {
        delegate?.buttonPressed()
    }
    
    private func layout() {
        
        contentView.addSubview(cellView)
        
        NSLayoutConstraint.activate([
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        
        [titlePhotos, nextButton, collectionView].forEach { cellView.addSubview($0) }
        
        //let screenSize: CGRect = UIScreen.main.bounds
        let inset: CGFloat = 12
        
        NSLayoutConstraint.activate([
            
            titlePhotos.topAnchor.constraint(equalTo: cellView.topAnchor, constant: inset),
            titlePhotos.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: inset),
            
            nextButton.topAnchor.constraint(equalTo: cellView.topAnchor, constant: inset),
            nextButton.centerYAnchor.constraint(equalTo: titlePhotos.centerYAnchor),
            nextButton.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -inset),
            
            collectionView.topAnchor.constraint(equalTo: titlePhotos.bottomAnchor, constant: inset),
            collectionView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: inset),
            collectionView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -inset),
            collectionView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -inset)
        ])
    }
}

// MARK: - UICollectionViewDataSource


extension PhotosTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell;()
        cell.addToCell(photo: photo[indexPath.row])
        cell.layer.cornerRadius = 6
        cell.backgroundColor = .systemGray4
        cell.clipsToBounds = true
        return cell
    }
    
}


//MARK: - UICollectionViewDelegateFlowLayout

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (cellView.bounds.width - 48) / 4
        return CGSize(width: width, height: width)
    }
}


protocol PhotosTableViewCellDelegate: AnyObject {
    func buttonPressed()
}



