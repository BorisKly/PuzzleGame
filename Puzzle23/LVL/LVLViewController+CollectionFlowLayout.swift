//
//  LVLViewController++.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 08.07.2023.
//

import UIKit

extension LVLViewController: UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthOfCell = (collectionView.frame.width - Constants.insetForLVLCollection * (Constants.numberOfItemsInLVLCollection + 1) ) / Constants.numberOfItemsInLVLCollection
        return CGSize(width: widthOfCell , height: widthOfCell)
    }
}
