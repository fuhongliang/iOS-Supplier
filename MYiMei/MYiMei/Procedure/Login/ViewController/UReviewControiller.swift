//
//  UReviewControiller.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/2.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UReviewControiller: UBaseViewController {
    
    let mUReviwView = UReviwView()
    
    override func configUI() {
        mUReviwView.setView()
        self.view.addSubview(mUReviwView)
        self.view.backgroundColor = UIColor.white
        
        mUReviwView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
}
