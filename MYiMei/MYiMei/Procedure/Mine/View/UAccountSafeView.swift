//
//  UAccountSafeView.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/4.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

protocol UAccountSafeViewDelegate: AnyObject {
    func tapLogoutAction()
    func tapModifyPasswordAction()
}

class UAccountSafeView: BaseView {
    //MARK:申明各种控件变量
    weak var delegate: UAccountSafeViewDelegate?

    //白色背景
    var backgroundWhite = UIImageView()
    
    //绑定手机
    var bindPhoneLabel = UILabel()
    var phoneNumberLabel = UILabel()
    
    //登录账号
    var loginAccountLabel = UILabel()
    var accountNameLabel = UILabel()
    
    //修改密码
    var modifyPasswordBtn = UIButton()
    var changePasswordLabel = UILabel()
    var rightArrow = UIImageView()
    
    //灰色线
    var bindLine = UIView()
    var accountLine = UIView()
    
    var submitButton = UIButton()
    
    //MARK:初始化试图控件
    func configUI() {
        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")

        //MARK:背景颜色
        self.addSubview(backgroundWhite)
        backgroundWhite.backgroundColor = UIColor.white
        backgroundWhite.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(145)
        }
        
        //MARK:绑定手机
        bindPhoneLabel.text = "联系电话"
        bindPhoneLabel.textColor = UIColor.black
        bindPhoneLabel.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(bindPhoneLabel)
        bindPhoneLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(backgroundWhite.snp.top).offset(14)
        }
        
        //MARK:手机号
        phoneNumberLabel.text = APIUser.shared.user?.tel ?? ""
        phoneNumberLabel.textColor = UIColor.hex(hexString: "#666666")
        phoneNumberLabel.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(phoneNumberLabel)
        phoneNumberLabel.snp.makeConstraints { (ConstraintMaker) in
           ConstraintMaker.top.equalTo(backgroundWhite.snp.top).offset(14)
            ConstraintMaker.left.equalTo(bindPhoneLabel.snp.right).offset(10)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        
        //MARK:绑定手机分割线
        bindLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(bindLine)
        bindLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(phoneNumberLabel.snp.bottom).offset(14)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(1)
        }

        loginAccountLabel.text = "联系人"
        loginAccountLabel.textColor = UIColor.black
        loginAccountLabel.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(loginAccountLabel)
        loginAccountLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(bindLine.snp.bottom).offset(14)
        }

        accountNameLabel.text = APIUser.shared.user?.realname ?? ""
        accountNameLabel.textColor = UIColor.hex(hexString: "#666666")
        accountNameLabel.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(accountNameLabel)
        accountNameLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(bindLine.snp.bottom).offset(14)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.left.equalTo(loginAccountLabel.snp.right).offset(10)
        }
        
        accountLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(accountLine)
        accountLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(loginAccountLabel.snp.bottom).offset(14)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(1)
        }
    
        
        modifyPasswordBtn.backgroundColor = UIColor.white
        self.addSubview(modifyPasswordBtn)
        modifyPasswordBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.equalToSuperview()
            ConstraintMaker.top.equalTo(accountLine.snp.bottom)
            
        }
        modifyPasswordBtn.addTarget(self, action: #selector(modifyPasswordAction), for: UIControl.Event.touchUpInside)
        changePasswordLabel.text = "修改密码"
        changePasswordLabel.textColor = UIColor.black
        changePasswordLabel.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(changePasswordLabel)
        changePasswordLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(accountLine.snp.bottom).offset(14)
            ConstraintMaker.width.equalTo(80)
        }
        
        
        rightArrow.image = UIImage.init(named: "notice")
        self.addSubview(rightArrow)
        rightArrow.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(14)
            ConstraintMaker.width.equalTo(9)
            ConstraintMaker.top.equalTo(accountLine.snp.bottom).offset(14)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }

        submitButton.setTitle("退出登录", for: .normal)
        submitButton.titleLabel?.textColor = UIColor.white
        submitButton.clipsToBounds = true
        submitButton.layer.cornerRadius = 4
        submitButton.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        self.addSubview(submitButton)
        submitButton.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.bottom.equalToSuperview().offset(-20)
            ConstraintMaker.height.equalTo(44)
        }
        submitButton.addTarget(self, action: #selector(logoutAction), for: UIControl.Event.touchUpInside)
        
    }

    @objc func logoutAction() {
        delegate?.tapLogoutAction()
    }
    @objc func modifyPasswordAction() {
        delegate?.tapModifyPasswordAction()
    }
}

