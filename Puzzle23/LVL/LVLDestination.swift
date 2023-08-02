//
//  LVLDestination.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 08.07.2023.
//

import UIKit
import XServiceLocator

struct LVLDestination: Destination {
    let levelNumber: Int
    var destination: UIViewController? {
        let register = LVLViewController(viewModel: LVLViewModel(levelNumber: levelNumber))
        return register
    }
}
