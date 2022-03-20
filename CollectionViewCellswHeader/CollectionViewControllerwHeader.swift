//
//  CollectionViewControllerwHeader.swift
//  CollectionViewCellswHeader
//
//  Created by Dilara Şimşek on 19.03.2022.
//

import UIKit


class CollectionViewControllerwHeader: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let myCellId = "mycell"
    fileprivate let myheaderID = "myheader"
    let padding: CGFloat = 25
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupCollectionViewLayout()

    }
    
    
    //control + click -> refactor -> extract method -> created method for specific section
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.contentInsetAdjustmentBehavior = .never //üst ve alt boşlukları kaldırdık
        
        
        //identifier for collection view cell
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: myCellId)
        
        //register identifier for header, supplementary view in CV
        //created custom header for collection view which represent the headersection
        collectionView.register(HeaderSection.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: myheaderID)
    }
    
    
    fileprivate func setupCollectionViewLayout() {
        //layout customization
        if let customLayout = collectionViewLayout as? UICollectionViewFlowLayout {
            
            //sectionInset -> 4 farklı yerden verilen değer çıkarılır
            customLayout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
            
            //celller arası boşluğun ne kadar olacağı
            //default is 10
            customLayout.minimumLineSpacing = 30
        }
    }
    
    
    
    //oluşturduğumuz header view un ekranda görünebilmesi için override funclar düzenlenmeli
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: myheaderID, for: indexPath)
        
        return headerView
    }
    
    //create size for headersection
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: myCellId, for: indexPath)
        cell.backgroundColor = .init(red: 255/255, green: 204/255, blue: 204/255, alpha: 1.0)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 2 * padding, height: 50)
        //width: view.frame.width -> all width of page
        //width: view.frame.width - (2 * padding) -> tüm genişlikten verdiğimiz padding çıkarılır ve width güncellenir
    }



}
