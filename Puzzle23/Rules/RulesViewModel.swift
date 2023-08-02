//
//  RulesViewModel.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 16.07.2023.
//

import UIKit

protocol  RulesViewModelProtocol {
    func goToMainScreenButton() 

}

class RulesViewModel: RulesViewModelProtocol {

    private var router: Router {
        resolve(Router.self)
    }
    
    
    func goToMainScreenButton() {
        router.route(to: MainDestination(), animated: true)
    }
    
    func goToSelectedLvl(selectedLvlNumber: Int){
    }


}
