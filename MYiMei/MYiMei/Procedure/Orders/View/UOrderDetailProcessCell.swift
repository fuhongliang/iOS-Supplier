//
//  UOrderDetailProcessCell.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/17.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UOrderDetailProcessCell : UBaseTableViewCell {
    
    public let cellHeight = 113
    
    var orderStatusBg : UIImageView = {
        let orderStatusBg = UIImageView()
        orderStatusBg.backgroundColor = UIColor.white
        orderStatusBg.layer.cornerRadius = 4
        return orderStatusBg
    }()
    
    var orderPushLabel : UILabel = {
        let ul = UILabel()
        ul.text = "提交订单"
        ul.textColor = UIColor.black
        ul.font = UIFont.systemFont(ofSize: 12)
        ul.textAlignment = .center
        return ul
    }()
    
    var orderPushIcon : UIImageView = {
        let orderPushIcon = UIImageView()
        orderPushIcon.image = UIImage.init(named: "order_status")
        return orderPushIcon
    }()
    
    var orderPushTimeLabel : UILabel = {
        let orderPushTimeLaber = UILabel()
        orderPushTimeLaber.text = ""
        orderPushTimeLaber.textColor = UIColor.hex(hexString: "#999999")
        orderPushTimeLaber.font = UIFont.systemFont(ofSize: 11)
        orderPushTimeLaber.textAlignment = .center
        orderPushTimeLaber.numberOfLines = 2
        return orderPushTimeLaber
    }()
    
    var orderPayLabel : UILabel = {
        let orderPayLaber = UILabel()
        orderPayLaber.text = "支付订单"
        orderPayLaber.textColor = UIColor.black
        orderPayLaber.font = UIFont.systemFont(ofSize: 12)
        orderPayLaber.textAlignment = .center
        return orderPayLaber
    }()
    
    var orderPayIcon : UIImageView = {
        let orderPayIcon = UIImageView()
        orderPayIcon.image = UIImage.init(named: "two_img")
        return orderPayIcon
    }()
    
    var orderPayTimeLabel : UILabel = {
       let orderPayTimeLaber = UILabel()
        orderPayTimeLaber.text = ""
        orderPayTimeLaber.textColor = UIColor.hex(hexString: "#999999")
        orderPayTimeLaber.font = UIFont.systemFont(ofSize: 11)
        orderPayTimeLaber.textAlignment = .center
        orderPayTimeLaber.numberOfLines = 2
        return orderPayTimeLaber
    }()
    
    var orderShippingLabel : UILabel = {
        let orderShippingLaber = UILabel()
        orderShippingLaber.text = "商家发货"
        orderShippingLaber.textColor = UIColor.black
        orderShippingLaber.font = UIFont.systemFont(ofSize: 12)
        orderShippingLaber.textAlignment = .center
        return orderShippingLaber
    }()
    
    var orderShippingIcon : UIImageView = {
        let orderShippingIcon = UIImageView()
        orderShippingIcon.image = UIImage.init(named: "three_img")
        return orderShippingIcon
    }()
    
    var orderShippingTimeLabel : UILabel = {
        let orderShippingTimeLabel = UILabel()
        orderShippingTimeLabel.text = ""
        orderShippingTimeLabel.textColor = UIColor.hex(hexString: "#999999")
        orderShippingTimeLabel.font = UIFont.systemFont(ofSize: 11)
        orderShippingTimeLabel.textAlignment = .center
        orderShippingTimeLabel.numberOfLines = 3
        return orderShippingTimeLabel
    }()
    
    var orderFinishLabel : UILabel = {
        let orderFinishLabel = UILabel()
        orderFinishLabel.text = "确认收货"
        orderFinishLabel.textColor = UIColor.black
        orderFinishLabel.font = UIFont.systemFont(ofSize: 12)
        orderFinishLabel.textAlignment = .center
        return orderFinishLabel
    }()
    
    var orderFinishIcon : UIImageView = {
        let orderFinishIcon = UIImageView()
        orderFinishIcon.image = UIImage.init(named: "four_img")
        return orderFinishIcon
    }()
    
    var orderFinishTimeLabel : UILabel = {
        let orderFinishTimeLabel = UILabel()
        orderFinishTimeLabel.text = ""
        orderFinishTimeLabel.textColor = UIColor.hex(hexString: "#999999")
        orderFinishTimeLabel.font = UIFont.systemFont(ofSize: 11)
        orderFinishTimeLabel.textAlignment = .center
        orderFinishTimeLabel.numberOfLines = 2
        return orderFinishTimeLabel
    }()
    
    var orderPushLine : UILabel = {
        let orderPushLine = UILabel()
        orderPushLine.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        orderPushLine.layer.cornerRadius = 3
        return orderPushLine
    }()
    
    var orderPayLine : UILabel = {
        let orderPayLine = UILabel()
        orderPayLine.backgroundColor = UIColor.hex(hexString: "#F0F0F0")
        orderPayLine.layer.cornerRadius = 3
        return orderPayLine
    }()
    
    var orderShippingLine : UILabel = {
        let orderShippingLine = UILabel()
        orderShippingLine.backgroundColor = UIColor.hex(hexString: "#F0F0F0")
        orderShippingLine.layer.cornerRadius = 3
        return orderShippingLine
    }()
    
    
    override func configUI() {
        
        contentView.addSubview(orderStatusBg)
        orderStatusBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(cellHeight)
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.top.equalToSuperview()
        }
        
        //MARK:提交订单
        orderStatusBg.addSubview(orderPushLabel)
        orderPushLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(orderStatusBg.snp.left)
            ConstraintMaker.top.equalTo(orderStatusBg.snp.top).offset(52)
            ConstraintMaker.width.equalToSuperview().dividedBy(4)
        }
        
        
        orderStatusBg.addSubview(orderPushIcon)
        orderPushIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.bottom.equalTo(orderPushLabel.snp.top).offset(-12)
            ConstraintMaker.width.height.equalTo(20)
            ConstraintMaker.centerX.equalTo(orderPushLabel)
        }
        
        
        orderStatusBg.addSubview(orderPushTimeLabel)
        orderPushTimeLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(orderPushLabel.snp.bottom).offset(11)
            ConstraintMaker.width.centerX.equalTo(orderPushLabel)
        }
        
        //MARK:支付订单
        orderStatusBg.addSubview(orderPayLabel)
        orderPayLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(orderPushLabel.snp.right)
            ConstraintMaker.top.equalToSuperview().offset(52)
            ConstraintMaker.width.equalToSuperview().dividedBy(4)
        }
        
        
        orderStatusBg.addSubview(orderPayIcon)
        orderPayIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.bottom.equalTo(orderPayLabel.snp.top).offset(-12)
            ConstraintMaker.width.height.equalTo(20)
            ConstraintMaker.centerX.equalTo(orderPayLabel)
        }
        
        
        orderStatusBg.addSubview(orderPayTimeLabel)
        orderPayTimeLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(orderPayLabel.snp.bottom).offset(11)
            ConstraintMaker.width.centerX.equalTo(orderPayLabel)
        }
        
        //MARK:商家发货
        
        orderStatusBg.addSubview(orderShippingLabel)
        orderShippingLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(orderPayLabel.snp.right)
            ConstraintMaker.top.equalToSuperview().offset(52)
            ConstraintMaker.width.equalToSuperview().dividedBy(4)
        }
        
        
        orderStatusBg.addSubview(orderShippingIcon)
        orderShippingIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.bottom.equalTo(orderShippingLabel.snp.top).offset(-12)
            ConstraintMaker.width.height.equalTo(20)
            ConstraintMaker.centerX.equalTo(orderShippingLabel)
        }
        
        
        orderStatusBg.addSubview(orderShippingTimeLabel)
        orderShippingTimeLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(orderShippingLabel.snp.bottom).offset(11)
            ConstraintMaker.width.centerX.equalTo(orderShippingLabel)
        }
        
        //MARK:确认收货
        
        orderStatusBg.addSubview(orderFinishLabel)
        orderFinishLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(orderShippingLabel.snp.right)
            ConstraintMaker.top.equalToSuperview().offset(52)
            ConstraintMaker.width.equalToSuperview().dividedBy(4)
        }
       
        orderStatusBg.addSubview(orderFinishIcon)
        orderFinishIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.bottom.equalTo(orderFinishLabel.snp.top).offset(-12)
            ConstraintMaker.width.height.equalTo(20)
            ConstraintMaker.centerX.equalTo(orderFinishLabel)
        }
        
        
        orderStatusBg.addSubview(orderFinishTimeLabel)
        orderFinishTimeLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(orderFinishLabel.snp.bottom).offset(11)
            ConstraintMaker.width.centerX.equalTo(orderFinishLabel)
        }
        
        //MARK:订单进度条
        orderStatusBg.addSubview(orderPushLine)
        orderPushLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(5)
            ConstraintMaker.left.equalTo(orderPushIcon.snp.right)
            ConstraintMaker.right.equalTo(orderPayIcon.snp.left)
            ConstraintMaker.bottom.equalTo(orderPushLabel.snp.top).offset(-19)
        }
        
        orderStatusBg.addSubview(orderPayLine)
        orderPayLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(5)
            ConstraintMaker.left.equalTo(orderPayIcon.snp.right)
            ConstraintMaker.right.equalTo(orderShippingIcon.snp.left)
            ConstraintMaker.bottom.equalTo(orderPushLabel.snp.top).offset(-19)
        }
        
        orderStatusBg.addSubview(orderShippingLine)
        orderShippingLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(5)
            ConstraintMaker.left.equalTo(orderShippingIcon.snp.right)
            ConstraintMaker.right.equalTo(orderFinishIcon.snp.left)
            ConstraintMaker.bottom.equalTo(orderPushLabel.snp.top).offset(-19)
        }
        
    }
    
}
