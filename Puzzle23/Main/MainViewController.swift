//
//  MainViewController.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 08.07.2023.
//

import UIKit
import RxSwift
import RxCocoa
import AVFoundation
//import FirebaseAuth

class MainViewController: UIViewController {

    var viewModel: MainViewModelProtocol
    
    var audioPlayer: AVAudioPlayer?

    let disposeBag = DisposeBag()

    public var mainView: MainView? {
        return self.view as? MainView
    }

    init(viewModel: MainViewModelProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let codeView = MainView(frame: CGRect.zero)
        self.view = codeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView?.welcomeLabel.text = "Welcome \n \(String(describing: UserDefaults.standard.string(forKey: "userEmail") ?? ""))!!!"
        bindViewModel()
        
        do {
            if let soundURL = Bundle.main.url(forResource: "click", withExtension: "wav") {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.prepareToPlay()
                print("ready")
            }
        } catch {
            print("eeror load audioFile \(error.localizedDescription)")
        }
    }

    func playClickSound() {
        print("play")
        audioPlayer?.play()
    }
    
    private func bindViewModel() {
//        mainView?.logOutButton.rx.tap.bind(onNext: { _ in
//            do {
//                try Auth.auth().signOut()
//            } catch {
//                print(error)
//            }
//        }).disposed(by: disposeBag)

//        mainView?.settingsButton.rx.tap.bind(onNext: { [weak self] _ in
//            self?.viewModel.goToSettingsScreen()
//        }).disposed(by: disposeBag)

        mainView?.playButton.rx.tap.bind(onNext: { [weak self] _ in
            self?.viewModel.goToLevelsScreen()
        }).disposed(by: disposeBag)
        
        mainView?.settingsButton.rx.tap.bind(onNext: { [weak self] _ in
            self?.viewModel.goToSettingsScreen()
        }).disposed(by: disposeBag)
        
        mainView?.gameRulesButton.rx.tap.bind(onNext: { [weak self] _ in
            self?.viewModel.goToRulesScreen()
        }).disposed(by: disposeBag)
   
    }
}
