//
//  UISwitch+.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 16.07.2023.
//

import UIKit

extension UISwitch {
    public func setSwitch() {
      
        let device = UIDevice.current.userInterfaceIdiom
        
        if device == .phone {
            self.frame = CGRect(x: 0, y: 0, width: 40, height: 40)

        } else if device == .pad {
            self.frame = CGRect(x: 0, y: 0, width: 90, height: 90)

        }
    }
}
