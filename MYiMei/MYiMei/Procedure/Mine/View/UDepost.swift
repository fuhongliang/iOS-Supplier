//
//  UDepost.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/9.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

protocol UDepostViewDelegate: AnyObject {
    func tapPush(money: String)
    func choosePicAction()
}

class UDepost: BaseView {
    //MARK:接口代理
    weak var delegate: UDepostViewDelegate?

    //转账账号
    var accountBg = UIImageView()
    var transferLaber = UILabel()
    var accountNameLaber = UILabel()
    var accountBankLaber = UILabel()
    var bankNumberLaber = UILabel()

    //上传保证金
    var certificateLaber = UILabel()
    var uploadPicBtn = UIButton()
    var uploadBg = UIImageView()
    var depostBg = UIImageView()


    //保证金金额
    var depostLaber = UILabel()
    var depostEdit = UITextField()
    var certificateBg = UIImageView()

    //提交按钮
    var submitBtn = UIButton()
    
    
    func setView(){
        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        
        accountBg.backgroundColor = UIColor.white
        self.addSubview(accountBg)
        accountBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(106)
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
        }
        //MARK:请转账至以下账号
        transferLaber.text = "请转账至以下账号"
        transferLaber.textColor = UIColor.black
        transferLaber.font = UIFont.boldSystemFont(ofSize: 15)
        self.addSubview(transferLaber)
        transferLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(accountBg.snp.left).offset(15)
            ConstraintMaker.top.equalTo(accountBg.snp.top).offset(15)
        }
        //MARK:开户名
        accountNameLaber.text = "开户名：肖洪琛"
        accountNameLaber.textColor = UIColor.hex(hexString: "#808080")
        accountNameLaber.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(accountNameLaber)
        accountNameLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(transferLaber.snp.bottom).offset(8)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //MARK:开户银行
        accountBankLaber.text = "开户银行：中国银行"
        accountBankLaber.textColor = UIColor.hex(hexString: "#808080")
        accountBankLaber.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(accountBankLaber)
        accountBankLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(accountNameLaber.snp.bottom).offset(5)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //MARK:银行卡号
        bankNumberLaber.text = "银行卡号：6217 85700 0081358 036"
        bankNumberLaber.textColor = UIColor.hex(hexString: "#808080")
        bankNumberLaber.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(bankNumberLaber)
        bankNumberLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(accountBankLaber.snp.bottom).offset(5)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }

        //MARK:凭证背景
        certificateBg.backgroundColor = UIColor.white
        self.addSubview(certificateBg)
        certificateBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(210)
            ConstraintMaker.top.equalTo(accountBg.snp.bottom).offset(15)
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
        }
        //MARK:上传凭证照片
        certificateLaber.text = "请选择上传保证金转账凭证"
        certificateLaber.textColor = UIColor.hex(hexString: "#010101")
        certificateLaber.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(certificateLaber)
        certificateLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(certificateBg.snp.top).offset(19)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }

        //MARK:上传照片背景
        uploadBg.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        uploadBg.layer.cornerRadius = 3
        self.addSubview(uploadBg)
        uploadBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(150)
            ConstraintMaker.top.equalTo(certificateLaber.snp.bottom).offset(11)
            ConstraintMaker.left.equalTo(certificateBg.snp.left).offset(15)
            ConstraintMaker.right.equalTo(certificateBg.snp.right).offset(-15)
        }

        //MARK:添加上传照片图片

        uploadPicBtn.setImage(UIImage.init(named: "add_photo"), for: UIControl.State.normal)
        uploadPicBtn.setTitleColor(UIColor.hex(hexString: "#999999"), for: UIControl.State.normal)
        uploadPicBtn.setTitle("上传照片", for: UIControl.State.normal)
        uploadPicBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        uploadPicBtn.sizeToFit()
        uploadPicBtn.layoutButton(style: .Top, imageTitleSpace: 10)
        self.addSubview(uploadPicBtn)
        uploadPicBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(certificateBg.snp.left).offset(15)
            ConstraintMaker.top.equalTo(certificateLaber.snp.bottom).offset(11)
            ConstraintMaker.right.equalTo(certificateBg.snp.right).offset(-15)
            ConstraintMaker.height.equalTo(150)
        }

        uploadPicBtn.addTarget(self, action: #selector(choosePicAction), for: UIControl.Event.touchDown)


        //MARK:保证金背景
        depostBg.backgroundColor = UIColor.white
        self.addSubview(depostBg)
        depostBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.top.equalTo(certificateBg.snp.bottom).offset(15)
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
        }
        //MARK:保证金字段
        depostLaber.text = "保证金金额"
        depostLaber.textColor = UIColor.hex(hexString: "#010101")
        depostLaber.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(depostLaber)
        depostLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(depostBg.snp.top).offset(14)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //MARK:输入框
        depostEdit.tintColor = UIColor.hex(hexString: "#CCCCCC")
        depostEdit.textColor = UIColor.black
        depostEdit.placeholder = "请输入保证金金额"
        depostEdit.font = UIFont.systemFont(ofSize: 17)
        depostEdit.textAlignment = .right
        self.addSubview(depostEdit)
        depostEdit.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(depostBg.snp.top)
            ConstraintMaker.left.equalTo(depostLaber.snp.right).offset(30)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        //MARK:按钮
        submitBtn.setTitle("提交", for: UIControl.State.normal)
        submitBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        submitBtn.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        submitBtn.layer.masksToBounds = true
        submitBtn.layer.cornerRadius = 3
        submitBtn.titleLabel?.font = UIFont .boldSystemFont(ofSize: 17)
        self.addSubview(submitBtn)
        submitBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(depostBg.snp.bottom).offset(30)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(44)
        }

        submitBtn.addTarget(self, action: #selector(pushAction), for: UIControl.Event.touchDown)
        
    }

    @objc func pushAction() {
        delegate?.tapPush(money: depostEdit.text!)
    }

    @objc func choosePicAction() {
        delegate?.choosePicAction()
    }
}


