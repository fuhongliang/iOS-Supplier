//
//  UOrderDetailInfoCell.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/17.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UOrderDetailInfoCell : UBaseTableViewCell {
    
    let cellHeight = 111
    
    let threeItemHeight = 86
    
    var freightLeftLaber = UILabel()
    var freightRightLaber = UILabel()
    var orderAmountLeftLaber = UILabel()
    var orderAmountRightLaber = UILabel()
    var bgModifypPriceLeftLaber = UILabel()
    var bgModifypPriceRightLaber = UILabel()
    var actualAmountLeftLaber = UILabel()
    var actualAmountRightLaber = UILabel()
    
    var freightLayer = UIView()
    var orderAmountLayer = UIView()
    var bgModifyPriceLayer = UIView()
    var actualAmountLayer = UIView()
    
    override func configUI() {
        
        //MARK:运费
        contentView.addSubview(freightLayer)
        freightLayer.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalToSuperview().offset(5)
            ConstraintMaker.left.right.equalToSuperview()
            ConstraintMaker.height.equalTo(25)
        }
        
        freightLeftLaber.text = "运费"
        freightLeftLaber.textColor = UIColor.hex(hexString: "#999999")
        freightLeftLaber.font = UIFont.systemFont(ofSize: 14)
        freightLayer.addSubview(freightLeftLaber)
        freightLeftLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.width.equalTo(75)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        freightRightLaber.text = "0.00元"
        freightRightLaber.textColor = UIColor.hex(hexString: "#333333")
        freightRightLaber.textAlignment = .left
        freightRightLaber.font = UIFont.systemFont(ofSize: 14)
        freightLayer.addSubview(freightRightLaber)
        freightRightLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalToSuperview()
//            ConstraintMaker.width.equalToSuperview()
            ConstraintMaker.left.equalTo(freightLeftLaber.snp.right)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        
        //MARK:下单金额
        contentView.addSubview(orderAmountLayer)
        orderAmountLayer.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.equalToSuperview()
            ConstraintMaker.top.equalTo(freightLayer.snp.bottom)
            ConstraintMaker.height.equalTo(25)
        }
        
        orderAmountLeftLaber.text = "下单金额"
        orderAmountLeftLaber.textColor = UIColor.hex(hexString: "#999999")
        orderAmountLeftLaber.font = UIFont.systemFont(ofSize: 14)
        orderAmountLayer.addSubview(orderAmountLeftLaber)
        orderAmountLeftLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        orderAmountRightLaber.text = "7860.00元"
        orderAmountRightLaber.textColor = UIColor.hex(hexString: "#333333")
        orderAmountRightLaber.font = UIFont.systemFont(ofSize: 14)
        orderAmountRightLaber.textAlignment = .right
        orderAmountLayer.addSubview(orderAmountRightLaber)
        orderAmountRightLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.left.equalTo(orderAmountLeftLaber.snp.right)
        }
        
        //MARK:后台改价
        
        contentView.addSubview(bgModifyPriceLayer)
        bgModifyPriceLayer.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.equalToSuperview()
            ConstraintMaker.top.equalTo(orderAmountLayer.snp.bottom)
            ConstraintMaker.height.equalTo(25)
        }
        
        bgModifypPriceLeftLaber.text = "后台改价"
        bgModifypPriceLeftLaber.textColor = UIColor.hex(hexString: "#999999")
        bgModifypPriceLeftLaber.font = UIFont.systemFont(ofSize: 14)
        bgModifyPriceLayer.addSubview(bgModifypPriceLeftLaber)
        bgModifypPriceLeftLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        
        bgModifypPriceRightLaber.text = "优惠: 1元"
        bgModifypPriceRightLaber.textColor = UIColor.hex(hexString: "#333333")
        bgModifypPriceRightLaber.font = UIFont.systemFont(ofSize: 14)
        bgModifypPriceRightLaber.textAlignment = .right
        bgModifyPriceLayer.addSubview(bgModifypPriceRightLaber)
        bgModifypPriceRightLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.left.equalTo(bgModifypPriceLeftLaber.snp.right)
        }
        //MARK:实付金额
        
        contentView.addSubview(actualAmountLayer)
        actualAmountLayer.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.equalToSuperview()
            ConstraintMaker.top.equalTo(bgModifyPriceLayer.snp.bottom)
            ConstraintMaker.height.equalTo(25)
        }
        
        actualAmountLeftLaber.text = "实付金额"
        actualAmountLeftLaber.textColor = UIColor.hex(hexString: "#999999")
        actualAmountLeftLaber.font = UIFont.systemFont(ofSize: 14)
        actualAmountLayer.addSubview(actualAmountLeftLaber)
        actualAmountLeftLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        
        actualAmountRightLaber.text = "589.00元"
        actualAmountRightLaber.textColor = UIColor.hex(hexString: "#333333")
        actualAmountRightLaber.font = UIFont.systemFont(ofSize: 14)
        actualAmountRightLaber.textAlignment = .right
        actualAmountLayer.addSubview(actualAmountRightLaber)
        actualAmountRightLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.left.equalTo(actualAmountLeftLaber.snp.right)
        }
    }
    
}
