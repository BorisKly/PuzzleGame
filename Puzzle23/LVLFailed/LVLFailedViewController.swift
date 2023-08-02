//
//  LVLFailedViewController.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 09.07.2023.
//

import UIKit
import RxSwift

class LVLFailedViewController: UIViewController {
    
    var viewModel: LVLFailedViewModelProtocol

    private let disposeBag = DisposeBag()
        
    private var mainView: LVLFailedView? {
        return self.view as? LVLFailedView
    }
    
    init(viewModel: LVLFailedViewModelProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let codeView = LVLFailedView(frame: CGRect.zero)
        self.view = codeView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        
        
        bindView()
    }
    
    func bindView() {
        mainView?.backToLevelsButton.rx.tap.bind(onNext: { [weak self] in
            self?.viewModel.goToLevels()
        }).disposed(by: disposeBag)
        
        mainView?.reloadLevel.rx.tap.bind(onNext: { [weak self] in
            self?.viewModel.reloadLevel()
        }).disposed(by: disposeBag)
        
   
    }
}
