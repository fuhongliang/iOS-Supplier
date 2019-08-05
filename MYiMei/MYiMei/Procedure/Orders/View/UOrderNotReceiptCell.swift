//
//  UOrderNotReceiptCell.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/20.
//  Copyright © 2019 符宏梁. All rights reserved.
//


import UIKit

class UOrderNotReceiptCell : UBaseTableViewCell {
    
    var modifyPriceOrDeliveryGoods : (() -> ())?
    var moveToRecycleBin : (() -> ())?
    var callTheClient : (() -> ())?
    
    //白色背景
    var whiteBg = UIImageView()
    //订单号
    var orderNumberLaber = UILabel()
    var orderLine = UILabel()
    //待付款
    var pendingPaymentLaber = UILabel()
    
    //灰色背景
    var grayBg = UIImageView()
    //用户名称
    var userNameLaber = UILabel()
    //用户电话
    var userPhoneLaber = UILabel()
    //电话图标
    var phoneIcon = UIImageView()
    //联系收货人
    var contactReceiverLaber = UILabel()
    var contactBtn = UIButton()
    
    //商品模块
    var commodityIcon = UIImageView()
    var commodityNameLaber = UILabel()
    var commoditySpecificationLaber = UILabel()
    var commodityPriceLaber = UILabel()
    var commodityNumberLaber = UILabel()
    var commodityLine = UILabel()
    //共几件商品
    var totalCommodity = UILabel()
    //合计金额
    var totalAmount = UILabel()
    //运费
    var freight = UILabel()
    var totalLine = UILabel()
    //按钮
    var modifyPriceBtn : UIButton = {
        let modifyPriceBtn = UIButton()
        modifyPriceBtn.setTitle("修改快递单号", for: UIControl.State.normal)
        modifyPriceBtn.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        modifyPriceBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        modifyPriceBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        modifyPriceBtn.layer.cornerRadius = 15
        modifyPriceBtn.layer.masksToBounds = true
        return modifyPriceBtn
    }()
    var recycleBinBtn : UIButton = {
        let recycleBinBtn = UIButton()
        recycleBinBtn.setTitle("移入回收站", for: UIControl.State.normal)
        recycleBinBtn.setTitleColor(UIColor.hex(hexString: "#999999"), for: UIControl.State.normal)
        recycleBinBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        recycleBinBtn.backgroundColor = UIColor.white
        recycleBinBtn.layer.borderColor = UIColor.hex(hexString: "#E6E6E6").cgColor
        recycleBinBtn.layer.borderWidth = 1
        recycleBinBtn.layer.cornerRadius = 15
        return recycleBinBtn
    }()
    
    override func configUI() {
        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        
        
        whiteBg.backgroundColor = UIColor.white
        whiteBg.layer.cornerRadius = 5
        contentView.addSubview(whiteBg)
        whiteBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(285)
        }
        
