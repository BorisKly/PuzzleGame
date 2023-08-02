//
//  RulesViewController.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 16.07.2023.
//

import UIKit
import RxSwift
import RxCocoa

class RulesViewController: UIViewController {

    var viewModel: RulesViewModelProtocol

    private let disposeBag = DisposeBag()

    private var mainView: RulesView? {
        return self.view as? RulesView
    }

    init(viewModel: RulesViewModelProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let codeView = RulesView(frame: CGRect.zero)
        self.view = codeView
     
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
    }

    private func bindView() {
        mainView?.backToMainScreenButton.rx.tap.bind(onNext: { [weak self] _ in
            self?.viewModel.goToMainScreenButton()
        }).disposed(by: disposeBag)
    }
}
