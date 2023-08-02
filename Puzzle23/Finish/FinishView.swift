//
//  FinishView.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 17.07.2023.
//

import UIKit
import PinLayout

class FinishView: UIView {

    let parentImage = UIImageView()

    let backToMainScreenButton = UIButton()

    let finishLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
        
        self.addSubview(parentImage)
        self.sendSubviewToBack(parentImage)
        
        self.addSubview(backToMainScreenButton)
        addSubview(finishLabel)
        
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
        backToMainScreenButton.setUIBackToLvlsButton()
        finishLabel.setLabelWithPinkColorAndClearBackground(text: "Game Over!!!")
    }

    private func setConstraints() {
    
        let width = min( self.frame.width * 0.95, 600)

        parentImage.pin.hCenter().vCenter().width(100%).height(100%)

        backToMainScreenButton.pin
            .size(60).left(10).top(30)
        finishLabel.pin
            .hCenter()
            .width(width)
            .vCenter()
            .height(90)
    }
}
