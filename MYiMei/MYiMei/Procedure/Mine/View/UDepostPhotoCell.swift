//
//  UDepostPhotoCell.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/7/11.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UDepostPhotoCell: UBaseTableViewCell {

    var depostPhoto = UIImageView()

    override func configUI() {
        self.backgroundColor = UIColor.white
        self.addSubview(depostPhoto)
        depostPhoto.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(130)
        }
    }
}

