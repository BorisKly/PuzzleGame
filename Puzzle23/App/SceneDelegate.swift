//
//  SceneDelegate.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 08.07.2023.
//

import UIKit
//import FirebaseAuth
//import FirebaseDatabase


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    var userEmail: String?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene)
        else { return }

        let window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        self.window = window

        self.window?.windowScene = windowScene

        register(AppRouter(window: window), for: Router.self)
        
        registerObjects()
        
        DispatchQueue.main.async {
            let destination = MainDestination()
            resolve(Router.self).route(to: destination, animated: true)
        }
        
//        Auth.auth().addStateDidChangeListener { (auth, user) in
//            guard user != nil else {
//                let destination = AuthDestination()
//                resolve(Router.self).route(to: destination, animated: true)
//                return
//            }
//            self.userEmail = user?.email
//            print("111\(self.userEmail)")
//            UserDefaults.standard.set(self.userEmail, forKey: "userEmail")
//        }      
    }


    private func registerObjects() {
        let sound = AppSound()
        sound.setUpAudioPlayer()
        sound.setUpTriggerHapticFeedback()
        register(sound, for: Sound.self)
//        let publicService = PublicService() //NetworkService()
//        register(publicService, for: PublicServiceProtocol.self)
    }
}

