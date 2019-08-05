//
//  UCategoryCell.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/25.
//  Copyright © 2019 符宏梁. All rights reserved.
//


import UIKit

class UCategoryCell: UBaseTableViewCell {

    var categoryLabel = UILabel()

    var categoryImageView = UIImageView()

    override func configUI() {
        self.backgroundColor = UIColor.white
        categoryImageView.backgroundColor = UIColor.theme
        categoryImageView.layer.masksToBounds = true
        categoryImageView.layer.cornerRadius = 1
        self.addSubview(categoryImageView)
        categoryImageView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.width.equalTo(3)
            ConstraintMaker.height.equalTo(25)
            ConstraintMaker.centerY.equalToSuperview()
        }

        categoryLabel.font = UIFont.systemFont(ofSize: 14)
        categoryLabel.textColor = UIColor.hex(hexString: "#666666")
        categoryLabel.text = "现代系列"
        self.addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(14)
            ConstraintMaker.centerY.equalToSuperview()
        }
    }

    var model: CategoryModel? {
        didSet {
            guard let model = model else { return }
            categoryLabel.text = model.name
        }
    }
}
