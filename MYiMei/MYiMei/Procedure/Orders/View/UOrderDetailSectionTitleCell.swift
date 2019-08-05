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
    
    var sectionCellTitle : UILabel = {
        let ul = UILabel()
        ul.font = UIFont.systemFont(ofSize: 18)
        ul.textColor = UIColor.black
        return ul
    }()
    
    override func configUI() {
        contentView.addSubview(sectionCellTitle)
        sectionCellTitle.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.centerY.equalToSuperview()
        }
    }
    
}
