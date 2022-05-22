//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Петр Макаров on 20.05.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    private let photo = Photo.makePhoto()

    private lazy var photoCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let photoCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        photoCollection.translatesAutoresizingMaskIntoConstraints = false
        photoCollection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        photoCollection.dataSource = self
        photoCollection.delegate = self
        return photoCollection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .white
        title = "Photo Gallery"
//        navigationController?.navigationBar.isHidden = false
        layout()
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        navigationController?.navigationBar.isHidden = true
//    }
    
    private func layout() {
        view.addSubview(photoCollection)
        
        NSLayoutConstraint.activate([
            photoCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photoCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photoCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photoCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

//MARK: - UICollectionViewDataSource

extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.addToCell(photo: photo[indexPath.row])
        cell.backgroundColor = .systemGray4
        cell.clipsToBounds = true
        return cell
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout

extension PhotosViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.bounds.width - 40) / 4
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
        
}
