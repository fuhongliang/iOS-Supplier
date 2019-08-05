//
//  UShopLabelNotArrowCell.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/5.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UShopLabelCell: UBaseTableViewCell {
    
    var layerView: UIView = {
        let layerView = UIView()
        layerView.backgroundColor = UIColor.white
        return layerView
    }()
    
    var instructionsLabel: UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 17)
        tl.textColor = UIColor.black
        tl.text = "店铺名字"
        return tl
    }()
    
    var contentLabel: UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 17)
        tl.textColor = UIColor.black
        tl.text = "陆丰箭牌卫浴旗舰店"
        return tl
    }()
    
    var arrowImg: UIImageView = {
        let rightArrow = UIImageView()
        rightArrow.image = UIImage.init(named: "notice")
        return rightArrow
    }()
    
   var line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        return line
    }()
    
    override func configUI() {
        
        contentView.addSubview(layerView)
        layerView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.top.left.right.equalToSuperview()
        }
        
        layerView.addSubview(instructionsLabel)
        instructionsLabel.snp.makeConstraints { (ConstraintMaker) in
            
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        
        layerView.addSubview(arrowImg)
        arrowImg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.width.equalTo(9)
            ConstraintMaker.height.equalTo(14)
        }
        
        layerView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.right.equalTo(arrowImg.snp.left).offset(-10)
            ConstraintMaker.left.equalTo(instructionsLabel.snp.right).offset(10)
        }
        
    }
    
}
