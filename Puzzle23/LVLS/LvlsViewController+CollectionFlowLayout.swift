//
//  LvlsViewController++.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 08.07.2023.
//

import UIKit

extension LvlsViewController: UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthOfCell = ( collectionView.frame.width - Constants.insetForLVLsCollection * (Constants.numberOfItemsInLVLsCollection + 1) ) / Constants.numberOfItemsInLVLsCollection
        return CGSize(width: widthOfCell , height: widthOfCell)
    }
   
    
}


