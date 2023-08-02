//
//  UIStackView+.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 16.07.2023.
//

import UIKit

extension UIStackView {
    public func setStackView() {
        
        let device = UIDevice.current.userInterfaceIdiom
        
        if device == .phone {
            self.frame.size.height = 40
        } else if device == .pad {
            self.frame.size.height = 90
        }
    }
    
}
