//
//  UHomeMessageManagementCell.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/16.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UHomeMessageManagementCell: BaseView {
    var menuIcon: UIImageView = {
        let iv = UIImageView()
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    var marginLabel: UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 12)
        tl.textColor = UIColor.hex(hexString: "#666666")
        tl.text = "消息管理"
        tl.isUserInteractionEnabled = true
        return tl
    }()
    func configUI() {
        menuIcon.image = UIImage.init(named: "homeMessageManagementCell")
        self.addSubview(menuIcon)
        menuIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalToSuperview()
        }
        
        self.addSubview(marginLabel)
        marginLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalToSuperview()
            ConstraintMaker.top.equalTo(menuIcon.snp.bottom).offset(8)
        }
    }
}
