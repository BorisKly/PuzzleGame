//
//  LVLCompletedViewModel.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 09.07.2023.
//


import Foundation
import RxCocoa

protocol  LVLCompletedViewModelProtocol {
   
    var currentLevelNumber: Int {get}
    var time: Int {get}
        
    func goToLevels()
    func goToNextLevel()

    var timeResult: BehaviorRelay<Int?> {get}
}

class LVLCompletedViewModel: LVLCompletedViewModelProtocol {
  
    var numberOfLevels: Int = PublicService.shared.arrayOfLevels.count
    var time: Int
    var currentLevelNumber: Int
    
    var timeResult = BehaviorRelay<Int?>(value: 0)
    
    private var router: Router {
        resolve(Router.self)
    }
    
    init(time: Int, currentLevelNumber: Int) {
        self.time = time
        self.currentLevelNumber = currentLevelNumber
        timeResult.accept(time)
        print(numberOfLevels)
        print(currentLevelNumber)
    }

    
    func goToLevels() {
        router.route(to: LvlsDestination(), animated: true)
    }
    
    func goToNextLevel() {
        router.route(to: (currentLevelNumber + 1) < numberOfLevels ? LVLDestination(levelNumber: currentLevelNumber + 1) : FinishDestination(), animated: true)
    }
 

}
