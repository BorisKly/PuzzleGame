//
//  UserRecords.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 14.07.2023.
//

import Foundation

class UserRecords {
    
    private let levelsCopletedKeyForUserDefaults = "levelsCompleted"
    
    static let shared = UserRecords()
    let startAllowedLevels = "1" + String(repeating: "0", count: PublicService.shared.arrayOfLevels.count - 1 )
    private init() {}
    
    var levelsCompleted: String {
        get {
            return UserDefaults.standard.string(forKey: levelsCopletedKeyForUserDefaults) ?? startAllowedLevels
        }
        set {
            UserDefaults.standard.set(newValue, forKey: levelsCopletedKeyForUserDefaults)
        }
    }
    
    
    
}
