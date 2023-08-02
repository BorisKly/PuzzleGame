//
//  MainViewModel.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 08.07.2023.
//

import Foundation
import UIKit

protocol  MainViewModelProtocol {
        
    func goToSettingsScreen()
    func goToLevelsScreen()
    func goToRulesScreen()
}

class MainViewModel: MainViewModelProtocol {
    
    private var router: Router {
        resolve(Router.self)
    }

    init() {
    }

    func goToSettingsScreen() {        
        let destination = SettDestination()
        router.route(to: destination, animated: true)
    }

    func goToLevelsScreen() {
        let destination = LvlsDestination()
        router.route(to: destination, animated: true)
    }
    
    func goToRulesScreen() {
        let destination = RulesDestination()
        router.route(to: destination, animated: true)
    }

}
