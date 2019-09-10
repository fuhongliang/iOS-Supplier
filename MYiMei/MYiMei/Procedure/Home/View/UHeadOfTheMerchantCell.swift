//
//  UHeadOfTheMerchantCell.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/7.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UHeadOfTheMerchantCell: UBaseTableViewCell {
    
    var tapAddOrRemove : (() -> ())?
    
    //MARK:团长头像
    var headIcon : UIImageView = {
        let uiv = UIImageView()
        uiv.layer.cornerRadius = 22
        uiv.layer.masksToBounds = true
        return uiv
    }()
    
    //MARK:团长名字
    var headName : UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 14)
        return ul
    }()
    
    //MARK:团长地址
    var headAddress : UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#999999")
        ul.font = UIFont.systemFont(ofSize: 11)
        return ul
    }()
    
    //MARK:添加或者删除按钮
    var addOrRemoveBtn :  UIButton = {
        let ub = UIButton()
        ub.titleLabel?.textColor = UIColor.white
        ub.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        ub.layer.cornerRadius = 13.5
        ub.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        return ub
    }()
    
    override func configUI() {
        
        contentView.addSubview(headIcon)
        headIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.size.equalTo(44)
        }
        
        contentView.addSubview(headName)
        headName.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(headIcon).offset(5)
            ConstraintMaker.left.equalTo(headIcon.snp.right).offset(10)
        }
        
        contentView.addSubview(headAddress)
        headAddress.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.bottom.equalTo(headIcon).offset(-5)
            ConstraintMaker.left.equalTo(headIcon.snp.right).offset(10)
        }
        
        contentView.addSubview(addOrRemoveBtn)
        addOrRemoveBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.height.equalTo(27)
            ConstraintMaker.width.equalTo(49)
        }
        addOrRemoveBtn.addTarget(self, action: #selector(addOrRemove), for: UIControl.Event.touchUpInside)
        
    }
    
    @objc func addOrRemove(){
        tapAddOrRemove?()
    }
    
    var listType : Int? {
        didSet {
            addOrRemoveBtn.setTitle(listType == 1 ? "删除":"添加", for: .normal)
        }
    }
    
    var model : HeadOfShareListModel? {
        didSet {
            guard model != nil else { return }
            headName.text = model!.name
            headAddress.text = model!.address
            headIcon.load(model!.avatar_url)
            
        }
        
    }
    
}
