//
//  UWeChatWithdrawView.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/30.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UWeChatWithdrawView: BaseView {
    //可提现金额背景
    var cashWithdrawalAmountBg = UIImageView()
    //可提现金额
    var cashWithdrawalAmountLaber = UILabel()
    //可提现金额数字
    var cashWithdrawalAmountNUmberLaber = UILabel()
    //可提现金额分割线
    var cashWithdrawalAmountLine = UILabel()
    //提现金额
    var withdrawalAmountLaber = UILabel()
    //输入提现金额
    var withdrawalAmountNumberEdit = UITextField()
    //转账信息
    var transferInformationLaber = UILabel()
    //微信背景
    var weChatNumberBg = UIImageView()
    //微信号
    var weChatNumberLaber = UILabel()
    //微信号输入框
    var weChatNumberEdit = UITextField()
    //微信号分割线
    var weChatNumberLine = UILabel()
    //微信昵称
    var weChatNameLaber = UILabel()
    //微信昵称输入框
    var weChatNameEdit = UITextField()
    //提现按钮
    var withdrawalBtn = UIButton()
    func setView() {
        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        //MARK:可提现金额背景
        cashWithdrawalAmountBg.backgroundColor = UIColor.white
        self.addSubview(cashWithdrawalAmountBg)
        cashWithdrawalAmountBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(92)
        }
        //MARK:可提现金额
        cashWithdrawalAmountLaber.text = "可提现金额"
        cashWithdrawalAmountLaber.textColor = UIColor.hex(hexString: "#333333")
        cashWithdrawalAmountLaber.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(cashWithdrawalAmountLaber)
        cashWithdrawalAmountLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(cashWithdrawalAmountBg.snp.top).offset(15)
        }
        //MARK:可提现金额数字
        cashWithdrawalAmountNUmberLaber.text = "￥7789.79"
        cashWithdrawalAmountNUmberLaber.textColor = UIColor.hex(hexString: "#333333")
        cashWithdrawalAmountNUmberLaber.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(cashWithdrawalAmountNUmberLaber)
        cashWithdrawalAmountNUmberLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(cashWithdrawalAmountBg.snp.top).offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        //MARK:可提现金额分割线
        cashWithdrawalAmountLine.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        self.addSubview(cashWithdrawalAmountLine)
        cashWithdrawalAmountLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(cashWithdrawalAmountLaber.snp.bottom).offset(15)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
        }
        //MARK:提现金额
        withdrawalAmountLaber.text = "提现金额"
        withdrawalAmountLaber.textColor = UIColor.hex(hexString: "#333333")
        withdrawalAmountLaber.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(withdrawalAmountLaber)
        withdrawalAmountLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(cashWithdrawalAmountLine.snp.bottom).offset(15)
        }
        //MARK:提现金额输入框
        withdrawalAmountNumberEdit.textColor = UIColor.hex(hexString: "#333333")
        withdrawalAmountNumberEdit.placeholder = "请输入提现金额"
        withdrawalAmountNumberEdit.tintColor = UIColor.hex(hexString: "#CCCCCC")
        withdrawalAmountNumberEdit.textAlignment = .right
        //键盘显示数字和标点
        withdrawalAmountNumberEdit.keyboardType = .decimalPad
        withdrawalAmountNumberEdit.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(withdrawalAmountNumberEdit)
        withdrawalAmountNumberEdit.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(withdrawalAmountLaber.snp.right).offset(30)
            ConstraintMaker.top.equalTo(cashWithdrawalAmountLine.snp.bottom)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.width.equalTo(230)
        }
        //MARK:转账信息
        transferInformationLaber.text = "转账信息"
        transferInformationLaber.textColor = UIColor.hex(hexString: "#808080")
        transferInformationLaber.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(transferInformationLaber)
        transferInformationLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(cashWithdrawalAmountBg.snp.bottom).offset(19)
        }
        
        
        //MARK:微信背景
        weChatNumberBg.backgroundColor = UIColor.white
        self.addSubview(weChatNumberBg)
        weChatNumberBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalTo(transferInformationLaber.snp.bottom).offset(10)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(92)
        }
        //MARK:微信号
        weChatNumberLaber.text = "微信号"
        weChatNumberLaber.textColor = UIColor.hex(hexString: "#333333")
        weChatNumberLaber.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(weChatNumberLaber)
        weChatNumberLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(weChatNumberBg.snp.top).offset(15)
        }
        //MARK:微信号输入框
        weChatNumberEdit.textColor = UIColor.hex(hexString: "#333333")
        weChatNumberEdit.placeholder = "请输入微信号"
        weChatNumberEdit.tintColor = UIColor.hex(hexString: "#CCCCCC")
        weChatNumberEdit.textAlignment = .right
        weChatNumberEdit.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(weChatNumberEdit)
        weChatNumberEdit.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(weChatNumberLaber.snp.right).offset(30)
            ConstraintMaker.top.equalTo(weChatNumberBg.snp.top)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.width.equalTo(230)
        }
        //MARK:微信号分割线
        weChatNumberLine.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        self.addSubview(weChatNumberLine)
        weChatNumberLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(weChatNumberLaber.snp.bottom).offset(15)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
        }
        //MARK:微信昵称
        weChatNameLaber.text = "微信昵称"
        weChatNameLaber.textColor = UIColor.hex(hexString: "#333333")
        weChatNameLaber.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(weChatNameLaber)
        weChatNameLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(weChatNumberLine.snp.bottom).offset(15)
        }
        //MARK:微信昵称输入框
        weChatNameEdit.textColor = UIColor.hex(hexString: "#333333")
        weChatNameEdit.placeholder = "请输入微信昵称"
        weChatNameEdit.tintColor = UIColor.hex(hexString: "#CCCCCC")
        weChatNameEdit.textAlignment = .right
        weChatNameEdit.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(weChatNameEdit)
        weChatNameEdit.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(weChatNameLaber.snp.right).offset(30)
            ConstraintMaker.top.equalTo(weChatNumberLine.snp.bottom)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.width.equalTo(230)
        }
        withdrawalBtn.setTitle("提现", for: UIControl.State.normal)
        withdrawalBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        withdrawalBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        withdrawalBtn.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        withdrawalBtn.layer.cornerRadius = 5
        withdrawalBtn.layer.masksToBounds = true
        self.addSubview(withdrawalBtn)
        withdrawalBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.bottom.equalToSuperview().offset(-30)
            ConstraintMaker.height.equalTo(44)
        }
    }
}

