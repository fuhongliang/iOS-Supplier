//
//  UDepostStatusCell.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/7/11.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UDepostStatusCell: UBaseTableViewCell {

    var depostStatusIcon = UIImageView()

    var depostStatusLabel = UILabel()

    var depostBg = UIImageView()

    var depostAmountDescLabel = UILabel()

    var depostAmountNumberLabel = UILabel()

    override func configUI() {

        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        //MARK:保证金审核图标
        depostStatusIcon.image = UIImage.init(named: "review")
        self.addSubview(depostStatusIcon)
        depostStatusIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(25)
            ConstraintMaker.top.equalToSuperview().offset(15)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        
        //MARK:保证金审核中
        depostStatusLabel.text = "保证金审核中"
        depostStatusLabel.textColor = UIColor.hex(hexString: "#1D9EFF")
        depostStatusLabel.font = UIFont.boldSystemFont(ofSize: 17)
        self.addSubview(depostStatusLabel)
        depostStatusLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalToSuperview().offset(19)
            ConstraintMaker.left.equalTo(depostStatusIcon.snp.right).offset(10)
        }

        //MARK:保证金背景
        depostBg.backgroundColor = UIColor.white
        self.addSubview(depostBg)
        depostBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.top.equalTo(depostStatusIcon.snp.bottom).offset(16)
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
        }

        //MARK:保证金总金额
        depostAmountDescLabel.text = "保证金总金额"
        depostAmountDescLabel.textColor = UIColor.hex(hexString: "#010101")
        depostAmountDescLabel.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(depostAmountDescLabel)
        depostAmountDescLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(depostBg.snp.top).offset(15)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }

        //MARK:保证金金额数字
        depostAmountNumberLabel.text = "￥1506.00"
        depostAmountNumberLabel.textColor = UIColor.hex(hexString: "#FF4444")
        depostAmountNumberLabel.font = UIFont.boldSystemFont(ofSize: 15)
        self.addSubview(depostAmountNumberLabel)
        depostAmountNumberLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(depostBg.snp.top).offset(17)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }

    }
}

