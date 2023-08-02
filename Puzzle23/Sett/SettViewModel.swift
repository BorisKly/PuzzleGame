//
//  SettViewModel.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 16.07.2023.
//

import Foundation
import UIKit
import AVFoundation


protocol  SettViewModelProtocol {
    var sound: Sound {get}
    func goToMainScreenButton()
}

class SettViewModel: SettViewModelProtocol {
    
    private var router: Router {
        resolve(Router.self)
    }
    
    var sound: Sound {
        resolve(Sound.self)
    }
        
    func goToMainScreenButton() {
        router.route(to: MainDestination(), animated: true)
    }
}
