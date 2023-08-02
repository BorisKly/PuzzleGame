//
//  UIButton+.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 08.07.2023.
//

import UIKit

extension UIButton {
    
    var sound: Sound {
        resolve(Sound.self)
    }

    public func setUIButton(title: String, titleHighlited: String) {
        
        let userDefaults = UserDefaults.standard
        let device = UIDevice.current.userInterfaceIdiom
        
        if device == .phone {
            self.titleLabel?.font = Fonts.fontKnewave33

        } else if device == .pad {
            self.titleLabel?.font = Fonts.fontKnewave70

        }
        self.backgroundColor =  Colors.pinkColor
        self.setTitleColor(Colors.colorWhite, for: .normal)
        self.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        self.setTitle(title, for: .normal)
        self.setTitle(titleHighlited, for: .highlighted)
        if userDefaults.bool(forKey: "sound") {
            self.addTarget(self, action: #selector(playSound), for: .touchUpInside)}
    }
    
    public func setUIBackToLvlsButton() {
        
        let userDefaults = UserDefaults.standard
        let device = UIDevice.current.userInterfaceIdiom
        
        if device == .phone {
            self.frame = CGRect(x: 10, y: 30, width: 50, height: 50)
        } else if device == .pad {
            self.frame = CGRect(x: 20, y: 20, width: 120, height: 120)
        }
        self.backgroundColor = .clear
        self.tintColor = Colors.pinkColor
        
        self.layer.cornerRadius = CGFloat(CornerRadius.forRoundButtons)
        let vector = UIImage(systemName: "arrowshape.turn.up.backward.fill")
        self.setBackgroundImage(vector, for: .normal)
        if userDefaults.bool(forKey: "sound") { self.addTarget(self, action: #selector(playSound), for: .touchUpInside)}
    }
    
    @objc func playSound() {
        sound.playClickSound()
    }
}




