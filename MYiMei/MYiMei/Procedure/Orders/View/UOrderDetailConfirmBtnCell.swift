//
//  UOrderDetailConfirmBtnCell.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/17.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UOrderDetailConfirmBtnCell: UBaseTableViewCell {
    
    
    
    var sectionCellBtn : UIButton = {
        let ul = UIButton()
        ul.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        ul.setTitleColor(UIColor.black, for: .normal)
        return ul
    }()
    
    override func configUI() {
        contentView.addSubview(sectionCellBtn)
        sectionCellBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.equalToSuperview().offset(15)
            ConstraintMaker.height.equalTo(44)
        }
    }
    
}
