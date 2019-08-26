//
//  UOrderDetailInfoHavePhoneCell.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/6.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UOrderDetailInfoHavePhoneCell : UBaseTableViewCell {
    
    var callTheClient : (() -> ())?
    
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
    
    //MARK:灰色背景
    var grayBg : UIView = {
        let uv = UIView()
        uv.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        uv.layer.cornerRadius = 3
        uv.layer.masksToBounds = true
        return uv
    }()
    
    //MARK:用户名称
    var userNameLabel : UILabel = {
        let ul = UILabel()
        ul.text = "张铭名"
        ul.textColor = UIColor.black
        ul.font = UIFont.boldSystemFont(ofSize: 14)
        return ul
    }()
    
    //MARK:用户手机号
    var userPhoneLabel: UILabel = {
        let ul = UILabel()
        ul.text = "13467894321"
        ul.textColor = UIColor.black
        ul.font = UIFont.boldSystemFont(ofSize: 14)
        return ul
    }()
    
    //MARK:联系收货人
    var contactReceiverLabel : UILabel = {
        let ul = UILabel()
        ul.text = "联系团长"
        ul.textColor = UIColor.hex(hexString: "#1C98F6")
        ul.font = UIFont.systemFont(ofSize: 12)
        return ul
    }()
    
    //MARK:电话图标
    var phoneIcon : UIImageView = {
        let uiv = UIImageView()
        uiv.image = UIImage.init(named: "phoneIcon")
        return uiv
    }()
    
    //MARK:详细地址
    var addressLabel : UILabel = {
        let ul = UILabel()
        ul.text = "详细地址"
        ul.textColor = UIColor.hex(hexString: "##999999")
        ul.font = UIFont.systemFont(ofSize: 11)
        return ul
    }()
    
    var contactBtn : UIButton = {
        let ub = UIButton()
        return ub
    }()
    
//    //MARK:第五行的右边文本
//    var fiveLabel : UILabel = {
//        let ul = UILabel()
//        ul.text = ""
//        ul.textColor = UIColor.hex(hexString: "#999999")
//        ul.font = UIFont.systemFont(ofSize: 14)
//        return ul
//    }()
//
//    //MARK:第五行的左边内容文本
//    var fiveContentLabel : UILabel = {
//        let ul = UILabel()
//        ul.text = ""
//        ul.textColor = UIColor.hex(hexString: "#999999")
//        ul.font = UIFont.systemFont(ofSize: 14)
//        return ul
//    }()
//
//    //MARK:第五行文本的容器
//    var fiveLayer : UIView = {
//        let uv = UIView()
//        return uv
//    }()
    
    override func configUI() {
        
        //MARK:灰色背景
        contentView.addSubview(grayBg)
        grayBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(58)
        }
        
        //MARK:用户名称
        contentView.addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(grayBg.snp.left).offset(10)
            ConstraintMaker.top.equalTo(grayBg).offset(13)
        }
        
        //MARK:用户电话
        contentView.addSubview(userPhoneLabel)
        userPhoneLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(userNameLabel.snp.right).offset(25)
            ConstraintMaker.centerY.equalTo(userNameLabel)
        }
        
        //MARK:联系收货人
        contentView.addSubview(contactReceiverLabel)
        contactReceiverLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalTo(userNameLabel)
            ConstraintMaker.right.equalTo(grayBg.snp.right).offset(-10)
        }
        
        //MARK:电话图标
        contentView.addSubview(phoneIcon)
        phoneIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalTo(userNameLabel)
            ConstraintMaker.right.equalTo(contactReceiverLabel.snp.left).offset(-6)
        }
        
        //MARK:详细地址
        contentView.addSubview(addressLabel)
        addressLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.bottom.equalTo(grayBg).offset(-12)
            ConstraintMaker.left.equalTo(grayBg).offset(10)
        }
        
        contentView.addSubview(contactBtn)
        contactBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.left.equalTo(grayBg)
            ConstraintMaker.width.height.equalTo(grayBg)
        }
        contactBtn.addTarget(self, action: #selector(tapCallTheClient), for: UIControl.Event.touchUpInside)
        
        
        //MARK:运费
        contentView.addSubview(freightLayer)
        freightLayer.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(grayBg.snp.bottom).offset(15)
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
        freightRightLaber.textAlignment = .right
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
        
//        contentView.addSubview(fiveLayer)
//        fiveLayer.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.left.right.equalToSuperview()
//            ConstraintMaker.top.equalTo(actualAmountLayer.snp.bottom)
//            ConstraintMaker.height.equalTo(25)
//        }
//
//        fiveLayer.addSubview(fiveLabel)
//        fiveLabel.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.centerY.equalToSuperview()
//            ConstraintMaker.left.equalToSuperview().offset(15)
//        }
//        
//        //MARK:第五行内容文本
//        fiveLayer.addSubview(fiveContentLabel)
//        fiveContentLabel.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.centerY.equalToSuperview()
//            ConstraintMaker.right.equalToSuperview().offset(-15)
//            ConstraintMaker.left.equalTo(actualAmountLeftLaber.snp.right)
//        }
    }
    
    @objc func tapCallTheClient(){
        callTheClient?()
    }
    
}
