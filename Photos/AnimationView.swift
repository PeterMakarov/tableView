//
//  AnimationView.swift
//  Navigation
//
//  Created by Петр Макаров on 26.05.2022.
//

import UIKit

protocol AnimationViewDelagate: AnyObject {
    func animationViewDidSelectClose(view: AnimationView)
    func animationViewDidStartAnimation(view: AnimationView)
    func animationViewDidFinishAnimation(view: AnimationView)
}

class AnimationView: UIView {
    
    weak var delegate: AnimationViewDelagate?
    
    private lazy var detailImageView: UIImageView = {
        let detailImage = UIImageView()
        detailImage.translatesAutoresizingMaskIntoConstraints = false
        detailImage.isHidden = true
        return detailImage
    }()
    
    private lazy var backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = .black
        backgroundView.isHidden = true
        backgroundView.alpha = 0
        return backgroundView
    }()
    
    
    private lazy var closeButton: UIButton = {
        let closeButton = UIButton()
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.isHidden = true
        closeButton.alpha = 0
        closeButton.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        return closeButton
    }()
    
    private var detailImageViewTopLayoutContraint = NSLayoutConstraint()
    private var detailImageViewLeadingLayoutContraint = NSLayoutConstraint()
    private var detailImageViewWidghLayoutContraint = NSLayoutConstraint()
    private var detailImageViewHightLayoutContraint = NSLayoutConstraint()
    
    
    
    @objc private func closeAction (sender: UIButton) {
        delegate?.animationViewDidSelectClose(view: self)
    }
        
    
    func startAnimation(point: CGPoint, size: CGSize, image: UIImage) {
        detailImageViewTopLayoutContraint.constant = point.y
        detailImageViewLeadingLayoutContraint.constant = point.x
        detailImageViewHightLayoutContraint.constant = size.height
        detailImageViewWidghLayoutContraint.constant = size.width
        detailImageView.image = image
        delegate?.animationViewDidStartAnimation(view: self)
        
        closeButton.isHidden = false
        detailImageView.isHidden = false
        backgroundView.isHidden = false
        self.isHidden = false
        
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0.1,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0.3,
            options: .curveEaseInOut) {
                
                
//                self.closeAnimationButton.isHidden = true
//                self.catImageView.center = CGPoint(x: self.catViewX, y: self.catViewY)
//                self.topCatImageView.constant = self.bounds.minY + 16
//                self.leadingCatImageView.isActive = true
//                self.widthCatImageView.constant = 100
//                self.heightCatImageView.constant = 100
//                self.blackView.isHidden = true
//                self.catImageView.layer.cornerRadius = self.catImageView.bounds.width / 2
                
                
                
                self.closeButton.alpha = 1
                self.detailImageView.alpha = 1
                self.backgroundView.alpha = 0.9
                
                let length: CGFloat = 150.0
                
                self.detailImageViewHightLayoutContraint.constant = length
                self.detailImageViewWidghLayoutContraint.constant = length
                self.detailImageViewTopLayoutContraint.constant = self.frame.midY - length / 2
                self.detailImageViewLeadingLayoutContraint.constant = self.frame.midX - length / 2
                
                self.layoutIfNeeded()
            }
    }



    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        
        [backgroundView, detailImageView, closeButton].forEach { addSubview($0) }
        
        self.isHidden = true
        
        detailImageViewTopLayoutContraint = self.topAnchor.constraint(equalTo: self.topAnchor, constant: 0)
        detailImageViewLeadingLayoutContraint = self.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0)
        detailImageViewWidghLayoutContraint = self.widthAnchor.constraint(equalToConstant: 0)
        detailImageViewHightLayoutContraint = self.heightAnchor.constraint(equalToConstant: 0)
    
        
        NSLayoutConstraint.activate([
            
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
           
            detailImageViewTopLayoutContraint,
            detailImageViewLeadingLayoutContraint,
            detailImageViewWidghLayoutContraint,
            detailImageViewHightLayoutContraint,
            
            closeButton.topAnchor.constraint(equalTo: self.topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
