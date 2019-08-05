//
//  UDataCell.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/25.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UDataCell: UBaseTableViewCell {


    var dataLabel: UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 21)
        tl.textColor = UIColor.white
        tl.text = "0.00"
        return tl
    }()

    var decrsLabel: UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 12)
        tl.textColor = UIColor.white
        tl.text = "今日订单收入/元"
        return tl
    }()

    override func configUI() {
        contentView.addSubview(dataLabel)
        dataLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalToSuperview()
        }

        contentView.addSubview(decrsLabel)
        decrsLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalToSuperview()
            ConstraintMaker.top.equalTo(dataLabel.snp.bottom).offset(8)
        }
    }
}

