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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
