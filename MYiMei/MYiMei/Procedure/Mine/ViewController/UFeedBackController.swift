//
//  UFeedBackController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/5.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UFeedBackController: UBaseViewController {
    
    let feedBack = UFeedBackView()
    
    var title：String = "修改密码"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedBack.configUI()
        self.view.addSubview(feedBack)
        feedBack.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    
}
