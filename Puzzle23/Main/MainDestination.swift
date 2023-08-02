//
//  MainDestination.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 08.07.2023.
//

import UIKit
import XServiceLocator

struct MainDestination: Destination {

    var destination: UIViewController? {
        let register = MainViewController(viewModel: MainViewModel())
        return register
    }
    
}
