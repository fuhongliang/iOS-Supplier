//
//  UFeedBackView.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/5.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import KMPlaceholderTextView

class UFeedBackView: BaseView {
    //MARK:申明各种控件变量
    
    var inputFeedEdit = KMPlaceholderTextView()
    var inputContact = UITextField()
    var saveBtn = UIButton()
    
    func configUI(){
        
        //MARK:意见或建议输入框
        inputFeedEdit.textColor = UIColor.black
        inputFeedEdit.font = UIFont.systemFont(ofSize: 17)
        inputFeedEdit.placeholder = "请留下您的宝贵意见或建议，我们将努力改进"
        inputFeedEdit.placeholderFont = UIFont.systemFont(ofSize: 17)
        inputFeedEdit.contentInset.left = 13
        self.addSubview(inputFeedEdit)
        inputFeedEdit.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(160)
            ConstraintMaker.top.equalToSuperview().offset(11)
        }
        
        //MARK:联系方式输入框
        inputContact.placeholder = "请留下您的联系方式，以便我们联系您"
        inputContact.font = UIFont.systemFont(ofSize: 17)
        inputContact.textColor = UIColor.black
        inputContact.backgroundColor = UIColor.white
        inputContact.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 20))
        inputContact.leftViewMode = .always
        self.addSubview(inputContact)
        inputContact.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.width.equalToSuperview()
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.top.equalTo(inputFeedEdit.snp.bottom).offset(15)
        }
        
        //MARK:确认修改按钮
        saveBtn.setTitle("保存", for: .normal)
        saveBtn.titleLabel?.textColor = UIColor.white
        saveBtn.clipsToBounds = true
        saveBtn.layer.cornerRadius = 4
        saveBtn.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        self.addSubview(saveBtn)
        saveBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.top.equalTo(inputContact.snp.bottom).offset(31)
            ConstraintMaker.height.equalTo(44)
        }
    }
    
}
