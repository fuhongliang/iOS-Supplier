//
//  UOderCell.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/3.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UOderCell : UBaseTableViewCell {
    
    var modifyPriceOrDeliveryGoods : (() -> ())?
    
    var statusLayer: UIView = {
        let sl = UIView()
        sl.backgroundColor = UIColor.hex(hexString: "#F7F9FA")
        sl.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 44)
        return sl
    }()
    //字段
    var statusLaber: UILabel = {
        let statusLabel = UILabel()
        statusLabel.text = "待处理"
        statusLabel.textColor = UIColor.hex(hexString: "#FF4444")
        statusLabel.font = UIFont.systemFont(ofSize: 16)
        return statusLabel
    }()
    var userNameLaber: UILabel = {
        let userNameLaber = UILabel()
        userNameLaber.text = "张先生"
        userNameLaber.textColor = UIColor.black
        userNameLaber.font = UIFont.boldSystemFont(ofSize: 17)
        return userNameLaber
    }()
    var userPhoneLaber: UILabel = {
        let userPhonelaber = UILabel()
        userPhonelaber.text = "15743984389"
        userPhonelaber.textColor = UIColor.hex(hexString: "#1C98F6")
        userPhonelaber.font = UIFont.boldSystemFont(ofSize: 17)
        return userPhonelaber
    }()
    var addressLaber: UILabel = {
        let addressLaber = UILabel()
        addressLaber.text = "地址: 广东省深圳市南山区松柏783号"
        addressLaber.textColor = UIColor.hex(hexString: "#999999")
        addressLaber.font = UIFont.systemFont(ofSize: 14)
        return addressLaber
    }()
    var commodityLaber: UILabel = {
        let commodityLaber = UILabel()
        commodityLaber.text = "商品"
        commodityLaber.textColor = UIColor.black
        commodityLaber.font = UIFont.boldSystemFont(ofSize: 17)
        return commodityLaber
    }()
    var commodityNameLaber: UILabel = {
        let commdityNameLaber = UILabel()
        commdityNameLaber.text = "商品名称名称名称"
        commdityNameLaber.textColor = UIColor.black
        commdityNameLaber.font = UIFont.systemFont(ofSize: 15)
        return commdityNameLaber
    }()
    var commoditySpecificationLaber: UILabel = {
        let commoditySpecificationLaber = UILabel()
        commoditySpecificationLaber.text = "规格: 默认"
        commoditySpecificationLaber.textColor = UIColor.hex(hexString: "#999999")
        commoditySpecificationLaber.font = UIFont.systemFont(ofSize: 13)
        return commoditySpecificationLaber
    }()
    var commodityPriceLaber: UILabel = {
        let label = UILabel()
        label.text = "￥43843.00"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    var commodityNumberLaber: UILabel = {
        let label = UILabel()
        label.text = "x2"
        label.textColor = UIColor.hex(hexString: "#999999")
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    var orderNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "订单编号：2000000000009301"
        label.textColor = UIColor.hex(hexString: "#999999")
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    var orderTimeLaber: UILabel = {
        let label = UILabel()
        label.text = "下单时间：2019-06-11 10:39:46"
        label.textColor = UIColor.hex(hexString: "#999999")
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    var leaveCommentsLaber: UILabel = {
        let label = UILabel()
        label.text = "买家留言 : "
        label.textColor = UIColor.hex(hexString: "#999999")
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    var leaveCommentsRightLaber: UILabel = {
        let label = UILabel()
        label.text  = "需要商品订单发票抬头，谢谢"
        label.textColor = UIColor.hex(hexString: "#333333")
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    var freightLaber: UILabel = {
        let label = UILabel()
        label.text = "运费:"
        label.textColor = UIColor.hex(hexString: "#333333")
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    var freightPriceLaber: UILabel = {
        let label = UILabel()
        label.text = "￥199.00"
        label.textColor = UIColor.hex(hexString: "#333333")
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    var totalLaber: UILabel = {
        let label = UILabel()
        label.text = "总计:"
        label.textColor = UIColor.hex(hexString: "#333333")
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    var totalPriceLaber: UILabel = {
        let label = UILabel()
        label.text = "￥199.00"
        label.textColor = UIColor.hex(hexString: "#FF4444")
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    //背景
    var whiteBg: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = UIColor.white
        return img
    }()
    //图标
    var receiptIcon: UIImageView = {
        let img = UIImageView()
        img.image = UIImage.init(named: "receipt")
        return img
    }()
    var userPhoneIcon: UIImageView = {
        let img = UIImageView()
        img.image = UIImage.init(named: "phone")
        return img
    }()
    var addressIcon: UIImageView = {
        let img = UIImageView()
        img.image = UIImage.init(named: "address")
        return img
    }()
    var commodityIcon: UIImageView = {
        let img = UIImageView()
        img.image = UIImage.init(named: "apply_status")
        return img
    }()
    var expandIcon: UIImageView = {
        let img = UIImageView()
        img.image = UIImage.init(named: "drop_down")
        return img
    }()
    //分割线
    var userLine: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        return img
    }()
    var commodityLine: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        return img
    }()
    var leaveCommentsTopLine: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        return img
    }()
    var leaveCommentsBottomLine: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        return img
    }()
    var totalLine: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        return img
    }()
    //按钮
    var priceModifyBg: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        btn.tintColor = UIColor.hex(hexString: "#1C98F6")
        btn.setTitle("价格修改", for: UIControl.State.normal)
        btn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 4
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return btn
        
    }()
    
    override func configUI() {
//        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        
        self.addSubview(statusLayer)
        
        //MARK:待处理
        statusLayer.addSubview(statusLaber)
        statusLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.left.equalToSuperview().offset(15)
        }

        //MARK:收货图标
        self.addSubview(receiptIcon)
        receiptIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.width.equalTo(13)
            ConstraintMaker.height.equalTo(13)
            ConstraintMaker.top.equalTo(statusLayer.snp.bottom).offset(17)
            ConstraintMaker.left.equalToSuperview().offset(10)
        }
        //MARK:用户名称
        self.addSubview(userNameLaber)
        userNameLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.width.equalTo(60)
            ConstraintMaker.centerY.equalTo(receiptIcon)
            ConstraintMaker.left.equalTo(receiptIcon.snp.right).offset(15)
        }
        //MARK:用户电话号码
        self.addSubview(userPhoneLaber)
        userPhoneLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalTo(receiptIcon)
            ConstraintMaker.left.equalTo(userNameLaber.snp.right).offset(24)
        }
        //MARK:拨打用户电话图标
        self.addSubview(userPhoneIcon)
        userPhoneIcon.snp.makeConstraints { (ConstraintMaker) in
           ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.size.equalTo(17)
            ConstraintMaker.top.equalTo(statusLayer.snp.bottom).offset(15)
        }
        //MARK:地址图标
        self.addSubview(addressIcon)
        addressIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(receiptIcon.snp.bottom).offset(15)
            ConstraintMaker.height.equalTo(13)
            ConstraintMaker.width.equalTo(10)
            ConstraintMaker.centerX.equalTo(receiptIcon)
        }
        //MARK:地址
        self.addSubview(addressLaber)
        addressLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(addressIcon.snp.right).offset(10)
            ConstraintMaker.top.bottom.equalTo(addressIcon)
        }
        //MARK:分割线
        self.addSubview(userLine)
        userLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.top.equalTo(addressIcon.snp.bottom).offset(15)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
        }
        //MARK:商品
        self.addSubview(commodityLaber)
        commodityLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(userLine.snp.bottom).offset(15)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
        }
        
        //MARK:商品图片
        self.addSubview(commodityIcon)
        commodityIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.size.equalTo(61)
            ConstraintMaker.top.equalTo(commodityLaber.snp.bottom).offset(15)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //MARK:商品名称
        self.addSubview(commodityNameLaber)
        commodityNameLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(commodityIcon)
            ConstraintMaker.left.equalTo(commodityIcon.snp.right).offset(11)
        }

        //MARK:商品规格
        self.addSubview(commoditySpecificationLaber)
        commoditySpecificationLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(commodityNameLaber.snp.bottom).offset(10)
            ConstraintMaker.centerY.equalTo(commodityIcon)
            ConstraintMaker.left.equalTo(commodityIcon.snp.right).offset(11)
        }
        //MARK:商品价格
        self.addSubview(commodityPriceLaber)
        commodityPriceLaber.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.equalTo(commoditySpecificationLaber.snp.bottom).offset(10)
            ConstraintMaker.bottom.equalTo(commodityIcon)
            ConstraintMaker.left.equalTo(commodityIcon.snp.right).offset(11)
        }
        //MARK:商品数量
        self.addSubview(commodityNumberLaber)
        commodityNumberLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.top.bottom.equalTo(commodityPriceLaber)
        }
        //MARK:商品分割线
        self.addSubview(commodityLine)
        commodityLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.top.equalTo(commodityPriceLaber.snp.bottom).offset(15)
        }
        //MARK:订单编号
        self.addSubview(orderNumberLabel)
        orderNumberLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(commodityLine.snp.bottom).offset(15)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //MARK:下单时间
        self.addSubview(orderTimeLaber)
        orderTimeLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(orderNumberLabel.snp.bottom).offset(11)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //MARK:买家留言上边分割线
        self.addSubview(leaveCommentsTopLine)
        leaveCommentsTopLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.top.equalTo(orderTimeLaber.snp.bottom).offset(15)
        }
        //MARK:买家留言
        self.addSubview(leaveCommentsLaber)
        leaveCommentsLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(leaveCommentsTopLine.snp.bottom).offset(14)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //MARK:买家留言右边内容
        self.addSubview(leaveCommentsRightLaber)
        leaveCommentsRightLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalTo(leaveCommentsLaber)
            ConstraintMaker.left.equalTo(leaveCommentsLaber.snp.right).offset(8)
        }
        //MARK:买家留言下边分割线
        self.addSubview(leaveCommentsBottomLine)
        leaveCommentsBottomLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.top.equalTo(leaveCommentsLaber.snp.bottom).offset(15)
        }
        //MARK:运费
        self.addSubview(freightLaber)
        freightLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(leaveCommentsBottomLine.snp.bottom).offset(14)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //MARK:运费价格
        self.addSubview(freightPriceLaber)
        freightPriceLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalTo(freightLaber)
            ConstraintMaker.left.equalTo(freightLaber.snp.right).offset(8)
        }
        //MARK:总计
        self.addSubview(totalLaber)
        totalLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(freightLaber.snp.bottom).offset(10)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //MARK:总计价格
        self.addSubview(totalPriceLaber)
        totalPriceLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalTo(totalLaber)
            ConstraintMaker.left.equalTo(totalLaber.snp.right).offset(8)
        }
        //MARK:分割线
        self.addSubview(totalLine)
        totalLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.left.right.equalToSuperview()
            ConstraintMaker.top.equalTo(totalPriceLaber.snp.bottom).offset(15)
        }
        //MARK:价格修改按钮
        self.addSubview(priceModifyBg)
        priceModifyBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(40)
            ConstraintMaker.width.equalTo(94)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.top.equalTo(totalLine.snp.bottom).offset(10)
        }        
