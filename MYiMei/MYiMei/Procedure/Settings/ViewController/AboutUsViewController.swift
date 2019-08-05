//
//  AboutUsViewController.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/7/19.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class AboutUsViewController: UBaseViewController {

    let mAboutUsView = UAboutUsView()

    override func configUI() {
        mAboutUsView.setView()
        self.view.addSubview(mAboutUsView)
        self.view.backgroundColor = UIColor.white

        mAboutUsView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
}