        //MARK:订单号
        orderNumberLaber.text = "订单号：1689883802037"
        orderNumberLaber.textColor = UIColor.hex(hexString: "#999999")
        orderNumberLaber.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(orderNumberLaber)
        orderNumberLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(whiteBg.snp.left).offset(15)
            ConstraintMaker.top.equalTo(whiteBg.snp.top).offset(16)
        }
        //MARK:待付款
        pendingPaymentLaber.text = "待收货"
        pendingPaymentLaber.textColor = UIColor.hex(hexString: "#1C98F6")
        pendingPaymentLaber.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(pendingPaymentLaber)
        pendingPaymentLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(whiteBg.snp.top).offset(16)
            ConstraintMaker.right.equalTo(whiteBg.snp.right).offset(-15)
        }
        //MARK:订单号分割线
        orderLine.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        contentView.addSubview(orderLine)
        orderLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(orderNumberLaber.snp.bottom).offset(15)
            ConstraintMaker.left.equalTo(whiteBg)
            ConstraintMaker.right.equalTo(whiteBg)
            ConstraintMaker.height.equalTo(1)
        }
        //MARK:灰色背景
        grayBg.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        grayBg.layer.cornerRadius = 3
        contentView.addSubview(grayBg)
        grayBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(whiteBg.snp.left).offset(15)
            ConstraintMaker.top.equalTo(orderLine.snp.bottom).offset(15)
            ConstraintMaker.right.equalTo(whiteBg.snp.right).offset(-15)
            ConstraintMaker.height.equalTo(40)
        }
        //MARK:用户名称
        userNameLaber.text = "张铭名"
        userNameLaber.textColor = UIColor.black
        userNameLaber.font = UIFont.boldSystemFont(ofSize: 14)
        contentView.addSubview(userNameLaber)
        userNameLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(grayBg.snp.left).offset(10)
            ConstraintMaker.centerY.equalTo(grayBg)
        }
        //MARK:用户电话
        userPhoneLaber.text = "13467894321"
        userPhoneLaber.textColor = UIColor.black
        userPhoneLaber.font = UIFont.boldSystemFont(ofSize: 14)
        contentView.addSubview(userPhoneLaber)
        userPhoneLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(userNameLaber.snp.right).offset(25)
            ConstraintMaker.centerY.equalTo(grayBg)
        }
        //MARK:联系收货人
        contactReceiverLaber.text = "联系收货人"
        contactReceiverLaber.textColor = UIColor.hex(hexString: "#1C98F6")
        contactReceiverLaber.font = UIFont.systemFont(ofSize: 12)
        contentView.addSubview(contactReceiverLaber)
        contactReceiverLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalTo(grayBg)
            ConstraintMaker.right.equalTo(grayBg.snp.right).offset(-10)
        }
        //MARK:电话图标
        phoneIcon.image = UIImage.init(named: "phoneIcon")
        contentView.addSubview(phoneIcon)
        phoneIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalTo(grayBg)
            ConstraintMaker.right.equalTo(contactReceiverLaber.snp.left).offset(-6)
        }
        
        contentView.addSubview(contactBtn)
        contactBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.left.equalTo(grayBg)
            ConstraintMaker.width.height.equalTo(grayBg)
        }
        contactBtn.addTarget(self, action: #selector(tapCallTheClient), for: UIControl.Event.touchUpInside)
        
        
        //MARK:商品图片
        commodityIcon.image = UIImage.init(named: "apply_status")
        //TODO 圆角
        contentView.addSubview(commodityIcon)
        commodityIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(whiteBg.snp.left).offset(15)
            ConstraintMaker.top.equalTo(grayBg.snp.bottom).offset(15)
            ConstraintMaker.size.equalTo(61)
        }
        //MARK:商品名称
        commodityNameLaber.text = "商品名称名称名称"
        commodityNameLaber.textColor = UIColor.black
        commodityNameLaber.font = UIFont.systemFont(ofSize: 15)
        contentView.addSubview(commodityNameLaber)
        commodityNameLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(commodityIcon.snp.right).offset(11)
            ConstraintMaker.top.equalTo(commodityIcon)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        
        //MARK:商品规格
        commoditySpecificationLaber.text = "规格: 默认"
        commoditySpecificationLaber.textColor = UIColor.hex(hexString: "#999999")
        commoditySpecificationLaber.font = UIFont.systemFont(ofSize: 13)
        contentView.addSubview(commoditySpecificationLaber)
        commoditySpecificationLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(commodityIcon.snp.right).offset(11)
            ConstraintMaker.centerY.equalTo(commodityIcon)
        }
        //MARK:商品价格
        commodityPriceLaber.text = "￥43843.00"
        commodityPriceLaber.textColor = UIColor.black
        commodityPriceLaber.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(commodityPriceLaber)
        commodityPriceLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(commodityIcon.snp.right).offset(11)
            ConstraintMaker.bottom.equalTo((commodityIcon))
        }
        //MARK:商品数量
        commodityNumberLaber.text = "x2"
        commodityNumberLaber.textColor = UIColor.hex(hexString: "#999999")
        commodityNumberLaber.font = UIFont.systemFont(ofSize: 15)
        contentView.addSubview(commodityNumberLaber)
        commodityNumberLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(grayBg.snp.bottom).offset(65)
            ConstraintMaker.right.equalTo(whiteBg.snp.right).offset(-15)
        }
        //MARK:商品分割线
        commodityLine.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        contentView.addSubview(commodityLine)
        commodityLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(whiteBg.snp.left).offset(15)
            ConstraintMaker.top.equalTo(commodityPriceLaber.snp.bottom).offset(15)
            ConstraintMaker.right.equalTo(whiteBg.snp.right).offset(-15)
            ConstraintMaker.height.equalTo(1)
        }
        //MARK:共几件商品
        totalCommodity.text = "共10件商品"
        totalCommodity.textColor = UIColor.hex(hexString: "#333333")
        totalCommodity.font = UIFont.systemFont(ofSize: 13)
        contentView.addSubview(totalCommodity)
        totalCommodity.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(whiteBg.snp.left).offset(15)
            ConstraintMaker.top.equalTo(commodityLine.snp.bottom).offset(15)
        }
        //MARK:运费
        freight.text = "(含运费￥0.00)"
        freight.textColor = UIColor.hex(hexString: "#999999")
        freight.font = UIFont.systemFont(ofSize: 13)
        contentView.addSubview(freight)
        freight.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(commodityLine.snp.bottom).offset(15)
            ConstraintMaker.right.equalTo(whiteBg.snp.right).offset(-15)
        }
        //MARK:合计金额
        totalAmount.text = "合计￥4342.00"
        totalAmount.textColor = UIColor.black
        totalAmount.font = UIFont.systemFont(ofSize: 13)
        contentView.addSubview(totalAmount)
        totalAmount.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(commodityLine.snp.bottom).offset(15)
            ConstraintMaker.right.equalTo(freight.snp.left).offset(-6)
        }
        totalLine.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        contentView.addSubview(totalLine)
        totalLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(whiteBg)
            ConstraintMaker.top.equalTo(totalCommodity.snp.bottom).offset(15)
            ConstraintMaker.right.equalTo(whiteBg)
            ConstraintMaker.height.equalTo(1)
        }
        //MARK:修改价格按钮
        contentView.addSubview(modifyPriceBtn)
        modifyPriceBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(totalLine.snp.bottom).offset(7)
            ConstraintMaker.right.equalTo(whiteBg.snp.right).offset(-15)
            ConstraintMaker.width.equalTo(105)
            ConstraintMaker.height.equalTo(30)
        }
        modifyPriceBtn.addTarget(self, action: #selector(tapModifyPriceOrDeliveryGoods), for: UIControl.Event.touchUpInside)
        
        //MARK:移入回收站按钮
        contentView.addSubview(recycleBinBtn)
        recycleBinBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(totalLine.snp.bottom).offset(7)
            ConstraintMaker.right.equalTo(modifyPriceBtn.snp.left).offset(-15)
            ConstraintMaker.width.equalTo(95)
            ConstraintMaker.height.equalTo(30)
        }
    }
    
    
    @objc func tapModifyPriceOrDeliveryGoods() {
        modifyPriceOrDeliveryGoods?()
    }
    
    @objc func tapMoveToRecycleBin() {
        moveToRecycleBin?()
    }
    
    @objc func tapCallTheClient(){
        callTheClient?()
    }
    
    //设置修改价格按钮是否显示
    //TODO 设置按钮后灰色背景会偏移  可能cell或者tableview的宽度计算错误
    //    func setButton(modifyPrice:Bool,modifyPriceText:String,modifyPriceWidth:Int){
    //        //        if modifyPrice {
    //        modifyPriceBtn.setTitle(modifyPriceText, for: .normal)
    //        contentView.addSubview(modifyPriceBtn)
    //        modifyPriceBtn.snp.makeConstraints { (ConstraintMaker) in
    //            ConstraintMaker.top.equalTo(totalLine.snp.bottom).offset(7)
    //            ConstraintMaker.right.equalTo(whiteBg.snp.right).offset(-15)
    //            ConstraintMaker.width.equalTo(modifyPriceWidth)
    //            ConstraintMaker.height.equalTo(30)
    //        }
    //        //        }
    //        contentView.addSubview(recycleBinBtn)
    //        recycleBinBtn.snp.makeConstraints { (ConstraintMaker) in
    //            ConstraintMaker.top.equalTo(totalLine.snp.bottom).offset(7)
    //            ConstraintMaker.width.equalTo(95)
    //            ConstraintMaker.height.equalTo(30)
    //            if modifyPrice {
    //                ConstraintMaker.right.equalTo(modifyPriceBtn.snp.left).offset(-15)
    //            } else {
    //                ConstraintMaker.right.equalToSuperview().offset(-15)
    //            }
    //        }
    //    }
    
    var model: Order? {
        didSet {
            guard let model = model else { return }
            
            modifyPriceBtn.addTarget(self, action: #selector(tapModifyPriceOrDeliveryGoods), for:  UIControl.Event.touchUpInside)
            recycleBinBtn.addTarget(self, action: #selector(tapMoveToRecycleBin), for: UIControl.Event.touchUpInside)
            //TODO 判断 待付款,待收货,待发货 的状态  0 待付款  1待发货 2待收货 3已完成 5已取消
            
            userNameLaber.text = model.name
            userPhoneLaber.text = model.mobile
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
            orderNumberLaber.text = "订单号：" + String(model.order_no)
            totalCommodity.text = "共\(String(model.goodsList?.count ?? 0))件商品"
            freight.text = "(含运费￥\(String(model.express_price)))"
            totalAmount.text = "合计￥" + model.total_price
            
        }
    }
    
}
