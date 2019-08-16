//
//  UDistributionOrdersCell.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/6.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UDistributionOrdersCell: UBaseTableViewCell {
    
    var compeletDistribution : (() -> ())?
    var callTheClient : (() -> ())?
    
    //MARK:拣货单号
    var orderNoLabel:UILabel = {
        let ul = UILabel()
        ul.text = "拣货单号:"
        ul.textColor = UIColor.hex(hexString: "#999999")
        ul.font = UIFont.systemFont(ofSize: 14)
        return ul
    }()
    
    //MARK:生成时间
    var generateTime : UILabel = {
        let ul = UILabel()
        ul.text = "生成时间:"
        ul.textColor = UIColor.hex(hexString: "#999999")
        ul.font = UIFont.systemFont(ofSize: 14)
        return ul
    }()
    
    //MARK:拣货状态
    var orderStatus:UILabel = {
        let ul = UILabel()
        ul.text = "待拣货"
        ul.textColor = UIColor.hex(hexString: "#FF8A17")
        ul.font = UIFont.systemFont(ofSize: 14)
        return ul
    }()
    
    //MARK:拣货单信息下的线🧵
    var orderLine:UIView = {
        let uv = UIView()
        uv.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        return uv
    }()
    
    //MARK:商品信息
    //商品图片
    var goodsIcon:UIImageView = {
        let uiv = UIImageView()
        uiv.layer.cornerRadius = 2
        uiv.layer.masksToBounds = true
        return uiv
    }()
    //商品名称
    var goodsNameLabel:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 15)
        return ul
    }()
    //商品规格
    var goodsSpecification:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#999999")
        ul.font = UIFont.systemFont(ofSize: 12)
        return ul
    }()
    //商品价格
    var goodsPrice:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 14)
        return ul
    }()
    //商品数量
    var goodsNumber:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#999999")
        ul.font = UIFont.systemFont(ofSize: 12)
        return ul
    }()
    
    //MARK:商品信息下的线🧵
    var goodsLine:UIView = {
        let uv = UIView()
        uv.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        return uv
    }()
    
    //MARK:总计商品类数
    var allCatNumLabel:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 13)
        ul.text = "共1类商品"
        return ul
    }()
    
    //MARK:总计商品件数
    var allGoodsNumLabel:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 13)
        ul.text = "总共89件(合计¥4888)"
        return ul
    }()
    
    //MARK:商品数量下的线🧵
    var amountInfoLine:UIView = {
        let uv = UIView()
        uv.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        return uv
    }()
    
    var btnLayer:UIView = {
        let uv = UIView()
        return uv
    }()
    
    var compeletPickingBtn:UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        ub.layer.cornerRadius = 15
        ub.layer.masksToBounds = true
        ub.setTitle("完成拣货", for: .normal)
        ub.setTitleColor(UIColor.white, for: .normal)
        ub.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return ub
    }()
    
    let topView = UIView()
    let bottomView = UIView()
    
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
        ul.textColor = UIColor.hex(hexString: "##999999")
        ul.font = UIFont.systemFont(ofSize: 11)
        return ul
    }()
    
    var contactBtn : UIButton = {
        let ub = UIButton()
        return ub
    }()
    
    
    override func configUI() {
        
        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        
        contentView.layer.cornerRadius = 6
        contentView.layer.masksToBounds = true
        
        contentView.addSubview(topView)
        topView.snp.makeConstraints{(make)->Void in
            make.left.equalTo(contentView)
            make.width.equalTo(contentView)
            make.height.equalTo(1)
            make.top.equalTo(contentView)
        }
        
        //MARK:订单号分割线
        contentView.addSubview(orderLine)
        orderLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(topView).offset(49)
            ConstraintMaker.left.right.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
        }
        
        //MARK:订单号
        contentView.addSubview(orderNoLabel)
        orderNoLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(topView).offset(11)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        
        //MARK:生成时间
        contentView.addSubview(generateTime)
        generateTime.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(orderNoLabel.snp.bottom).offset(8)
            ConstraintMaker.left.equalToSuperview().offset(15)