//        priceModifyBg.addTarget(self, action: #selector(tapModifyPriceOrDelivery), for:  UIControl.Event.touchDown)
    }
    
    @objc func tapModifyPriceOrDeliveryGoods() {
        modifyPriceOrDeliveryGoods?()
    }
    
    var model: Order? {
        didSet {
            guard let model = model else { return }
            if (model.is_pay==0) {
                statusLaber.text = "待付款"
                statusLaber.textColor = UIColor.hex(hexString: "#FF4444")
                priceModifyBg.setTitle("价格修改", for: .normal)
            } else {
                statusLaber.text = "待发货"
                statusLaber.textColor = UIColor.hex(hexString: "#1C98F6")
                priceModifyBg.setTitle("发货", for: .normal)
            }
            priceModifyBg.addTarget(self, action: #selector(tapModifyPriceOrDeliveryGoods), for:  UIControl.Event.touchUpInside)
            userNameLaber.text = model.name
            userPhoneLaber.text = model.mobile
            addressLaber.text = model.address
            if (model.goodsList.count != 0){
                commodityNameLaber.text = model.goodsList?[0].name
                var label:String = ""
                for attr in (model.goodsList?[0].attr ?? []){
                        label = label + attr.attr_name
                }
                commoditySpecificationLaber.text = label
                commodityPriceLaber.text = "￥" + (model.goodsList?[0].total_price ?? "0")
                commodityNumberLaber.text = "x" + String(model.goodsList?[0].num ?? 0)
                let url = URL(string: model.goodsList[0].pic!)
                commodityIcon.kf.setImage(with: url)
            }
            orderNumberLabel.text = "订单编号：" + String(model.order_no)
            orderTimeLaber.text = "下单时间：" + String(model.addtime)
            leaveCommentsRightLaber.text = model.remark
            freightPriceLaber.text = "￥" + model.express_price
            totalPriceLaber.text = "￥" + model.total_price
            
        }
    }
    
}
