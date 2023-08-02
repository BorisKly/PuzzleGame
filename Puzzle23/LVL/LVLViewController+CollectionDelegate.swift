//
//  LVLViewController+.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 08.07.2023.
//

import UIKit

extension LVLViewController: UICollectionViewDelegate, UICollectionViewDataSource{
  
    public var sound: Sound {
        resolve(Sound.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayOf16Images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LevelViewCell", for: indexPath)
        
        let cellWidth = cell.frame.width
        let cellHeight = cell.frame.height

        let image: UIImage = arrayOf16Images[imageOrder[indexPath.row]]

        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cellWidth, height: cellHeight))
        imageView.image = image
       
        cell.contentView.addSubview(imageView)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let userDefaults = UserDefaults.standard
        
        if userDefaults.bool(forKey: "sound") {
            sound.playClickSound() }
        if userDefaults.bool(forKey: "vibro") {
            sound.makeVibro()
        }
        
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.shadowOpacity = (cell?.isSelected ?? false) ? 0.5 : 1.0

        let selectedItems = collectionView.indexPathsForSelectedItems

        if selectedItems?.count == 2 {
            imageOrder.swapAt(selectedItems?.first?.row ?? 0, selectedItems?.last?.row ?? 0)
            selectedItems?.forEach({ collectionView.deselectItem(at: $0, animated: true)
            })
            collectionView.reloadData()
            
            if imageOrder == correctOrder {
                mainView?.levelSuccess.layer.zPosition = 1
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.viewModel.levelCompleted(time: self.viewModel.totalTime - self.viewModel.time)
                }
            }
        }
    }


}

