//
//  LVLViewCell.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 08.07.2023.
//

import UIKit
import PinLayout

class LVLViewCell: UICollectionViewCell {

    private let imageCell: UIImageView = {
      let image = UIImageView()
        image.backgroundColor = .systemGreen
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame:frame)
        addSubview(imageCell)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setConstraints() {
//        imageCell.pin
//            .all(0)
    }
}
