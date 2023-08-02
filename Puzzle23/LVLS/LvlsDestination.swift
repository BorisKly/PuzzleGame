//
//  LvlsDestination.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 08.07.2023.
//


import UIKit
import XServiceLocator

struct LvlsDestination: Destination {
    var destination: UIViewController? {
        let register = LvlsViewController(viewModel: LvlsViewModel())
        return register
    }
}
