//
//  UIView.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 13.07.2023.
//

import UIKit

extension UIView {
    public func setFrameToView() {
       
        let device = UIDevice.current.userInterfaceIdiom
        
        if device == .phone {
            self.layer.borderWidth = 5.0

        } else if device == .pad {
            self.layer.borderWidth = 15.0

        }
        self.backgroundColor = Colors.mintColor
        self.layer.cornerRadius = 10
        self.layer.borderColor = Colors.coralColor.cgColor
    }
}
