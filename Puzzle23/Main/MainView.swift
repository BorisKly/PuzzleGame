//
//  MainView.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 08.07.2023.
//

import UIKit
import PinLayout

class MainView: UIView {

    let parentImage = UIImageView()

    let logOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("LogOut", for: .normal)
        button.setTitleColor(Colors.pinkColor, for: .normal)
        button.setTitleColor(.green, for: .highlighted)
        button.titleLabel?.font = Fonts.fontKnewave33
        return button
    }()

    let welcomeLabel = UILabel()

    private let candyImage: UIImageView = {
        let image = UIImageView()
        let candyImage = UIImage(named: "candy")
        image.image = candyImage
        image.contentMode = .scaleAspectFill
        return image
    }()

    public let playButton = UIButton()
    public let settingsButton = UIButton()
    public let gameRulesButton = UIButton()
    public let privacyPolicyButton = UIButton()

    let stackViewOfButtons: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green

        self.addSubview(parentImage)
        self.sendSubviewToBack(parentImage)

        self.addSubview(logOutButton)
        self.addSubview(welcomeLabel)

        self.addSubview(candyImage)
        self.addSubview(stackViewOfButtons)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
       
        parentImage.setParentImage()
        
        addButtonsToStackView()
       
        setConstraints()
        setLabel()
    }
    
    private func setLabel() {
        welcomeLabel.setLabelWithPinkColorAndClearBackground(text: "WELCOME!!!")
    }

    private func addButtonsToStackView() {
        stackViewOfButtons.addArrangedSubview(playButton)
        stackViewOfButtons.addArrangedSubview(settingsButton)
        stackViewOfButtons.addArrangedSubview(gameRulesButton)
       // stackViewOfButtons.addArrangedSubview(privacyPolicyButton)

        playButton.setUIButton(title: "PLAY", titleHighlited: "pressed")
        settingsButton.setUIButton(title: "SETTINGS", titleHighlited: "pressed")
        gameRulesButton.setUIButton(title: "GAME RULES", titleHighlited: "pressed")
        privacyPolicyButton.setUIButton(title: "PRIVACY POLICY", titleHighlited: "pressed")
    }

    private func setConstraints() {
    
        parentImage.pin.hCenter().vCenter().width(100%).height(100%)

        logOutButton.pin.left(2).top(40).width(200).height(50)

        welcomeLabel.pin.below(of: logOutButton).marginTop(10).width(90%).height(150).hCenter()

        candyImage.pin.below(of: welcomeLabel).marginTop(2)
            .size(22%).hCenter()

        stackViewOfButtons.pin
            .below(of: candyImage)
            .height(35%)
            .hCenter()
            .width(90%)
            .maxWidth(600)
            .marginTop(40)


    }
}
