//
//  LvlsViewModel.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 08.07.2023.
//

import UIKit

protocol  LvlsViewModelProtocol {
    var selectedLevel: Int {get set}
    func goToMainScreenButton()
    
    func goToSelectedLvl(selectedLvlNumber: Int)
}

class LvlsViewModel: LvlsViewModelProtocol {

    
    var selectedLevel: Int = 1

    private var router: Router {
        resolve(Router.self)
    }
    
    
    func goToMainScreenButton() {
        router.route(to: MainDestination(), animated: true)
    }
    
    func goToSelectedLvl(selectedLvlNumber: Int){
        router.route(to: LVLDestination(levelNumber: selectedLvlNumber), animated: true)
    }


}
