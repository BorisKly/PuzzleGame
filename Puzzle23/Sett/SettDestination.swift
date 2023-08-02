//
//  SetDestination.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 16.07.2023.
//


import UIKit
import XServiceLocator

struct SettDestination: Destination {

    var destination: UIViewController? {
        let register = SettViewController(viewModel: SettViewModel())
        return register
    }
}
