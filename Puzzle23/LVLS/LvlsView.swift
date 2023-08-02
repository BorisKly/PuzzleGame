//
//  LvlsView.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 08.07.2023.
//

import UIKit
import PinLayout

class LvlsView: UIView {

    let parentImage = UIImageView()
   
    var cellWidth = 0

    public let backToMainScreenButton = UIButton()
    private let levelsLabelTitle = UILabel()
    private let stackViewLevels = UIStackView()

    let frameView = UIView()
    
    public let collectionOfLevels: UICollectionView = {
        
        let inset: CGFloat = Constants.insetForLVLsCollection
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = inset
        layout.minimumInteritemSpacing = inset
        layout.sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.layer.cornerRadius = 30
        layout.scrollDirection = .vertical
        
        return collection
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        
        self.registerCollection()

        self.addSubview(parentImage)
        self.sendSubviewToBack(parentImage)

        self.addSubview(backToMainScreenButton)
        self.addSubview(levelsLabelTitle)

        self.addSubview(frameView)
        frameView.addSubview(collectionOfLevels)
        frameView.setFrameToView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        parentImage.setParentImage()
      
        setConstraints()
        setLabelsButtons()
    }

    private func setLabelsButtons() {
        levelsLabelTitle.setLabelWithPinkColorAndClearBackground(text: "LEVELS")
        backToMainScreenButton.setUIBackToLvlsButton()
    }

    private func registerCollection() {
        self.collectionOfLevels.register(LvlsCell.self, forCellWithReuseIdentifier: "LevelsCell")
    }

    private func setConstraints() {

        parentImage.pin.hCenter().vCenter().width(100%).height(100%)

        backToMainScreenButton.pin
            .size(60).left(10).top(30)

        levelsLabelTitle.pin
            .below(of: backToMainScreenButton)
            .marginTop(5).width(95%).hCenter().height(10%)
        
        frameView.pin
            .below(of: levelsLabelTitle).marginTop(20)
            .width(95%).hCenter()
            .bottom(50)
      
        collectionOfLevels.pin
            .all(0)
  
    }
}

