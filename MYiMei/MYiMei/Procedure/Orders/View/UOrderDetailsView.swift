//
//  UOrderDetailsView.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/4.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import SnapKit
import KMPlaceholderTextView

class UOrderDetailsView: BaseView {
    
    //字段说明
    var orderStatusLaber = UILabel()
//    var orderDetailsLaber = UILabel()
//    var userNameLaber = UILabel()
//    var userPhoneLaber = UILabel()
//    var addressLaber = UILabel()
//    var orderNumberLeftLaber = UILabel()
//    var orderNumberRightLaber = UILabel()
//    var orderTimeLeftLaber = UILabel()
//    var orderTimeRighrLaber = UILabel()
//    var payModeLeftLaber = UILabel()
//    var payModeRightLaber = UILabel()
//    var freightLeftLaber = UILabel()
//    var freightRightLaber = UILabel()
//    var orderAmountLeftLaber = UILabel()
//    var orderAmountRightLaber = UILabel()
//    var bgModifypPriceLeftLaber = UILabel()
//    var bgModifypPriceRightLaber = UILabel()
//    var actualAmountLeftLaber = UILabel()
//    var actualAmountRightLaber = UILabel()
//    var shopInformationLaber = UILabel()
//    var commodityNameLaber = UILabel()
//    var commoditySpecificationLaber = UILabel()
//    var commodityPriceLaber = UILabel()
//    var commodityNumberLaber = UILabel()
//    var leaveCommentsLeftLaber = UILabel()
//    var leaveCommentsRightLaber = UILabel()
//    var sellerLaber = UILabel()
    //背景
    var headBg = UIImageView()
//    var orderStatusBg = UIImageView()
//    var orderDetailsBg = UIImageView()
//    var shopInformationBg = UIImageView()
//    //分割线
//    var orderDetailsLine = UILabel()
//    var userLine = UILabel()
//    var payLine = UILabel()
//    var shopInformationLine = UILabel()
//    var commodityLine = UILabel()
//    //图标
//    var receiptIcon = UIImageView()
//    var addressIcon = UIImageView()
//    var commodityIcon = UIImageView()
//    //描述
//    var sellerEdit = KMPlaceholderTextView()
//    //按钮
//    var orderButton = UIButton()
//
//    //订单字段
//    var orderPushLaber = UILabel()
//    var orderPayLaber = UILabel()
//    var orderShippingLaber = UILabel()
//    var orderFinishLaber = UILabel()
//
//    var orderPushTimeLaber = UILabel()
//    var orderPayTimeLaber = UILabel()
//    var orderShippingTimeLaber = UILabel()
//    var orderFinishTimeLaber = UILabel()
//
//    //订单图标
//    var orderPushIcon = UIImageView()
//    var orderPayIcon = UIImageView()
//    var orderShippiingIcon = UIImageView()
//    var orderFinishIcon = UIImageView()
//    //订单进度条
//    var orderPushLiner = UILabel()
//    var orderPayLine = UILabel()
//    var orderShippingLine = UILabel()
    
    func setView()  {
//        self.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        //MARK:头部背景
        headBg.image = UIImage.init(named: "order_deatails_bg")
        self.addSubview(headBg)
        headBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.left.right.equalToSuperview()
            ConstraintMaker.height.equalTo(160)
        }
        
        
        //MARK:订单状态
        orderStatusLaber.text = "订单已经提交，等待买家付款"
        orderStatusLaber.textColor = UIColor.white
        orderStatusLaber.font = UIFont.boldSystemFont(ofSize: 24)
        self.addSubview(orderStatusLaber)
        orderStatusLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalToSuperview().offset(19)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        
        
