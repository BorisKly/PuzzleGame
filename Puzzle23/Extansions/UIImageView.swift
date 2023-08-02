//
//  UIImageView.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 08.07.2023.
//

import UIKit

extension UIImageView {
    func setParentImage() {
        self.image = UIImage(named: "backgroundImage")
        self.contentMode = .scaleAspectFill
    }
}

