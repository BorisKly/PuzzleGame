//
//  LVLCompletedViewController.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 09.07.2023.
//

import UIKit
import RxSwift

class LVLCompletedViewController: UIViewController {
    
    var viewModel: LVLCompletedViewModelProtocol

    private let disposeBag = DisposeBag()
    
    var time: Int = 1
    
    private var mainView: LVLCompletedView? {
        return self.view as? LVLCompletedView
    }
    
    init(viewModel: LVLCompletedViewModelProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let codeView = LVLCompletedView(frame: CGRect.zero)
        self.view = codeView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
    }
    
    func bindView() {
        
        viewModel.timeResult.bind(onNext: {[weak self] time in
            let minutes =  (time ?? 0) / 60
            let seconds = (time ?? 0) % 60
            self?.mainView?.timeLabel.text = "Your time is: 0\(minutes) : \(seconds) "
        }).disposed(by: disposeBag)
     
        mainView?.backToLevelsButton.rx.tap.bind(onNext: { [weak self] in
            self?.viewModel.goToLevels()
        }).disposed(by: disposeBag)
        
      
        mainView?.goToNextLevel.rx.tap.bind(onNext: { [weak self] in
                self?.viewModel.goToNextLevel()
        }).disposed(by: disposeBag)
    }
}



