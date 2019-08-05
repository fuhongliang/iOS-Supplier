//
//  UMenuBusinessData.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/25.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UMenuBusinessData: UBaseTableViewCell {

    var menuIcon: UIImageView = {
        let iv = UIImageView()
        return iv
    }()

    var decrsLabel: UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 12)
        tl.textColor = UIColor.hex(hexString: "#333333")
        tl.text = "经营数据"
        return tl
    }()

    override func configUI() {
        menuIcon.image = UIImage.init(named: "menu_business_data")
        self.addSubview(menuIcon)
        menuIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalToSuperview()
        }

        self.addSubview(decrsLabel)
        decrsLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalToSuperview()
            ConstraintMaker.top.equalTo(menuIcon.snp.bottom).offset(8)
        }
    }
}

