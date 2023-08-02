//
//  FinishDestination.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 17.07.2023.
//

import UIKit
import XServiceLocator

struct FinishDestination: Destination {

    var destination: UIViewController? {
        let register = FinishViewController(viewModel: FinishViewModel())
        return register
    }
    
}
