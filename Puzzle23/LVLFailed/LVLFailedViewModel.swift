//
//  LVLFailedViewModel.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 09.07.2023.
//

import Foundation

protocol  LVLFailedViewModelProtocol {
    var currentLevelNumber: Int {get}
    func goToLevels()
    func reloadLevel()
}

class LVLFailedViewModel: LVLFailedViewModelProtocol {
    
    var currentLevelNumber: Int
    
    private var router: Router {
        resolve(Router.self)
    }
    
    init(currentLevelNumber: Int) {
        self.currentLevelNumber = currentLevelNumber
    }

    func goToLevels() {
        router.route(to: LvlsDestination(), animated: true)
    }

    func reloadLevel() {
         router.route(to: LVLDestination(levelNumber: currentLevelNumber), animated: true)
    }
   

}
