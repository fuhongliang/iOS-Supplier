//
//  UShopLabelImgCell.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/5.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UShopLabelImgCell: UBaseTableViewCell {
    
    var layerView: UIView = {
        let layerView = UIView()
        layerView.backgroundColor = UIColor.white
        return layerView
    }()
    
    var instructionsLabel: UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 17)
        tl.textColor = UIColor.black
        tl.text = "店铺头像"
        return tl
    }()
    
    var arrowImg: UIImageView = {
        let rightArrow = UIImageView()
        rightArrow.image = UIImage.init(named: "notice")
        return rightArrow
    }()
    
    var shopImg: UIImageView = {
        let shopImg = UIImageView()
        return shopImg
    }()
    
    private lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        return line
    }()
    
    override func configUI() {
        
        contentView.addSubview(layerView)
        layerView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(55)
            ConstraintMaker.top.left.right.equalToSuperview()
        }
        
        layerView.addSubview(instructionsLabel)
        instructionsLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.centerY.equalToSuperview()
        }
        
        layerView.addSubview(arrowImg)
        arrowImg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.width.equalTo(9)
            ConstraintMaker.height.equalTo(14)
        }
        
        contentView.addSubview(shopImg)
        shopImg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.width.height.equalTo(36)
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.right.equalTo(arrowImg.snp.left).offset(-10)
        }
        
//        layerView.addSubview(line)
//        line.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.bottom.equalToSuperview()
//            ConstraintMaker.left.equalToSuperview().offset(10)
//        }
    }
}
