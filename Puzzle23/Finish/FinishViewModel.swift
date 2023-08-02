//
//  FinishViewmodel.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 17.07.2023.
//

import Foundation
import UIKit

protocol  FinishViewModelProtocol {
    func goToMainScreenButton()
}

class FinishViewModel: FinishViewModelProtocol {
    
    private var router: Router {
        resolve(Router.self)
    }

    init() {
    }

    func goToMainScreenButton() {
        router.route(to: MainDestination(), animated: true)
    }
}
