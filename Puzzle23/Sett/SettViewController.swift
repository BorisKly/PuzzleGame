//
//  SettViewController.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 16.07.2023.
//

import UIKit
import RxCocoa
import RxSwift

class SettViewController: UIViewController {

    var viewModel: SettViewModelProtocol
    let userDefaults = UserDefaults.standard

    private let disposeBag = DisposeBag()

    private var mainView: SettView? {
        return self.view as? SettView
    }

    init(viewModel: SettViewModelProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let codeView = SettView(frame: CGRect.zero)
        self.view = codeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView?.soundSwitch.isOn = userDefaults.bool(forKey: "sound")
        mainView?.vibroSwitch.isOn = userDefaults.bool(forKey: "vibro")
        bindView()
    }

    func bindView() {
        
        mainView?.soundSwitch.rx.isOn.bind(onNext: { sender in
            self.userDefaults.set(sender, forKey: "sound")
            self.userDefaults.synchronize()
        }).disposed(by: disposeBag)

        mainView?.vibroSwitch.rx.isOn.bind(onNext: { sender in
            self.userDefaults.set(sender, forKey: "vibro")
            self.userDefaults.synchronize()
        }).disposed(by: disposeBag)
        
        mainView?.backToMainScreenButton.rx.tap.bind(onNext: { [weak self] _ in
            self?.viewModel.goToMainScreenButton()
        }).disposed(by: disposeBag)
    }
}
