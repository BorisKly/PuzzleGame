//
//  LVLCompletedView.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 09.07.2023.
//

import UIKit
import PinLayout

class LVLCompletedView: UIView {

    let parentImage = UIImageView()

    private let mainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "lvlCompleted.pdf")
        return image
    }()

    private let levelCompleted = UILabel()
    
    public let timeLabel = UILabel()
    
    let backToLevelsButton = UIButton()
    let goToNextLevel = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(parentImage)
        self.sendSubviewToBack(parentImage)
        setButtons()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        parentImage.setParentImage()

        self.addSubview(mainImage)
        
        self.addSubview(levelCompleted)
        self.addSubview(timeLabel)
        self.addSubview(backToLevelsButton)
        self.addSubview(goToNextLevel)
       
      
        setConstraints()
    }
    
    private func setButtons() {
        backToLevelsButton.setUIBackToLvlsButton()
        goToNextLevel.setUIButton(title: "GO TO NEXT LEVEL!", titleHighlited: "pressed")
        
        levelCompleted.setLabelWithPinkColorAndClearBackground(text: "LEVEL COMPLETED!!!")
        timeLabel.setLabelWithPinkColorAndClearBackground(text: "Your time: " )
    }

    private func setConstraints() {
    
        let width = self.frame.width * 95 / 100
        
        parentImage.pin.hCenter().vCenter().width(100%).height(100%)
        
        mainImage.pin
            .width(width)
            .height(width)
            .top(50)
            .hCenter()
        
        
        backToLevelsButton.pin
            .size(80).left(10).top(30)

        levelCompleted.pin
            .width(width)
            .height(160)
            .vCenter()
            .hCenter()

        timeLabel.pin
            .below(of: levelCompleted)
            .width(width)
            .height(160)
            .hCenter()
            .marginTop(10)

        goToNextLevel.pin
            .width(95%)
            .hCenter()
            .height(60)
            .bottom(100)
    }
}
