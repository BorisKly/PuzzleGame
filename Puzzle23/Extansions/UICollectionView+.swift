//
//  UICollectionView+.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 13.07.2023.
//

import UIKit

extension UICollectionView {
    
    var sound: Sound {
        resolve(Sound.self)
    }
    
    public func setCollectionOfLvls() {
        
        let inset: CGFloat = Constants.insetForLVLsCollection
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = inset
        layout.minimumInteritemSpacing = inset
        layout.sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemMint
        layout.scrollDirection = .vertical
    }
}
