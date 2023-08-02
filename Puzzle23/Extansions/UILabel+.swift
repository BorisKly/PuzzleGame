//
//  UILabel+.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 08.07.2023.
//

import UIKit

extension UILabel {
    
    public func setLabelPinkBackWhiteTextColor (text: String) {
        
        let device = UIDevice.current.userInterfaceIdiom // router

        if device == .phone {
            self.font = Fonts.fontKnewave33
            self.frame.size.height = 60
        } else if device == .pad {
            self.font = Fonts.fontKnewave70
            self.frame.size.height = 90

        }
        
        self.text = text
        self.textColor = Colors.colorWhite
        self.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        self.layer.masksToBounds = true
        self.textAlignment = .center
        self.numberOfLines = 0
        self.backgroundColor = Colors.pinkColor
    }
    
    public func setLabelWithPinkColorAndClearBackground (text: String) {
        
        let device = UIDevice.current.userInterfaceIdiom

        if device == .phone {
            self.font = Fonts.fontKnewave33
        } else if device == .pad {
            self.font = Fonts.fontKnewave70
        }
        
        self.text = text
        self.textColor = Colors.pinkColor
        self.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        self.layer.masksToBounds = true
        self.textAlignment = .center
        self.numberOfLines = 0
        self.backgroundColor = .clear
    }
    
    public func setLabelWithPinkColorAndClearBackgroundSmallFont (text: String) {
        let device = UIDevice.current.userInterfaceIdiom

        if device == .phone {
            self.font = Fonts.fontKnewave22
        } else if device == .pad {
            self.font = Fonts.fontKnewave40
        }
        
        self.text = text
        self.textColor = Colors.pinkColor
        self.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        self.layer.masksToBounds = true
        self.textAlignment = .center
        self.numberOfLines = 0
        self.backgroundColor = .clear
    }
}
