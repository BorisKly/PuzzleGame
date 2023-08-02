//
//  LVLCompletedDestination.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 09.07.2023.
//

import UIKit
import XServiceLocator

struct LVLCompletedDestination: Destination {
    let time: Int
    let currentLevelNumber: Int
    var destination: UIViewController? {
        let register = LVLCompletedViewController(viewModel: LVLCompletedViewModel(time: time, currentLevelNumber: currentLevelNumber))
        return register
    }
}
