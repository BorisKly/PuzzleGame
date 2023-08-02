//
//  LvlsViewController+.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 08.07.2023.
//

import UIKit

extension LvlsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    public var sound: Sound {
        resolve(Sound.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        PublicService.shared.arrayOfLevels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LevelsCell", for: indexPath) as? LvlsCell
       
        let stringOfAllowedLvls = UserRecords.shared.levelsCompleted
        
        cell?.setImageToCell(with: PublicService.shared.arrayOfLevels[indexPath.row], isLvlAllowedToPlay: stringOfAllowedLvls.dropFirst(indexPath.row).first == "1")
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let userDefaults = UserDefaults.standard
        
        if userDefaults.bool(forKey: "sound") { sound.playClickSound()
        }
        
        let selectedLvlNumber = indexPath.row
        self.viewModel.goToSelectedLvl(selectedLvlNumber: selectedLvlNumber)
    }
}
