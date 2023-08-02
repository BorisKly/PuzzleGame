//
//  LVLViewModel.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 08.07.2023.
//

import UIKit
import RxCocoa

protocol  LVLViewModelProtocol {
    var levelNumber: Int {get}
    var levelName: String {get}
    var totalTime: Int {get}
    var time: Int {get}
    
    var timeToFinish: BehaviorRelay<String?> {get}
  
    func goToLevels()
    func levelCompleted(time: Int)

}

class LVLViewModel: LVLViewModelProtocol {
  
    var timer: Timer?
    let timeToFinish = BehaviorRelay<String?>(value: nil)

    var levelNumber: Int
    
    var levelName: String {
        "l\(levelNumber).pdf"
    }
    
    var  totalTime: Int {
        60 * 3 - (10 * levelNumber)
    }
    
    var time = 60 * 3  {
        didSet {
            timeToFinish.accept("0\(time / 60): \(time % 60)")
        }
    }
    
    init(levelNumber: Int) {
        self.levelNumber = levelNumber
        time = totalTime
        setTimer()
    }

    private var router: Router {
        resolve(Router.self)
    }
    
    private func setTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(tick) ,
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func tick(){
        time -= 1
        print(time)
        if time == 0 {
            timer?.invalidate()
            attemptFailed()
        }
    }
    
    private func attemptFailed() {
        router.route(to: LVLFailedDestination(currentLevelNumber: levelNumber), animated: true)
    }
    
    public func goToLevels() {
        timer?.invalidate()
        router.route(to: LvlsDestination(), animated: true)
    }

    public func levelCompleted(time: Int) {
        timer?.invalidate()
        let modifiedString = UserRecords.shared.levelsCompleted
        let index = modifiedString.index(modifiedString.startIndex, offsetBy: levelNumber + 1)
        UserRecords.shared.levelsCompleted = modifiedString.prefix(upTo: index) + " 1" + modifiedString.suffix(from: index) 
        router.route(to: LVLCompletedDestination(time: time, currentLevelNumber: levelNumber), animated: true)
    }

}