//            ConstraintMaker.top.equalToSuperview()
            ConstraintMaker.bottom.equalTo(orderLine)
        }
        
        //MARK:拣货状态
        contentView.addSubview(orderStatus)
        orderStatus.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.top.bottom.equalToSuperview()
            ConstraintMaker.top.equalToSuperview()
            ConstraintMaker.bottom.equalTo(orderLine)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        
        
        //MARK:灰色背景
        contentView.addSubview(grayBg)
        grayBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(orderLine).offset(15)
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
        
        
        
        //MARK:商品图片
        contentView.addSubview(goodsIcon)
        goodsIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(contactBtn.snp.bottom).offset(15)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.size.equalTo(61)
        }
        
        //MARK:商品名称
        contentView.addSubview(goodsNameLabel)
        goodsNameLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(goodsIcon.snp.right).offset(11)
            ConstraintMaker.top.equalTo(goodsIcon)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        
        //MARK:商品规格
        contentView.addSubview(goodsSpecification)
        goodsSpecification.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(goodsIcon.snp.right).offset(11)
            ConstraintMaker.centerY.equalTo(goodsIcon)
        }
        
        //MARK:商品价格
        contentView.addSubview(goodsPrice)
        goodsPrice.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(goodsIcon.snp.right).offset(11)
            ConstraintMaker.bottom.equalTo(goodsIcon)
        }
        
        //MARK:商品数量
        contentView.addSubview(goodsNumber)
        goodsNumber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.bottom.equalTo(goodsIcon)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        
        //MARK:商品分割线
        contentView.addSubview(goodsLine)
        goodsLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.top.equalTo(goodsIcon.snp.bottom).offset(15)
            ConstraintMaker.height.equalTo(1)
        }
        
        //MARK:总计商品类数
        contentView.addSubview(allCatNumLabel)
        allCatNumLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(goodsLine.snp.bottom).offset(15)
        }
        
        //MARK:商品总计件数
        contentView.addSubview(allGoodsNumLabel)
        allGoodsNumLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(goodsLine.snp.bottom).offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        
        //MARK:商品总计分割线🧶
        contentView.addSubview(amountInfoLine)
        amountInfoLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(allGoodsNumLabel.snp.bottom).offset(15)
            ConstraintMaker.left.right.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
        }
        
        contentView.addSubview(btnLayer)
        btnLayer.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(amountInfoLine.snp.bottom)
            ConstraintMaker.left.right.equalToSuperview()
            ConstraintMaker.height.equalTo(44)
        }
        
        //MARK:配货按钮
        btnLayer.addSubview(compeletPickingBtn)
        compeletPickingBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.width.equalTo(95)
        }
        compeletPickingBtn.addTarget(self, action: #selector(tapCompeletDistribution), for: UIControl.Event.touchUpInside)
        
        contentView.addSubview(bottomView)
        bottomView.snp.makeConstraints{(make)->Void in
            make.left.equalTo(contentView)
            make.size.equalTo(1)
            make.top.equalTo(btnLayer.snp.bottom)
            make.bottom.equalTo(contentView)
        }
        
    }
    
    func resetConstraint(btnIsNeedHide:Bool){
        if btnIsNeedHide {
            btnLayer.removeFromSuperview()
            bottomView.snp.makeConstraints{(make)->Void in
                make.left.equalTo(contentView)
                make.size.equalTo(1)
                make.top.equalTo(amountInfoLine.snp.bottom)
                make.bottom.equalTo(contentView)
            }
        } else {
            contentView.addSubview(btnLayer)
            bottomView.snp.makeConstraints{(make)->Void in
                make.left.equalTo(contentView)
                make.size.equalTo(1)
                make.top.equalTo(btnLayer.snp.bottom)
                make.bottom.equalTo(contentView)
            }
        }
        
    }
    
    @objc func tapCompeletDistribution() {
        compeletDistribution?()
    }
    
    @objc func tapCallTheClient(){
        callTheClient?()
    }
    
    var model: DeliverGoodsModel? {
        didSet {
            guard let model = model else { return }
            
            orderNoLabel.text = "配货单号:\(String(model.deliver_id) )"
            generateTime.text = "生成时间:\(dateForMatter(timeString: model.addtime, join: " "))"
            if model.is_send == 0 {
                orderStatus.text = "待发货"
                orderStatus.textColor = UIColor.hex(hexString: "#FF8A17")
                resetConstraint(btnIsNeedHide: false)
            } else {
                orderStatus.text = "已发货"
                orderStatus.textColor = UIColor.hex(hexString: "#07D781")
                resetConstraint(btnIsNeedHide: true)
            }
            
            addressLabel.text = model.district
            
//            if (model.list.count != 0){
            goodsNameLabel.text = model.goods_info.name
            var label:String = ""
            for attr in (model.goods_info.attr ?? []){
                label = label + attr.attr_name
            }
            goodsSpecification.text = label
            goodsPrice.text = "￥" + (model.goods_info.total_price )
            goodsNumber.text = "x" + String(model.goods_info.num )
            let url = URL(string: model.goods_info.pic)
            goodsIcon.kf.setImage(with: url)
//            }
            
            allCatNumLabel.text = "共\(String(model.goods_attr_count ))类商品"
            
            let attributed = NSMutableAttributedString()
            let blueAttribute = NSMutableAttributedString.init(string: "总共\(model.num)件",attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
            let blackAttribute = NSMutableAttributedString.init(string: "(合计¥\(model.total_price ))",attributes: [NSAttributedString.Key.foregroundColor : UIColor.hex(hexString: "#FF4444")])
            attributed.append(blueAttribute)
            attributed.append(blackAttribute)
            
            allGoodsNumLabel.attributedText = attributed
            
        }
    }
    
}
