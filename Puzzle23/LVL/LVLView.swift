//
//  LVLView.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 08.07.2023.
//

import UIKit
import PinLayout

class LVLView: UIView {
    
    let parentImage = UIImageView()

    let frameView = UIView()
    let frameView2 = UIView()


    public let backToLevelsScreenButton = UIButton()
    
    public let levelNumberLabel = UILabel()
    public let timerLabel = UILabel()
    public let correctPuzzle = UIImageView()
    public let levelSuccess = UILabel()


    private let levelAndTimerStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
        
    public let mixedCollectionOfElementsOfPuzzle: UICollectionView = {
        
        let inset: CGFloat = Constants.insetForLVLCollection

        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = inset
        layout.minimumInteritemSpacing = inset
        layout.sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
       
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = Colors.mintColor
        collection.allowsMultipleSelection = true
        collection.isScrollEnabled = false
      
        return collection
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.registerCollection()
        
        self.addSubview(parentImage)
        self.sendSubviewToBack(parentImage)

        self.addSubview(backToLevelsScreenButton)
        
        self.addSubview(levelAndTimerStack)

        self.addSubview(frameView)
        frameView.addSubview(levelSuccess)
        frameView.addSubview(mixedCollectionOfElementsOfPuzzle)
        frameView.setFrameToView()
        
        addSubview(frameView2)
        frameView2.addSubview(correctPuzzle)
        frameView2.setFrameToView()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        parentImage.setParentImage()
        setConstraints()

        setButtons()
        setStacks()
    }
        
    private func setButtons() {
        backToLevelsScreenButton.setUIBackToLvlsButton()
        levelSuccess.setLabelWithPinkColorAndClearBackground(text: "Success!!!")
        
        levelAndTimerStack.setStackView()
    }
    
    private func setStacks() {
        levelAndTimerStack.addArrangedSubview(levelNumberLabel)
        levelAndTimerStack.addArrangedSubview(timerLabel)
    }
    
    private func registerCollection() {
        self.mixedCollectionOfElementsOfPuzzle.register(LVLViewCell.self, forCellWithReuseIdentifier: "LevelViewCell")
    }
    
    private func setConstraints() {
        
        let width = min( self.frame.width * 0.95, 600)
      
        parentImage.pin.hCenter().vCenter().width(100%).height(100%)

        backToLevelsScreenButton.pin
            .size(60).left(10).top(30)
        
        levelAndTimerStack.pin
            .below(of: backToLevelsScreenButton)
            .marginTop(10)
            .width(width * 0.8)
            .height(90)
            .hCenter()
           
        frameView.pin
            .below(of: levelAndTimerStack)
            .marginTop(20)
            .width(width)
            .height(width)
            .hCenter()
            
        frameView2.pin
            .below(of: frameView)
            .size(width / 2)
            .marginTop(30)
            .hCenter()
        
        correctPuzzle.pin
            .all(0)
        
        mixedCollectionOfElementsOfPuzzle.pin
            .all(0)
        
        levelSuccess.pin
            .width(of: frameView)
            .height(frameView.frame.height / 4)
            .vCenter()
        
    }
}
