//  批量设置价格和库存
//  UBatchSetPriceInventoryCell.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/14.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit


class UBatchSetPriceInventoryCell: UBaseTableViewCell {
    
    var setValue : (() -> ())?
    
    //MARK:批量设置
    var setBtn :  UIButton = {
        let ub = UIButton()
        ub.setTitle("批量设置", for: .normal)
        ub.setTitleColor(UIColor.hex(hexString: "#1C98F6"), for: .normal)
        ub.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return ub
    }()
    
    //MARK:价格及库存
    var priceInventory : UILabel = {
        let ul = UILabel()
        ul.text = "价格及库存"
        ul.font = UIFont.systemFont(ofSize: 15)
        ul.textColor = UIColor.hex(hexString: "#333333")
        return ul
    }()
    
    override func configUI() {
        
        //TODO 添加topView bottomView
        
        contentView.addSubview(priceInventory)
        priceInventory.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.left.equalToSuperview().offset(10)
            ConstraintMaker.top.equalToSuperview()
        }
        
        contentView.addSubview(setBtn)
        setBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalToSuperview()
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        setBtn.addTarget(self, action: #selector(tapSetValue), for: UIControl.Event.touchUpInside)
    }
    
    @objc func tapSetValue(){
        setValue?()
    }
    
}

