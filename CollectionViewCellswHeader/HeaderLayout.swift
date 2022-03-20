//
//  HeaderLayout.swift
//  CollectionViewCellswHeader
//
//  Created by Dilara Şimşek on 20.03.2022.
//

import UIKit

class HeaderLayout: UICollectionViewFlowLayout {
    
    //modify the header component
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributes?.forEach({ (attributes) in
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader {
                //&& attributes.indexpath.section == 0 eğer birden fazla headerımız olursa onun alınmasını sağlamak için bu şekilde yazarız.
                
                guard let collectionView = collectionView else { return }
                
                let contentOffsetY = collectionView.contentOffset.y //get y coordinate of collectionview
                
                if contentOffsetY > 0 {
                    return
                }
                
                let headerWidth = collectionView.frame.width
                
                
                //header view aşağı çekildiğinde y koordinatı azaldığı için "-" sonuç verir, contentoffsety aşağı çekildiğinde - değerdedir. headerın height değeri - (-y) yapıldığı için aşağı çekildiği sayı kadar headerheight değeri artacaktır.
                
                //contentoffsety : -28.0
                //height: 300.0
                //headerheight: 328.0
                
                let headerHeight = attributes.frame.height - contentOffsetY
                

                
                //header
                attributes.frame = CGRect(x: 0, y: contentOffsetY, width: headerWidth, height: headerHeight)
            }
        })
        
        
        
        
        return layoutAttributes
    }
    
    //Asks the layout object if the new bounds require a layout update.
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    

}
