//
//  UOrderDetailGoodsCell.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/17.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UOrderDetailGoodsCell : UBaseTableViewCell {
    
    let cellHeight = 61
    
    var commodityIcon: UIImageView = {
        let img = UIImageView()
        img.image = UIImage.init(named: "apply_status")
        return img
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
    
    override func configUI() {

        //MARK:商品图片
        self.addSubview(commodityIcon)
        commodityIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.size.equalTo(61)
            ConstraintMaker.top.left.equalToSuperview().offset(15)
        }
        //MARK:商品名称
        self.addSubview(commodityNameLaber)
        commodityNameLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(commodityIcon)
            ConstraintMaker.left.equalTo(commodityIcon.snp.right).offset(11)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        
        //MARK:商品规格
        self.addSubview(commoditySpecificationLaber)
        commoditySpecificationLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalTo(commodityIcon)
            ConstraintMaker.left.equalTo(commodityIcon.snp.right).offset(11)
        }
        //MARK:商品价格
        self.addSubview(commodityPriceLaber)
        commodityPriceLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.bottom.equalTo(commodityIcon)
            ConstraintMaker.left.equalTo(commodityIcon.snp.right).offset(11)
        }
        //MARK:商品数量
        self.addSubview(commodityNumberLaber)
        commodityNumberLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.centerY.equalTo(commodityPriceLaber)
        }
    }
    
}
