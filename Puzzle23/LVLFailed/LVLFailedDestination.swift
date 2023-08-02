//
//  LVLFailedDestination.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 09.07.2023.
//

import UIKit
import XServiceLocator

struct LVLFailedDestination: Destination {
    let currentLevelNumber: Int
    var destination: UIViewController? {
        let register = LVLFailedViewController(viewModel: LVLFailedViewModel(currentLevelNumber: currentLevelNumber))
        return register
    }
}
