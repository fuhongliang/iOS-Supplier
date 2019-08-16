//
//  UShopLabelTextFieldCell.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/5.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UShopLabelTextFieldCell: UBaseTableViewCell {
    
    var layerView: UIView = {
        let layerView = UIView()
        layerView.backgroundColor = UIColor.white
        return layerView
    }()
    
    var instructionsLabel: UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 17)
        tl.textColor = UIColor.black
        tl.text = "商家背景颜色"
        return tl
    }()
    
    var contentLabel: UITextField = {
        let tl = UITextField()
        tl.font = UIFont.systemFont(ofSize: 17)
        tl.textColor = UIColor.hex(hexString: "#999999")
        tl.text = "#DDDDDD"
        tl.textAlignment = .right
        tl.placeholder = "颜色值为RGB"
        return tl
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
            ConstraintMaker.width.top.left.equalToSuperview()
        }
        
        layerView.addSubview(instructionsLabel)
        instructionsLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        
        layerView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.left.equalTo(instructionsLabel.snp.right).offset(10)
        }
        
    }
}
