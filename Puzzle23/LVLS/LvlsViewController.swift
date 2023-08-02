//
//  LvlsViewController.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 08.07.2023.
//

import UIKit
import RxSwift
import RxCocoa

class LvlsViewController: UIViewController {

    var viewModel: LvlsViewModelProtocol

    private let disposeBag = DisposeBag()

    private var mainView: LvlsView? {
        return self.view as? LvlsView
    }

    init(viewModel: LvlsViewModelProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let codeView = LvlsView(frame: CGRect.zero)
        self.view = codeView
     
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView?.collectionOfLevels.delegate = self
        mainView?.collectionOfLevels.dataSource = self
        bindView()
    }

    private func bindView() {
        mainView?.backToMainScreenButton.rx.tap.bind(onNext: { [weak self] _ in
            self?.viewModel.goToMainScreenButton()
        }).disposed(by: disposeBag)
    }
}
