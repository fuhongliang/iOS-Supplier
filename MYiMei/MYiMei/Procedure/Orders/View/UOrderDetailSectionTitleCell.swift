//
//  UOrderDetailSectionTitleCell.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/17.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UOrderDetailSectionTitleCell : UBaseTableViewCell {
    
    public let cellHeight = 42
    
    //MARK:左边标题
    var sectionCellTitle : UILabel = {
        let ul = UILabel()
        ul.font = UIFont.systemFont(ofSize: 18)
        ul.textColor = UIColor.black
        return ul
    }()
    
    //MARK:右边标题
    var sectionCellRightTitle : UILabel = {
        let ul = UILabel()
        ul.font = UIFont.systemFont(ofSize: 18)
        ul.textColor = UIColor.hex(hexString: "#FF8A17")
        return ul
    }()
    
    override func configUI() {
        contentView.addSubview(sectionCellTitle)
        sectionCellTitle.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.centerY.equalToSuperview()
        }
        
        contentView.addSubview(sectionCellRightTitle)
        sectionCellRightTitle.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.centerY.equalToSuperview()
        }
    }
    
}
