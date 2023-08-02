//
//  AppSound.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 19.07.2023.
//

import UIKit
import AVFoundation

protocol Sound {
    
    var audioPlayer: AVAudioPlayer? {get}
    
    @discardableResult
    
    func setUpAudioPlayer()
    func playClickSound()
    func setUpTriggerHapticFeedback()
    func makeVibro()
}

class AppSound: Sound {
  
    var audioPlayer: AVAudioPlayer?
    var audioPlayerLvlCompleted: AVAudioPlayer?
    let feedbackGenertator = UIImpactFeedbackGenerator(style: .light)

    func setUpAudioPlayer() {
        do {
            if let soundURL = Bundle.main.url(forResource: "click", withExtension: "wav") {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.prepareToPlay()
            }
        } catch {
            print("eeror load audioFile \(error.localizedDescription)")
        }
    }
    
    func setUpTriggerHapticFeedback() {
        feedbackGenertator.prepare()
    }
    
    func makeVibro() {
        feedbackGenertator.impactOccurred()
    }
    
    func playClickSound() {
        print("play")
        audioPlayer?.play()
    }
}
