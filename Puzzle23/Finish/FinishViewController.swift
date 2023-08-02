//
//  FinishViewController.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 17.07.2023.
//

import UIKit
import RxSwift
import RxCocoa

class FinishViewController: UIViewController {

    var viewModel: FinishViewModelProtocol

    let disposeBag = DisposeBag()

    public var mainView: FinishView? {
        return self.view as? FinishView
    }

    init(viewModel: FinishViewModelProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let codeView = FinishView(frame: CGRect.zero)
        self.view = codeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    private func bindViewModel() {
        mainView?.backToMainScreenButton.rx.tap.bind(onNext: { [weak self]  in
            self?.viewModel.goToMainScreenButton()
        }).disposed(by: disposeBag)
    }
}