        //MARK:订单状态背景
//        orderStatusBg.backgroundColor = UIColor.white
//        orderStatusBg.layer.cornerRadius = 4
//        self.addSubview(orderStatusBg)
//        orderStatusBg.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.height.equalTo(113)
//            ConstraintMaker.left.equalToSuperview().offset(15)
//            ConstraintMaker.right.equalToSuperview().offset(-15)
//            ConstraintMaker.top.equalTo(orderStatusLaber.snp.bottom).offset(15)
//        }
//
//
//        //MARK:提交订单
//        orderPushLaber.text = "提交订单"
//        orderPushLaber.textColor = UIColor.black
//        orderPushLaber.font = UIFont.systemFont(ofSize: 12)
//        orderPushLaber.textAlignment = .center
//        self.addSubview(orderPushLaber)
//        orderPushLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.left.equalTo(orderStatusBg.snp.left)
//            ConstraintMaker.top.equalTo(orderStatusBg.snp.top).offset(52)
//            ConstraintMaker.width.equalTo(orderStatusBg.snp.width).dividedBy(4)
//        }
//
//        orderPushIcon.image = UIImage.init(named: "order_status")
//        self.addSubview(orderPushIcon)
//        orderPushIcon.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.bottom.equalTo(orderPushLaber.snp.top).offset(-12)
//            ConstraintMaker.width.height.equalTo(20)
//            ConstraintMaker.centerX.equalTo(orderPushLaber)
//        }
//
//        orderPushTimeLaber.text = ""
//        orderPushTimeLaber.textColor = UIColor.hex(hexString: "#999999")
//        orderPushTimeLaber.font = UIFont.systemFont(ofSize: 11)
//        orderPushTimeLaber.textAlignment = .center
//        orderPushTimeLaber.numberOfLines = 2
//        self.addSubview(orderPushTimeLaber)
//        orderPushTimeLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(orderPushLaber.snp.bottom).offset(11)
//            ConstraintMaker.centerX.equalTo(orderPushLaber)
//            ConstraintMaker.width.equalTo(56)
//        }
//
//
//        //MARK:支付订单
//        orderPayLaber.text = "支付订单"
//        orderPayLaber.textColor = UIColor.black
//        orderPayLaber.font = UIFont.systemFont(ofSize: 12)
//        orderPayLaber.textAlignment = .center
//        self.addSubview(orderPayLaber)
//        orderPayLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.left.equalTo(orderPushLaber.snp.right)
//            ConstraintMaker.top.equalTo(orderStatusBg.snp.top).offset(52)
//            ConstraintMaker.width.equalTo(orderStatusBg.snp.width).dividedBy(4)
//        }
//        orderPayIcon.image = UIImage.init(named: "two_img")
//        self.addSubview(orderPayIcon)
//        orderPayIcon.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.bottom.equalTo(orderPayLaber.snp.top).offset(-12)
//            ConstraintMaker.width.height.equalTo(20)
//            ConstraintMaker.centerX.equalTo(orderPayLaber)
//        }
//        orderPayTimeLaber.text = ""
//        orderPayTimeLaber.textColor = UIColor.hex(hexString: "#999999")
//        orderPayTimeLaber.font = UIFont.systemFont(ofSize: 11)
//        orderPayTimeLaber.textAlignment = .center
//        orderPayTimeLaber.numberOfLines = 2
//        self.addSubview(orderPayTimeLaber)
//        orderPayTimeLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(orderPayLaber.snp.bottom).offset(11)
//            ConstraintMaker.centerX.equalTo(orderPayLaber)
//            ConstraintMaker.width.equalTo(56)
//        }
//
//        //MARK:商家发货
//        orderShippingLaber.text = "商家发货"
//        orderShippingLaber.textColor = UIColor.black
//        orderShippingLaber.font = UIFont.systemFont(ofSize: 12)
//        orderShippingLaber.textAlignment = .center
//        self.addSubview(orderShippingLaber)
//        orderShippingLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.left.equalTo(orderPayLaber.snp.right)
//            ConstraintMaker.top.equalTo(orderStatusBg.snp.top).offset(52)
//            ConstraintMaker.width.equalTo(orderStatusBg.snp.width).dividedBy(4)
//        }
//
//        orderShippiingIcon.image = UIImage.init(named: "three_img")
//        self.addSubview(orderShippiingIcon)
//        orderShippiingIcon.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.bottom.equalTo(orderShippingLaber.snp.top).offset(-12)
//            ConstraintMaker.width.height.equalTo(20)
//            ConstraintMaker.centerX.equalTo(orderShippingLaber)
//        }
//        orderShippingTimeLaber.text = ""
//        orderShippingTimeLaber.textColor = UIColor.hex(hexString: "#999999")
//        orderShippingTimeLaber.font = UIFont.systemFont(ofSize: 11)
//        orderShippingTimeLaber.textAlignment = .center
//        orderShippingTimeLaber.numberOfLines = 3
//        self.addSubview(orderShippingTimeLaber)
//        orderShippingTimeLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(orderShippingLaber.snp.bottom).offset(11)
//            ConstraintMaker.centerX.equalTo(orderShippingLaber)
//            ConstraintMaker.width.equalTo(56)
//        }
//
//        //MARK:确认收货
//        orderFinishLaber.text = "确认收货"
//        orderFinishLaber.textColor = UIColor.black
//        orderFinishLaber.font = UIFont.systemFont(ofSize: 12)
//        orderFinishLaber.textAlignment = .center
//        self.addSubview(orderFinishLaber)
//        orderFinishLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.left.equalTo(orderShippingLaber.snp.right)
//            ConstraintMaker.top.equalTo(orderStatusBg.snp.top).offset(52)
//            ConstraintMaker.width.equalTo(orderStatusBg.snp.width).dividedBy(4)
//        }
//        orderFinishIcon.image = UIImage.init(named: "four_img")
//        self.addSubview(orderFinishIcon)
//        orderFinishIcon.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.bottom.equalTo(orderFinishLaber.snp.top).offset(-12)
//            ConstraintMaker.width.height.equalTo(20)
//            ConstraintMaker.centerX.equalTo(orderFinishLaber)
//        }
//        orderFinishTimeLaber.text = ""
//        orderFinishTimeLaber.textColor = UIColor.hex(hexString: "#999999")
//        orderFinishTimeLaber.font = UIFont.systemFont(ofSize: 11)
//        orderFinishTimeLaber.textAlignment = .center
//        orderFinishTimeLaber.numberOfLines = 2
//        self.addSubview(orderFinishTimeLaber)
//        orderFinishTimeLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(orderFinishLaber.snp.bottom).offset(11)
//            ConstraintMaker.width.equalTo(56)
//            ConstraintMaker.centerX.equalTo(orderFinishLaber)
//        }
//
//        //MARK:订单进度条
//        orderPushLiner.backgroundColor = UIColor.hex(hexString: "#1C98F6")
//        orderPushLiner.layer.cornerRadius = 3
//        self.addSubview(orderPushLiner)
//        orderPushLiner.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.height.equalTo(5)
//            ConstraintMaker.left.equalTo(orderPushIcon.snp.right)
//            ConstraintMaker.right.equalTo(orderPayIcon.snp.left)
//            ConstraintMaker.bottom.equalTo(orderPushLaber.snp.top).offset(-19)
//        }
//        orderPayLine.backgroundColor = UIColor.hex(hexString: "#F0F0F0")
//        orderPushLiner.layer.cornerRadius = 3
//        self.addSubview(orderPayLine)
//        orderPayLine.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.height.equalTo(5)
//            ConstraintMaker.left.equalTo(orderPayIcon.snp.right)
//            ConstraintMaker.right.equalTo(orderShippiingIcon.snp.left)
//            ConstraintMaker.bottom.equalTo(orderPushLaber.snp.top).offset(-19)
//        }
//        orderShippingLine.backgroundColor = UIColor.hex(hexString: "#F0F0F0")
//        orderPushLiner.layer.cornerRadius = 3
//        self.addSubview(orderShippingLine)
//        orderShippingLine.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.height.equalTo(5)
//            ConstraintMaker.left.equalTo(orderShippiingIcon.snp.right)
//            ConstraintMaker.right.equalTo(orderFinishIcon.snp.left)
//            ConstraintMaker.bottom.equalTo(orderPushLaber.snp.top).offset(-19)
//        }
//
//        //MARK:订单详情背景
//        orderDetailsBg.backgroundColor = UIColor.white
//        orderDetailsBg.layer.cornerRadius = 4
//        self.addSubview(orderDetailsBg)
//        orderDetailsBg.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.height.equalTo(348)
//            ConstraintMaker.top.equalTo(orderStatusBg.snp.bottom).offset(15)
//            ConstraintMaker.left.equalToSuperview().offset(15)
//            ConstraintMaker.right.equalToSuperview().offset(-15)
//        }
//        //MARK:订单详情
//        orderDetailsLaber.text = "订单详情"
//        orderDetailsLaber.textColor = UIColor.black
//        orderDetailsLaber.font = UIFont.boldSystemFont(ofSize: 18)
//        self.addSubview(orderDetailsLaber)
//        orderDetailsLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(orderDetailsBg.snp.top).offset(13)
//            ConstraintMaker.left.equalToSuperview().offset(30)
//        }
//        //MARK:分割线
//        orderDetailsLine.backgroundColor = UIColor.hex(hexString: "#F2f2F2")
//        self.addSubview(orderDetailsLine)
//        orderDetailsLine.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(orderDetailsLaber.snp.bottom).offset(12)
//            ConstraintMaker.left.equalToSuperview().offset(15)
//            ConstraintMaker.right.equalToSuperview().offset(-15)
//            ConstraintMaker.height.equalTo(1)
//        }
//
//        //MARK:收货图标
//        receiptIcon.image = UIImage.init(named: "receipt")
//        self.addSubview(receiptIcon)
//        receiptIcon.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.size.equalTo(13)
//            ConstraintMaker.top.equalTo(orderDetailsLine.snp.bottom).offset(15)
//            ConstraintMaker.left.equalToSuperview().offset(30)
//        }
//        //MARK:用户名称
//        userNameLaber.text = "张先生"
//        userNameLaber.textColor = UIColor.black
//        userNameLaber.font = UIFont.boldSystemFont(ofSize: 17)
//        self.addSubview(userNameLaber)
//        userNameLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(orderDetailsLine.snp.bottom).offset(13)
//            ConstraintMaker.left.equalTo(receiptIcon.snp.right).offset(8)
//        }
//        //MARK:用户电话号码
//        userPhoneLaber.text = "15743984389"
//        userPhoneLaber.textColor = UIColor.hex(hexString: "#1C98F6")
//        userPhoneLaber.font = UIFont.boldSystemFont(ofSize: 17)
//        self.addSubview(userPhoneLaber)
//        userPhoneLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(orderDetailsLine.snp.bottom).offset(15)
//            ConstraintMaker.left.equalTo(userNameLaber.snp.right).offset(24)
//        }
//        //MARK:地址图标
//        addressIcon.image = UIImage.init(named: "address")
//        self.addSubview(addressIcon)
//        addressIcon.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(receiptIcon.snp.bottom).offset(15)
//            ConstraintMaker.height.equalTo(13)
//            ConstraintMaker.width.equalTo(10)
//            ConstraintMaker.left.equalTo(orderDetailsBg.snp.left).offset(15)
//        }
//        //MARK:地址
//        addressLaber.text = "地址: 广东省深圳市南山区松柏783号"
//        addressLaber.textColor = UIColor.hex(hexString: "#999999")
//        addressLaber.font = UIFont.systemFont(ofSize: 14)
//        self.addSubview(addressLaber)
//        addressLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.left.equalTo(addressIcon.snp.right).offset(10)
//            ConstraintMaker.top.equalTo(userNameLaber.snp.bottom).offset(10)
//        }
//        //MARK:分割线
//        userLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
//        self.addSubview(userLine)
//        userLine.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.height.equalTo(1)
//            ConstraintMaker.top.equalTo(addressIcon.snp.bottom).offset(15)
//            ConstraintMaker.left.equalToSuperview().offset(30)
//            ConstraintMaker.right.equalToSuperview().offset(-30)
//        }
//        //MARK:订单编号
//        orderNumberLeftLaber.text = "订单编号"
//        orderNumberLeftLaber.textColor = UIColor.hex(hexString: "#999999")
//        orderNumberLeftLaber.font = UIFont.systemFont(ofSize: 14)
//        self.addSubview(orderNumberLeftLaber)
//        orderNumberLeftLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(userLine.snp.bottom).offset(14)
//            ConstraintMaker.left.equalToSuperview().offset(30)
//        }
//        orderNumberRightLaber.text = "263768434897589359"
//        orderNumberRightLaber.textColor = UIColor.hex(hexString: "#333333")
//        orderNumberRightLaber.font = UIFont.systemFont(ofSize: 14)
//        self.addSubview(orderNumberRightLaber)
//        orderNumberRightLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(userLine.snp.bottom).offset(14)
//            ConstraintMaker.right.equalToSuperview().offset(-30)
//        }
//        //MARK:订单时间
//        orderTimeLeftLaber.text = "订单时间"
//        orderTimeLeftLaber.textColor = UIColor.hex(hexString: "#999999")
//        orderTimeLeftLaber.font = UIFont.systemFont(ofSize: 14)
//        self.addSubview(orderTimeLeftLaber)
//        orderTimeLeftLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(orderNumberLeftLaber.snp.bottom).offset(10)
//            ConstraintMaker.left.equalToSuperview().offset(30)
//        }
//        orderTimeRighrLaber.text = "2019-06-18 15:36:56"
//        orderTimeRighrLaber.textColor = UIColor.hex(hexString: "#333333")
//        orderTimeRighrLaber.font = UIFont.systemFont(ofSize: 14)
//        self.addSubview(orderTimeRighrLaber)
//        orderTimeRighrLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(orderNumberRightLaber.snp.bottom).offset(10)
//            ConstraintMaker.right.equalToSuperview().offset(-30)
//        }
//        //MARK:支付方式
//        payModeLeftLaber.text = "支付方式"
//        payModeLeftLaber.textColor = UIColor.hex(hexString: "#999999")
//        payModeLeftLaber.font = UIFont.systemFont(ofSize: 14)
//        self.addSubview(payModeLeftLaber)
//        payModeLeftLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(orderTimeLeftLaber.snp.bottom).offset(10)
//            ConstraintMaker.left.equalToSuperview().offset(30)
//        }
//        payModeRightLaber.text = "暂无"
//        payModeRightLaber.textColor = UIColor.hex(hexString: "#333333")
//        payModeRightLaber.font = UIFont.systemFont(ofSize: 14)
//        self.addSubview(payModeRightLaber)
//        payModeRightLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(orderTimeRighrLaber.snp.bottom).offset(10)
//            ConstraintMaker.right.equalToSuperview().offset(-30)
//        }
//        //MARK:分割线
//        payLine.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
//        self.addSubview(payLine)
//        payLine.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(payModeLeftLaber.snp.bottom).offset(14)
//            ConstraintMaker.height.equalTo(1)
//            ConstraintMaker.left.equalToSuperview().offset(30)
//            ConstraintMaker.right.equalToSuperview().offset(-30)
//        }
//        //MARK:运费
//        freightLeftLaber.text = "运费"
//        freightLeftLaber.textColor = UIColor.hex(hexString: "#999999")
//        freightLeftLaber.font = UIFont.systemFont(ofSize: 14)
//        self.addSubview(freightLeftLaber)
//        freightLeftLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(payLine.snp.bottom).offset(14)
//            ConstraintMaker.left.equalToSuperview().offset(30)
//        }
//        freightRightLaber.text = "0.00元"
//        freightRightLaber.textColor = UIColor.hex(hexString: "#333333")
//        freightRightLaber.font = UIFont.systemFont(ofSize: 14)
//        self.addSubview(freightRightLaber)
//        freightRightLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(payLine.snp.bottom).offset(14)
//            ConstraintMaker.right.equalToSuperview().offset(-30)
//        }
//        //MARK:下单金额
//        orderAmountLeftLaber.text = "下单金额"
//        orderAmountLeftLaber.textColor = UIColor.hex(hexString: "#999999")
//        orderAmountLeftLaber.font = UIFont.systemFont(ofSize: 14)
//        self.addSubview(orderAmountLeftLaber)
//        orderAmountLeftLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(freightLeftLaber.snp.bottom).offset(10)
//            ConstraintMaker.left.equalToSuperview().offset(30)
//        }
//        orderAmountRightLaber.text = "7860.00元"
//        orderAmountRightLaber.textColor = UIColor.hex(hexString: "#333333")
//        orderAmountRightLaber.font = UIFont.systemFont(ofSize: 14)
//        self.addSubview(orderAmountRightLaber)
//        orderAmountRightLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(freightRightLaber.snp.bottom).offset(10)
//            ConstraintMaker.right.equalToSuperview().offset(-30)
//        }
//        //MARK:后台改价
//        bgModifypPriceLeftLaber.text = "后台改价"
//        bgModifypPriceLeftLaber.textColor = UIColor.hex(hexString: "#999999")
//        bgModifypPriceLeftLaber.font = UIFont.systemFont(ofSize: 14)
//        self.addSubview(bgModifypPriceLeftLaber)
//        bgModifypPriceLeftLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(orderAmountLeftLaber.snp.bottom).offset(10)
//            ConstraintMaker.left.equalToSuperview().offset(30)
//        }
//        bgModifypPriceRightLaber.text = "优惠: 1元"
//        bgModifypPriceRightLaber.textColor = UIColor.hex(hexString: "#333333")
//        bgModifypPriceRightLaber.font = UIFont.systemFont(ofSize: 14)
//        self.addSubview(bgModifypPriceRightLaber)
//        bgModifypPriceRightLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(orderAmountRightLaber.snp.bottom).offset(10)
//            ConstraintMaker.right.equalToSuperview().offset(-30)
//        }
//        //MARK:实付金额
//        actualAmountLeftLaber.text = "实付金额"
//        actualAmountLeftLaber.textColor = UIColor.hex(hexString: "#999999")
//        actualAmountLeftLaber.font = UIFont.systemFont(ofSize: 14)
//        self.addSubview(actualAmountLeftLaber)
//        actualAmountLeftLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(bgModifypPriceLeftLaber.snp.bottom).offset(10)
//            ConstraintMaker.left.equalToSuperview().offset(30)
//        }
//        actualAmountRightLaber.text = "589.00元"
//        actualAmountRightLaber.textColor = UIColor.hex(hexString: "#FF4444")
//        actualAmountRightLaber.font = UIFont.boldSystemFont(ofSize: 14)
//        self.addSubview(actualAmountRightLaber)
//        actualAmountRightLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(bgModifypPriceRightLaber.snp.bottom).offset(10)
//            ConstraintMaker.right.equalToSuperview().offset(-30)
//        }
//        //MARK:商品信息背景
//        shopInformationBg.backgroundColor = UIColor.white
//        shopInformationBg.layer.cornerRadius = 4
//        self.addSubview(shopInformationBg)
//        shopInformationBg.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.height.equalTo(335)
//            ConstraintMaker.top.equalTo(orderDetailsBg.snp.bottom).offset(15)
//            ConstraintMaker.left.equalToSuperview().offset(15)
//            ConstraintMaker.right.equalToSuperview().offset(-15)
//        }
//        //MARK:商品信息
//        shopInformationLaber.text = "商品信息"
//        shopInformationLaber.textColor = UIColor.black
//        shopInformationLaber.font = UIFont.boldSystemFont(ofSize: 18)
//        self.addSubview(shopInformationLaber)
//        shopInformationLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(shopInformationBg.snp.top).offset(15)
//            ConstraintMaker.left.equalToSuperview().offset(30)
//        }
//         //MARK:商品分割线
//        shopInformationLine.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
//        self.addSubview(shopInformationLine)
//        shopInformationLine.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.height.equalTo(1)
//            ConstraintMaker.top.equalTo(shopInformationLaber.snp.bottom).offset(12)
//            ConstraintMaker.left.equalToSuperview().offset(15)
//            ConstraintMaker.right.equalToSuperview().offset(-15)
//        }
//        //MARK:商品图片
//        commodityIcon.image = UIImage.init(named: "apply_status")
//        self.addSubview(commodityIcon)
//        commodityIcon.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.size.equalTo(61)
//            ConstraintMaker.top.equalTo(shopInformationLine.snp.bottom).offset(15)
//            ConstraintMaker.left.equalToSuperview().offset(30)
//        }
//        //MARK:商品名称
//        commodityNameLaber.text = "商品名称名称名称"
//        commodityNameLaber.textColor = UIColor.black
//        commodityNameLaber.font = UIFont.systemFont(ofSize: 15)
//        self.addSubview(commodityNameLaber)
//        commodityNameLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(shopInformationLine.snp.bottom).offset(15)
//            ConstraintMaker.left.equalTo(commodityIcon.snp.right).offset(11)
//        }
//
//        //MARK:商品规格
//        commoditySpecificationLaber.text = "规格: 默认"
//        commoditySpecificationLaber.textColor = UIColor.hex(hexString: "#999999")
//        commoditySpecificationLaber.font = UIFont.systemFont(ofSize: 13)
//        self.addSubview(commoditySpecificationLaber)
//        commoditySpecificationLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(commodityNameLaber.snp.bottom).offset(10)
//            ConstraintMaker.left.equalTo(commodityIcon.snp.right).offset(11)
//        }
//        //MARK:商品价格
//        commodityPriceLaber.text = "￥43843.00"
//        commodityPriceLaber.textColor = UIColor.black
//        commodityPriceLaber.font = UIFont.systemFont(ofSize: 14)
//        self.addSubview(commodityPriceLaber)
//        commodityPriceLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(commoditySpecificationLaber.snp.bottom).offset(10)
//            ConstraintMaker.left.equalTo(commodityIcon.snp.right).offset(11)
//        }
//        //MARK:商品数量
//        commodityNumberLaber.text = "x2"
//        commodityNumberLaber.textColor = UIColor.hex(hexString: "#999999")
//        commodityNumberLaber.font = UIFont.systemFont(ofSize: 15)
//        self.addSubview(commodityNumberLaber)
//        commodityNumberLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.right.equalToSuperview().offset(-30)
//            ConstraintMaker.top.equalTo(commodityNameLaber.snp.bottom).offset(37)
//        }
//        //MARK:商品分割线
//        commodityLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
//        self.addSubview(commodityLine)
//        commodityLine.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.height.equalTo(1)
//            ConstraintMaker.left.equalToSuperview().offset(30)
//            ConstraintMaker.right.equalToSuperview().offset(-30)
//            ConstraintMaker.top.equalTo(commodityPriceLaber.snp.bottom).offset(15)
//        }
//        //MARK:买家留言
//        leaveCommentsLeftLaber.text = "买家留言 : "
//        leaveCommentsLeftLaber.textColor = UIColor.hex(hexString: "#999999")
//        leaveCommentsLeftLaber.font = UIFont.systemFont(ofSize: 14)
//        self.addSubview(leaveCommentsLeftLaber)
//        leaveCommentsLeftLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(commodityLine.snp.bottom).offset(14)
//            ConstraintMaker.left.equalToSuperview().offset(30)
//        }
//        //MARK:买家留言右边内容
//        leaveCommentsRightLaber.text  = "我这边比较着急，请快点配送"
//        leaveCommentsRightLaber.textColor = UIColor.hex(hexString: "#333333")
//        leaveCommentsRightLaber.font = UIFont.systemFont(ofSize: 14)
//        self.addSubview(leaveCommentsRightLaber)
//        leaveCommentsRightLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(commodityLine.snp.bottom).offset(14)
//            ConstraintMaker.left.equalTo(leaveCommentsLeftLaber.snp.right).offset(8)
//        }
//        //MARK:卖家备注
//        sellerLaber.text = "卖家备注"
//        sellerLaber.textColor = UIColor.hex(hexString: "#999999")
//        sellerLaber.font = UIFont.systemFont(ofSize: 14)
//        self.addSubview(sellerLaber)
//        sellerLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(leaveCommentsLeftLaber.snp.bottom).offset(13)
//            ConstraintMaker.left.equalToSuperview().offset(30)
//        }
//
//        //MARK:备注描述
//        sellerEdit.textColor = UIColor.black
//        sellerEdit.tintColor = UIColor.hex(hexString: "#CCCCCC")
//        sellerEdit.font = UIFont.systemFont(ofSize: 17)
//        sellerEdit.placeholder = "请输入 (选填)"
//        sellerEdit.layer.borderColor = UIColor.hex(hexString: "#F2F2F2").cgColor
//        sellerEdit.layer.borderWidth = 1
//        sellerEdit.layer.cornerRadius = 2
//        sellerEdit.placeholderFont = UIFont.systemFont(ofSize: 14)
//        self.addSubview(sellerEdit)
//        sellerEdit.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.left.equalToSuperview().offset(30)
//            ConstraintMaker.right.equalToSuperview().offset(-30)
//            ConstraintMaker.height.equalTo(100)
//            ConstraintMaker.top.equalTo(sellerLaber.snp.bottom).offset(10)
//        }
//        //MARK:确定按钮
//        orderButton.setTitle("确定", for: UIControl.State.normal)
//        orderButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
//        orderButton.backgroundColor = UIColor.hex(hexString: "#1C98F6")
//        orderButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
//        orderButton.layer.masksToBounds = true
//        orderButton.layer.cornerRadius = 3
//        self.addSubview(orderButton)
//        orderButton.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.left.equalToSuperview().offset(15)
//            ConstraintMaker.right.equalToSuperview().offset(-15)
//            ConstraintMaker.height.equalTo(44)
//            ConstraintMaker.top.equalTo(shopInformationBg.snp.bottom).offset(31)
////            ConstraintMaker.bottom.equalToSuperview().offset(-31)
//        }
        
    }
}
