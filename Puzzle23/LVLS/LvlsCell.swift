//
//  LvlsCell.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 08.07.2023.
//


import UIKit
import PinLayout

class LvlsCell: UICollectionViewCell {

    let imageCell: UIImageView = {
      let image = UIImageView()
        image.backgroundColor = .green
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame:frame)
        addSubview(imageCell)
      //  setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setImageToCell(with name: String, isLvlAllowedToPlay: Bool) {
     
        let cellWidth = frame.width
        let cellHeight = frame.height
        
        let image = UIImage(named: name)
        let imageCandy = UIImage(named: "image21")

        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cellWidth, height: cellHeight))
        let imageViewCandy = UIImageView(frame: CGRect(x: 0, y: 0, width: cellWidth, height: cellHeight))
        imageView.image = image
        imageViewCandy.image = imageCandy
        
        contentView.addSubview(imageView)
        contentView.addSubview(imageViewCandy)
        if isLvlAllowedToPlay == true  { imageView.layer.zPosition = 1;  isUserInteractionEnabled = true} else {
                imageViewCandy.layer.zPosition = 1;
                isUserInteractionEnabled = false;
                imageView.alpha = 0.5 }
    }
    
    private func setConstraints() {
        imageCell.pin
            .all(0)
    }
}
