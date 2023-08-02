//
//  SettView.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 16.07.2023.
//

import UIKit
import PinLayout

class SettView: UIView {

    private let parentImage = UIImageView()

    public let backToMainScreenButton = UIButton()
    public let soundSwitch = UISwitch()
    public let vibroSwitch = UISwitch()
    
    private let settingsLabel = UILabel()
    private let soundLabel = UILabel()
    private let vibroLabel = UILabel()
    private let rateUsLabel = UIButton()

    let stackViewSound: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 10
        return stack
    }()
    let stackViewVibro: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 10
        return stack
    }()


    
override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.addSubview(parentImage)
    self.sendSubviewToBack(parentImage)
    
    self.addSubview(backToMainScreenButton)
    self.addSubview(settingsLabel)
    
    addSubview(stackViewSound)
    addSubview(stackViewVibro)
 //   addSubview(rateUsLabel)
}

required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}

override func layoutSubviews() {
    super.layoutSubviews()
    parentImage.setParentImage()
    setSubviewsForStacks()

    setConstraints()
    setUILabels()
    setSwitch()
    

}

// MARK: - Private Methods

    private func setSubviewsForStacks() {
   
        stackViewSound.addArrangedSubview(soundLabel)
        stackViewSound.addArrangedSubview(soundSwitch)

        stackViewVibro.addArrangedSubview(vibroLabel)
        stackViewVibro.addArrangedSubview(vibroSwitch)
    }

    private func setUILabels() {
        settingsLabel.setLabelWithPinkColorAndClearBackground(text: "SETTINGS")
        vibroLabel.setLabelWithPinkColorAndClearBackground(text: "VIBRO")
        soundLabel.setLabelWithPinkColorAndClearBackground(text: "SOUND")
        rateUsLabel.setUIButton(title: "RATE US", titleHighlited: "pressed")

        backToMainScreenButton.setUIBackToLvlsButton()
    }
    
    private func setSwitch() {
        soundSwitch.setSwitch()
        vibroSwitch.setSwitch()
    }

    private func setConstraints() {
        
        let width = min( self.frame.width * 95 / 100, 600)  

        parentImage.pin.hCenter().vCenter().width(100%).height(100%)
        
        backToMainScreenButton.pin
            .top(50)
            .left(10)
            .size(60)
        
        settingsLabel.pin
            .below(of: backToMainScreenButton)
            .marginTop(70)
            .width(95%)
            .hCenter()
            .height(60)

        stackViewSound.pin
            .width(width)
            .height(90)
            .hCenter()
            .vCenter()
        
        stackViewVibro.pin
            .below(of: stackViewSound)
            .width(width)
            .height(90)
            .hCenter()
            .marginTop(20)
        
        rateUsLabel.pin
            .below(of: stackViewVibro)
            .width(width)
            .height(90)
            .hCenter()
            .marginTop(20)

    }
}

