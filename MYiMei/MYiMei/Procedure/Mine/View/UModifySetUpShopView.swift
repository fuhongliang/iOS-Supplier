//
//  UModifySetUpShopView.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/11.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

protocol UModifySetUpShopViewDelegate: AnyObject {
    func tapOkAction(content:String)
    
}

class UModifySetUpShopView: BaseView {
    
    weak var delegate: UModifySetUpShopViewDelegate?
    //输入框
    var modifyEdit = UITextField()
    //按钮
    var saveBtn = UIButton()
    //背景
    var modifyBg = UIImageView()
    
    func setView() {
        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        
        modifyBg.backgroundColor = UIColor.white
        self.addSubview(modifyBg)
        modifyBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(44)
        }
        modifyEdit.textColor = UIColor.black
        modifyEdit.backgroundColor = UIColor.white
        modifyEdit.placeholder = "请输入"
        modifyEdit.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(modifyEdit)
        modifyEdit.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(modifyBg.snp.left).offset(15)
            ConstraintMaker.top.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(44)
        }
        
        saveBtn.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        saveBtn.setTitle("保存", for: UIControl.State.normal)
        saveBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        saveBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        saveBtn.layer.masksToBounds = true
        saveBtn.layer.cornerRadius = 3
        self.addSubview(saveBtn)
        saveBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(modifyEdit.snp.bottom).offset(30)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(44)
        }
        saveBtn.addTarget(self, action: #selector(tapOk), for: UIControl.Event.touchDown)
    }
    
    @objc func tapOk() {
        delegate?.tapOkAction(content:modifyEdit.text!)
    }
}
