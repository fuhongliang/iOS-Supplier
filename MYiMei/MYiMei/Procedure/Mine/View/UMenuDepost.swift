//
//  UMenuDepost.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/9.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UMenuDepost: BaseView {
    var menuIcon: UIImageView = {
        let iv = UIImageView()
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    var marginLabel: UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 12)
        tl.textColor = UIColor.hex(hexString: "#333333")
        tl.text = "保证金"
        tl.isUserInteractionEnabled = true
        return tl
    }()
    func configUI() {
        menuIcon.image = UIImage.init(named: "menu_margin")
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
