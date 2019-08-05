//
//  UDepostController.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/9.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UDepostController: UBaseViewController {
    
    let mDepostController = UDepost()
    
    override func configUI() {
        mDepostController.setView()
        self.view.addSubview(mDepostController)
        self.view.backgroundColor = UIColor.white
        mDepostController.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
}
