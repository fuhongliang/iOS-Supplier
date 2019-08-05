//
//  UBottomTab.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/25.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UBottomTab: BaseView {

    var line = UIImageView()
    
    
    var addCategoryBtn = UIButton()

    var addGoodsBtn = UIButton()

    var addManageCategoryBtn = UIButton()

    func configUI() {
        self.backgroundColor = UIColor.white

        line.backgroundColor = UIColor.hex(hexString: "#CCCCCC")
        self.addSubview(line)
        line.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.top.equalToSuperview()
        }

        addCategoryBtn.setImage(UIImage.init(named: "add_bar_right"), for: UIControl.State.normal)
        addCategoryBtn.setTitleColor(UIColor.theme, for: UIControl.State.normal)
        addCategoryBtn.setTitle("新建分类", for: UIControl.State.normal)
        addCategoryBtn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        addCategoryBtn.sizeToFit()
        addCategoryBtn.layoutButton(style: .Top, imageTitleSpace: 10)
        self.addSubview(addCategoryBtn)
        addCategoryBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.width.equalToSuperview().dividedBy(3)
            ConstraintMaker.height.equalTo(48)
            ConstraintMaker.centerY.equalToSuperview()
        }

        addGoodsBtn.setImage(UIImage.init(named: "add_goods"), for: UIControl.State.normal)
        addGoodsBtn.setTitle("发布商品", for:.normal)
        addGoodsBtn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        addGoodsBtn.sizeToFit()
        addGoodsBtn.setTitleColor(UIColor.theme, for: UIControl.State.normal)
        addGoodsBtn.layoutButton(style: .Top, imageTitleSpace: 10)

        self.addSubview(addGoodsBtn)
        addGoodsBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(addCategoryBtn.snp.right)
            ConstraintMaker.width.equalToSuperview().dividedBy(3)
            ConstraintMaker.height.equalTo(48)
            ConstraintMaker.centerY.equalToSuperview()

        }

        addManageCategoryBtn.setImage(UIImage.init(named: "management_category"), for: UIControl.State.normal)
        addManageCategoryBtn.setTitle("管理分类", for:.normal)
        addManageCategoryBtn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        addManageCategoryBtn.sizeToFit()
        addManageCategoryBtn.setTitleColor(UIColor.theme, for: UIControl.State.normal)
        addManageCategoryBtn.layoutButton(style: .Top, imageTitleSpace: 10)

        self.addSubview(addManageCategoryBtn)
        addManageCategoryBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(addGoodsBtn.snp.right)
            ConstraintMaker.width.equalToSuperview().dividedBy(3)
            ConstraintMaker.height.equalTo(48)
            ConstraintMaker.centerY.equalToSuperview()

        }
    }
}
