//
//  UChangePasswordView.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/5.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

protocol UChangePasswordViewDelegate: AnyObject {
    func tapGetVerificationCodeAction()
    
    func tapConfirmChangeCodeAction(code:String,newPassword:String,newPasswordAgain:String)
}



class UChangePasswordView: BaseView {
    //MARK:申明各种控件变量
    weak var delegate: UChangePasswordViewDelegate?
    
    var backgroundWhite = UIView()
    
    var phoneNumberLabel = UILabel()
    var getVerificationCodeBtn = UIButton()
    
    var inputVerificationCodeEdit = UITextField()
    var inputPasswordEdit = UITextField()
    var inputPasswordAgainEdit = UITextField()
    var confirmChange = UIButton()
    
    var phoneLine = UIView()
    var verificationCodeLine = UIView()
    var passwordLine = UIView()
    var passwordAgainLine = UIView()
    
    //密码提示文本
    var passwordTip = UILabel()
    
    func configUI(){
        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        
        //MARK:背景颜色
        self.addSubview(backgroundWhite)
        backgroundWhite.backgroundColor = UIColor.white
        backgroundWhite.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(225)
        }
        
        //MARK:手机号
        phoneNumberLabel.text = APIUser.shared.user?.tel ?? ""
        phoneNumberLabel.textColor = UIColor.black
        phoneNumberLabel.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(phoneNumberLabel)
        phoneNumberLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(backgroundWhite.snp.top).offset(14)
        }
        
        //MARK:获取验证码
        getVerificationCodeBtn.setTitle("获取验证码", for: .normal)
        getVerificationCodeBtn.setTitleColor(UIColor.hex(hexString: "#1C98F6"), for: .normal)
        getVerificationCodeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        getVerificationCodeBtn.clipsToBounds = true
        getVerificationCodeBtn.layer.cornerRadius = 3
        getVerificationCodeBtn.layer.borderWidth = 0.5
        getVerificationCodeBtn.layer.borderColor = UIColor.hex(hexString: "#1C98F6").cgColor
        getVerificationCodeBtn.backgroundColor = UIColor.white
        self.addSubview(getVerificationCodeBtn)
        getVerificationCodeBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(phoneNumberLabel.snp.top)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.bottom.equalTo(phoneNumberLabel.snp.bottom)
            ConstraintMaker.height.equalTo(30)
            ConstraintMaker.width.equalTo(87)
        }
        getVerificationCodeBtn.addTarget(self, action: #selector(getVerification), for:  UIControl.Event.touchUpInside)
        
        //MARK:手机号分割线
        phoneLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(phoneLine)
        phoneLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(phoneNumberLabel.snp.bottom).offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(0.5)
        }
        
        //MARK:验证码输入框
        inputVerificationCodeEdit.placeholder = "请输入6位数验证码"
        inputVerificationCodeEdit.font = UIFont.systemFont(ofSize: 17)
        inputVerificationCodeEdit.textColor = UIColor.hex(hexString: "#999999")
        inputVerificationCodeEdit.keyboardType = UIKeyboardType.numberPad
        self.addSubview(inputVerificationCodeEdit)
        inputVerificationCodeEdit.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.width.equalToSuperview()
            ConstraintMaker.height.equalTo(55)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.top.equalTo(phoneLine.snp.bottom)
        }
        
        //MARK:验证码分割线
        verificationCodeLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(verificationCodeLine)
        verificationCodeLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(inputVerificationCodeEdit.snp.bottom)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(0.5)
        }
        
        //MARK:密码输入框
        inputPasswordEdit.placeholder = "请输入新密码"
        inputPasswordEdit.font = UIFont.systemFont(ofSize: 17)
        inputPasswordEdit.textColor = UIColor.black
        self.addSubview(inputPasswordEdit)
        inputPasswordEdit.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.width.equalToSuperview()
            ConstraintMaker.height.equalTo(55)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.top.equalTo(verificationCodeLine.snp.bottom)
        }
        
        //MARK:密码分割线
        passwordLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(passwordLine)
        passwordLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(inputPasswordEdit.snp.bottom)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(0.5)
        }
        
        //MARK:确认密码输入框
        inputPasswordAgainEdit.placeholder = "请再次输入密码"
        inputPasswordAgainEdit.font = UIFont.systemFont(ofSize: 17)
        inputPasswordAgainEdit.textColor = UIColor.black
        self.addSubview(inputPasswordAgainEdit)
        inputPasswordAgainEdit.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.width.equalToSuperview()
            ConstraintMaker.height.equalTo(55)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.top.equalTo(passwordLine.snp.bottom)
        }
        
        passwordAgainLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(passwordAgainLine)
        passwordAgainLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalTo(inputPasswordAgainEdit.snp.bottom)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(0.5)
        }
        
        //MARK:密码提示语
        passwordTip.text = "新密码不能与原密码一样（大于6位）"
        passwordTip.font = UIFont.systemFont(ofSize: 12)
        passwordTip.textColor = UIColor.hex(hexString: "#999999")
        self.addSubview(passwordTip)
        passwordTip.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(passwordAgainLine.snp.bottom).offset(20)
            ConstraintMaker.right.equalToSuperview()
        }
    
        //MARK:确认修改按钮
        confirmChange.setTitle("确认修改", for: .normal)
        confirmChange.titleLabel?.textColor = UIColor.white
        confirmChange.clipsToBounds = true
        confirmChange.layer.cornerRadius = 4
        confirmChange.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        self.addSubview(confirmChange)
        confirmChange.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.top.equalTo(passwordTip.snp.bottom).offset(31)
            ConstraintMaker.height.equalTo(44)
        }
        confirmChange.addTarget(self, action: #selector(ConfirmChange), for: UIControl.Event.touchUpInside)
        
    }
    
    @objc func getVerification() {
        delegate?.tapGetVerificationCodeAction()
    }
    
    @objc func ConfirmChange() {
        delegate?.tapConfirmChangeCodeAction(code: inputVerificationCodeEdit.text!, newPassword: inputPasswordEdit.text!, newPasswordAgain: inputPasswordAgainEdit.text!)
    }
    
    
}
