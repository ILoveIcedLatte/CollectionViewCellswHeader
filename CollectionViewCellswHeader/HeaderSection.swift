//
//  HeaderSection.swift
//  CollectionViewCellswHeader
//
//  Created by Dilara Şimşek on 20.03.2022.
//

import UIKit

class HeaderSection: UICollectionReusableView {
    
    let imageView: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "Image"))
        imgView.contentMode = .scaleAspectFill
        return imgView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //for layout
        
        backgroundColor = .systemPink
        addSubview(imageView)
        imageView.fillSuperview()
        
        
        //blur effect
        setupEffect()
        
        setupGradientLayer()
    }
    
    var animator: UIViewPropertyAnimator!
    let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
    
    fileprivate func setupEffect(){
        
        addSubview(visualEffectView)
        visualEffectView.fillSuperview()
        
        animator = UIViewPropertyAnimator(duration: 1.0, curve: .linear, animations: {
            self.visualEffectView.effect = nil
        })
        
        animator.isReversed = true
        animator.fractionComplete = 0
        
    }
    
    
    func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.5, 1]
        
        //layer.addSublayer(gradientLayer)
        //bununla header kısmını çekince gradientlayer büyümez
        
        let gradientContainerView = UIView()
        addSubview(gradientContainerView)
        gradientContainerView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        gradientContainerView.layer.addSublayer(gradientLayer)
        
        //self.bounds-> collectionview'ın genişliği ve yüksekliği
        gradientLayer.frame = self.bounds
        
        
        gradientLayer.frame.origin.y -= bounds.height
        
        
        let headerLabel = UILabel()
        headerLabel.text = "Naruto Shippuden"
        headerLabel.textColor = .white
        headerLabel.font = .boldSystemFont(ofSize: 30)
        
        let headerDescLabel = UILabel()
        headerDescLabel.text = "Naruto, Sasuke, Sakura, Kakashi... You have to watch this anime and I'm trying to fill description label right now..."
        headerDescLabel.textColor = .white
        headerDescLabel.font = .systemFont(ofSize: 15, weight: .light)
        headerDescLabel.numberOfLines = 0
        
        let headerStackview = UIStackView(arrangedSubviews: [
            headerLabel, headerDescLabel
        ])
        headerStackview.axis = .vertical
        
        addSubview(headerStackview)
        headerStackview.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
