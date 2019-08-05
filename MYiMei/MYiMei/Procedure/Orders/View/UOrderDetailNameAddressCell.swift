//
//  UOrderDetailNameAddressCell.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/17.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UOrderDetailNameAddressCell : UBaseTableViewCell {
    
    var cellHeight = 68
    
    var userNameLabel : UILabel = {
        let ul = UILabel()
        ul.text = "张先生"
        ul.textColor = UIColor.black
        ul.font = UIFont.boldSystemFont(ofSize: 17)
        return ul
    }()
    
    var receiptIcon : UIImageView = {
        let receiptIcon = UIImageView()
        receiptIcon.image = UIImage.init(named: "receipt")
        return receiptIcon
    }()
    var userPhoneLabel : UILabel = {
        let ul = UILabel()
        ul.text = "15743984389"
        ul.textColor = UIColor.hex(hexString: "#1C98F6")
        ul.font = UIFont.boldSystemFont(ofSize: 17)
        return ul
    }()
    
    var addressLabel : UILabel = {
        let ul = UILabel()
        ul.text = "地址: 广东省深圳市南山区松柏783号"
        ul.textColor = UIColor.hex(hexString: "#999999")
        ul.font = UIFont.systemFont(ofSize: 14)
        return ul
    }()
    
    var addressIcon : UIImageView = {
        let addressIcon = UIImageView()
        addressIcon.image = UIImage.init(named: "address")
        return addressIcon
    }()
    
    
    override func configUI() {
        //MARK:用户名称
        contentView.addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalToSuperview().offset(13)
            ConstraintMaker.left.equalToSuperview().offset(36)
        }
        
        //MARK:收货图标
        contentView.addSubview(receiptIcon)
        receiptIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.size.equalTo(13)
            ConstraintMaker.centerY.equalTo(userNameLabel)
            ConstraintMaker.left.equalToSuperview().offset(13.5)
        }
        
        //MARK:用户电话号码
        contentView.addSubview(userPhoneLabel)
        userPhoneLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalTo(userNameLabel)
            ConstraintMaker.left.equalTo(userNameLabel.snp.right).offset(24)
        }
        
        //MARK:地址
        contentView.addSubview(addressLabel)
        addressLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(userNameLabel)
            ConstraintMaker.top.equalTo(userNameLabel.snp.bottom).offset(10)
        }
        
        //MARK:地址图标
        contentView.addSubview(addressIcon)
        addressIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalTo(addressLabel)
            ConstraintMaker.height.equalTo(13)
            ConstraintMaker.width.equalTo(10)
            ConstraintMaker.centerX.equalTo(receiptIcon)
        }
    }
    
}
