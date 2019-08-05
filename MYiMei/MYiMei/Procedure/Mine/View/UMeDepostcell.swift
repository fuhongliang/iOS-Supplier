//
//  UMeDepostcell.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/9.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UMeDepostcell: UBaseTableViewCell {

    var depostBg: UIImageView = {
        let iv = UIImageView()
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    var depostPhoto: UIImageView = {
        let tl = UIImageView()
        tl.isUserInteractionEnabled = true
        return tl
    }()

    override func configUI() {
        
        depostBg.backgroundColor = UIColor.white
        self.addSubview(depostBg)
        depostBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(165)
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.top.equalToSuperview()
        }
        
        depostPhoto.backgroundColor = UIColor.black
        self.addSubview(depostPhoto)
        depostPhoto.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(depostBg.snp.top)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        
    }
}
