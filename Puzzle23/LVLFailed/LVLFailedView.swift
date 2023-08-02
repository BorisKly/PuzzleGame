//
//  LVLFailedView.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 09.07.2023.
//

import UIKit
import PinLayout

class LVLFailedView: UIView {

    let parentImage = UIImageView()

    private let mainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "lvlFailed.pdf")
        return image
    }()

    private let levelFailed = UILabel()

    let backToLevelsButton = UIButton()
    let reloadLevel = UIButton()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(parentImage)
        self.sendSubviewToBack(parentImage)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        parentImage.setParentImage()

        self.addSubview(mainImage)
        self.addSubview(levelFailed)

        self.addSubview(backToLevelsButton)
        self.addSubview(reloadLevel)
        
        setUIButtons()
        setConstraints()
    }
    
    private func setUIButtons() {
        backToLevelsButton.setUIBackToLvlsButton()
        reloadLevel.setUIButton(title: "Try once more!!!", titleHighlited: "pressed")
        
        levelFailed.setLabelWithPinkColorAndClearBackground(text: "LEVEL FAILED")
    }

    private func setConstraints() {
    
        let width = self.frame.width * 95 / 100
        
        parentImage.pin.hCenter().vCenter().width(100%).height(100%)
        
        mainImage.pin
            .width(width)
            .height(width)
            .top(100)
            .hCenter()
        
        backToLevelsButton.pin
            .size(80).left(10).top(30)

        levelFailed.pin
            .width(width)
            .height(130)
            .vCenter()
            .hCenter()

        reloadLevel.pin
            .width(95%)
            .hCenter()
            .height(60)
            .bottom(100)
    }
}
