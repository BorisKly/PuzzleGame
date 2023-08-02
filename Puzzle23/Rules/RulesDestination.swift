//
//  RulesDestination.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 16.07.2023.
//

import UIKit
import XServiceLocator

struct RulesDestination: Destination {
    var destination: UIViewController? {
        let register = RulesViewController(viewModel: RulesViewModel())
        return register
    }
}
