//
//  RulesView.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 16.07.2023.
//

import UIKit
import PinLayout

class RulesView: UIView {

    let parentImage = UIImageView()
   
    public let backToMainScreenButton = UIButton()
    private let gameRulesLabel = UILabel()
    private let welcomeLabel = UILabel()
    private let textLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(parentImage)
        self.sendSubviewToBack(parentImage)

        addSubview(backToMainScreenButton)
        addSubview(gameRulesLabel)
        addSubview(welcomeLabel)
        addSubview(textLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        parentImage.setParentImage()
      
        setConstraints()
        setLabelsAndButtons()
    }

    private func setLabelsAndButtons() {
        gameRulesLabel.setLabelWithPinkColorAndClearBackground(text: "GAME RULES")
        welcomeLabel.setLabelWithPinkColorAndClearBackground(text: "Welcome to TimeMasters  Puzzle Game!!!")
        textLabel.setLabelWithPinkColorAndClearBackgroundSmallFont(text: "Explore evry of 15 levels, move puzzles to create some picture as in example. Each level have time limitation on pass it, and it's time will decrease in each level. If you loose? you can try to pass level again. If you win - you can pas the next level. ")
      
        backToMainScreenButton.setUIBackToLvlsButton()
    }

    private func setConstraints() {
        
        let width = self.frame.width * 0.95
      
        parentImage.pin.hCenter().vCenter().width(100%).height(100%)

        backToMainScreenButton.pin
            .size(60).left(10).top(30)
        
        gameRulesLabel.pin
            .below(of: backToMainScreenButton)
            .width(width)
            .height(90)
            .hCenter()
            .marginTop(10)
        
        welcomeLabel.pin
            .below(of: gameRulesLabel)
            .width(width)
            .height(180)
            .hCenter()
            .marginTop(10)

        textLabel.pin
            .below(of: welcomeLabel)
            .width(width)
            .bottom(50)
            .hCenter()
            .marginTop(20)
    }
}
