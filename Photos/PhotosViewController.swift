//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Петр Макаров on 20.05.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private var photos = Photo.makePhoto()
    
    lazy private var animationView: AnimationView = {
        let animationView = AnimationView()
        animationView.delegate = self
        return animationView
    }()
    
    var topCollectionView = NSLayoutConstraint()
    var leadingCollectionView = NSLayoutConstraint()
    var widthCollectionView = NSLayoutConstraint()
    var heightCollectionView = NSLayoutConstraint()
    var catViewX = CGFloat()
    var catViewY = CGFloat()
    
    private let layoutCol: UICollectionViewFlowLayout = {
        $0.scrollDirection = .vertical
        return $0
    }(UICollectionViewFlowLayout())
    
    private lazy var viewForAnimate: UIView = {
        let viewForAnimate = UIView()
        viewForAnimate.translatesAutoresizingMaskIntoConstraints = false
        viewForAnimate.backgroundColor = .black
        viewForAnimate.alpha = 0
        viewForAnimate.isHidden = true
        return viewForAnimate
    }()
    
    private lazy var detailImage: UIImageView = {
        let detailImage = UIImageView()
        detailImage.translatesAutoresizingMaskIntoConstraints = false
        detailImage.alpha = 0
        detailImage.isHidden = true
        return detailImage
    }()
    
    private lazy var cancelShowPhoto: UIImageView = {
        let cancelShowPhoto = UIImageView()
        cancelShowPhoto.translatesAutoresizingMaskIntoConstraints = false
        cancelShowPhoto.image = UIImage(named: "cancel")
        cancelShowPhoto.clipsToBounds = true
        cancelShowPhoto.isUserInteractionEnabled = true
        cancelShowPhoto.alpha = 0
        return cancelShowPhoto
    }()
    
    private lazy var collectionView: UICollectionView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemBackground
        $0.dataSource = self
        $0.delegate = self
        $0.isUserInteractionEnabled = true
        $0.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: layoutCol))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Photo Gallery"
        layout()
    }
    
    private func setupGestures() {
        let setupGestures = UITapGestureRecognizer(target: self, action: #selector(tapInCat))
        collectionView.addGestureRecognizer(setupGestures)
    }
    
    @objc private func tapInCat() {
//        print("gg")
//        UIView.animate(withDuration: 0.5,
//                       delay: 0.1,
//                       usingSpringWithDamping: 1,
//                       initialSpringVelocity: 0.3,
//                       options: .curveEaseInOut) {
//
//        }
    }





private func layout(){
    [collectionView, viewForAnimate, detailImage, animationView].forEach { view.addSubview($0) }
    
    
    
//    setupGestures()
    
    topCollectionView = detailImage.topAnchor.constraint(equalTo: view.topAnchor)
    leadingCollectionView = detailImage.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    widthCollectionView = detailImage.widthAnchor.constraint(equalToConstant: 100)
    heightCollectionView = detailImage.heightAnchor.constraint(equalToConstant: 100)
    
    NSLayoutConstraint.activate([
        animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        animationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        animationView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
        viewForAnimate.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        viewForAnimate.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        viewForAnimate.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        viewForAnimate.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        
        
        topCollectionView,
        leadingCollectionView,
        widthCollectionView,
        heightCollectionView,
        
        
//        cancelShowPhoto.topAnchor.constraint(equalTo: viewForAnimate.topAnchor, constant: 20),
//        cancelShowPhoto.trailingAnchor.constraint(equalTo: viewForAnimate.trailingAnchor, constant: -20),
//        cancelShowPhoto.heightAnchor.constraint(equalToConstant: 30),
//        cancelShowPhoto.widthAnchor.constraint(equalToConstant: 30),
    ])
}
}


// MARK: - UICollectionViewDataSource

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.backgroundColor = .systemGray4
        cell.setupCell(photo: photos[indexPath.row])
        cell.clipsToBounds = true
        return cell
    }
}


// MARK: - UICollectionViewDelegateFlowLayout

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    private var inset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.bounds.width - inset * 4) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
}


extension PhotosViewController: AnimationViewDelagate {
    func animationViewDidSelectClose(view: AnimationView) {
        print("Закрыт")
    }
    
    func animationViewDidStartAnimation(view: AnimationView) {
        print("Погнали")
    }
    
    func animationViewDidFinishAnimation(view: AnimationView) {
        print("8(((")
    }
    
    
}

// MARK: - UICollectionViewDelegate

extension PhotosViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)  {
        
        guard let image = photos[indexPath.row].image else {
            print("А где картинка то?")
            return
        }
        
        guard let cell = collectionView.cellForItem(at: indexPath) else {
            print("А где ячейка то?")
            return
        }
        
        // TODO: - Тут нужно посчитать правильно POINT и SIZE
 
        animationView.startAnimation(point: cell.frame.origin, size: cell.frame.size, image: image)
}
}

