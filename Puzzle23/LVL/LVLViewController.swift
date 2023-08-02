//
//  LVLViewController.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 08.07.2023.
//

import UIKit
import RxSwift


class LVLViewController: UIViewController {
    
    var viewModel: LVLViewModelProtocol

    private let disposeBag = DisposeBag()
    
    var arrayOf16Images: [UIImage] = []
    var imageOrder: [Int] = []
    let correctOrder = Array(0...15)

    public var mainView: LVLView? {
        return self.view as? LVLView
    }

    init(viewModel: LVLViewModelProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let codeView = LVLView(frame: CGRect.zero)
        self.view = codeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        arrayOf16Images = PublicService.shared.setArrayOf16Images(viewModel.levelName, mixed: false)
        
        imageOrder = Array(0...15).shuffled()

        mainView?.mixedCollectionOfElementsOfPuzzle.delegate = self
        mainView?.mixedCollectionOfElementsOfPuzzle.dataSource = self
        
        mainView?.correctPuzzle.image = UIImage(named: viewModel.levelName)
        mainView?.levelNumberLabel.setLabelPinkBackWhiteTextColor(text: "LVL-\(viewModel.levelNumber + 1)")
        mainView?.timerLabel.setLabelPinkBackWhiteTextColor(text: "")
        bindView()
    }
    
    private func bindView() { //  Force!!!
        viewModel.timeToFinish.bind(to: (mainView?.timerLabel.rx.text)! ).disposed(by: disposeBag)
    
        mainView?.backToLevelsScreenButton.rx.tap.bind(onNext: { [weak self] _ in
            self?.viewModel.goToLevels()
        }).disposed(by: disposeBag)
        
    }

    
}
