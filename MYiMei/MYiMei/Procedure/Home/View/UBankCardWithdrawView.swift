//
//  UBankCardWithdrawView.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/1.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UBankCardWithdrawView: BaseView {
    
    //MARK:可提现金额背景
    var cashWithdrawalAmountLayer : UIView = {
        let uv = UIView()
        uv.backgroundColor = UIColor.white
        return uv
    }()
    
    //MARK:可提现金额
    var cashWithdrawalAmountLaber : UILabel = {
        let ul = UILabel()
        ul.text = "可提现金额"
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 15)
        return ul
    }()
    
    //MARK:可提现金额数字
    var cashWithdrawalAmountNUmberLaber : UILabel = {
        let ul = UILabel()
        ul.text = "￥7789.79"
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 15)
        return ul
    }()
    
    //MARK:可提现金额分割线
    var cashWithdrawalAmountLine : UIView = {
        let uv = UIView()
        uv.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        return uv
    }()
    
    //MARK:提现金额背景
    var withdrawalAmountLayer : UIView = {
        let uv = UIView()
        uv.backgroundColor = UIColor.white
        return uv
    }()
    
    //MARK:提现金额
    var withdrawalAmountLaber : UILabel = {
        let ul = UILabel()
        ul.text = "提现金额"
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 15)
        return ul
    }()
    
    //MARK:提现金额输入框
    var withdrawalAmountNumberEdit : UITextField = {
        let utf = UITextField()
        utf.textColor = UIColor.hex(hexString: "#333333")
        utf.placeholder = "请输入提现金额"
        utf.tintColor = UIColor.hex(hexString: "#CCCCCC")
        utf.textAlignment = .right
        //键盘显示数字和标点
        utf.keyboardType = .decimalPad
        utf.font = UIFont.systemFont(ofSize: 15)
        return utf
    }()
    
    //MARK:转账信息
    var transferInformationLaber : UILabel = {
        let ul = UILabel()
        ul.text = "转账信息"
        ul.textColor = UIColor.hex(hexString: "#808080")
        ul.font = UIFont.systemFont(ofSize: 13)
        return ul
    }()
    
    //MARK:银行卡卡号背景
    var bankNumberLayer : UIView = {
        let uv = UIView()
        uv.backgroundColor = UIColor.white
        return uv
    }()
    
    //MARK:银行卡卡号
    var bankNumberLaber : UILabel = {
        let ul = UILabel()
        ul.text = "银行卡号"
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 15)
        return ul
    }()
    
    //MARK:银行卡卡号输入框
    var bankNumberEdit : UITextField = {
        let utf = UITextField()
        utf.textColor = UIColor.hex(hexString: "#333333")
        utf.placeholder = "请输入银行卡号"
        utf.tintColor = UIColor.hex(hexString: "#CCCCCC")
        utf.textAlignment = .right
        //键盘显示数字和标点
        utf.keyboardType = .numberPad
        utf.font = UIFont.systemFont(ofSize: 15)
        return utf
    }()
    
    //MARK:银行卡卡号分割线
    var bankNumberLine : UIView = {
        let uv = UIView()
        uv.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        return uv
    }()
    
    //MARK:开户银行背景
    var bankNameLayer : UIView = {
        let uv = UIView()
        uv.backgroundColor = UIColor.white
        return uv
    }()
    
    //MARK:开户银行
    var bankName : UILabel = {
        let ul = UILabel()
        ul.text = "开户银行"
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 15)
        return ul
    }()
    
    //MARK:开户银行输入框
    var bankNameInput : UITextField = {
        let ul = UITextField()
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.placeholder = "请输入开户银行"
        ul.tintColor = UIColor.hex(hexString: "#CCCCCC")
        ul.textAlignment = .right
        ul.font = UIFont.systemFont(ofSize: 15)
        return ul
    }()
    
    //MARK:银行卡卡号分割线
    var bankNameLine : UIView = {
        let uv = UIView()
        uv.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        return uv
    }()
    
    //MARK:银行开户人背景
    var bankUserNameLayer : UIView = {
        let uv = UIView()
        uv.backgroundColor = UIColor.white
        return uv
    }()
    
    //MARK:银行开户人姓名
    var bankUserName : UILabel = {
        let ul = UILabel()
        ul.text = "银行开户人姓名"
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 15)
        return ul
    }()
    
    //MARK:银行卡开户人姓名输入框
    var bankUserNameEdit : UITextField = {
        let utf = UITextField()
        utf.textColor = UIColor.hex(hexString: "#333333")
        utf.placeholder = "请输入银行开户人昵称"
        utf.tintColor = UIColor.hex(hexString: "#CCCCCC")
        utf.textAlignment = .right
        utf.font = UIFont.systemFont(ofSize: 15)
        return utf
    }()
    
    //MARK:提现按钮
    var withdrawalBtn : UIButton = {
        let ub = UIButton()
        ub.setTitle("提现", for: UIControl.State.normal)
        ub.setTitleColor(UIColor.white, for: UIControl.State.normal)
        ub.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        ub.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        ub.layer.cornerRadius = 3
        ub.layer.masksToBounds = true
        return ub
    }()
    
    func setView() {
        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        
        //MARK:可提现金额背景
        self.addSubview(cashWithdrawalAmountLayer)
        cashWithdrawalAmountLayer.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalToSuperview()
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.width.equalToSuperview()
        }
        
        //MARK:可提现金额
        cashWithdrawalAmountLayer.addSubview(cashWithdrawalAmountLaber)
        cashWithdrawalAmountLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.centerY.equalToSuperview()
        }
        //MARK:可提现金额数字
        cashWithdrawalAmountLayer.addSubview(cashWithdrawalAmountNUmberLaber)
        cashWithdrawalAmountNUmberLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        //MARK:可提现金额分割线
        cashWithdrawalAmountLayer.addSubview(cashWithdrawalAmountLine)
        cashWithdrawalAmountLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.bottom.right.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
        }
        
        //MARK:提现金额背景
        self.addSubview(withdrawalAmountLayer)
        withdrawalAmountLayer.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(cashWithdrawalAmountLayer.snp.bottom)
            ConstraintMaker.width.equalToSuperview()
            ConstraintMaker.height.equalTo(44)
        }
        
        //MARK:提现金额
        withdrawalAmountLayer.addSubview(withdrawalAmountLaber)
        withdrawalAmountLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.centerY.equalToSuperview()
        }
        
        //MARK:提现金额输入框
        withdrawalAmountLayer.addSubview(withdrawalAmountNumberEdit)
        withdrawalAmountNumberEdit.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(withdrawalAmountLaber.snp.right).offset(30)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.height.equalToSuperview()
        }
        
        //MARK:转账信息
        self.addSubview(transferInformationLaber)
        transferInformationLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(withdrawalAmountLayer.snp.bottom).offset(19)
        }
        
        //MARK:银行卡背景
        self.addSubview(bankNumberLayer)
        bankNumberLayer.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(transferInformationLaber.snp.bottom).offset(10)
            ConstraintMaker.width.equalToSuperview()
            ConstraintMaker.height.equalTo(44)
        }
        
        //MARK:银行卡号
        bankNumberLayer.addSubview(bankNumberLaber)
        bankNumberLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.centerY.equalToSuperview()
        }
        
        //MARK:银行卡号输入框
        bankNumberLayer.addSubview(bankNumberEdit)
        bankNumberEdit.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(bankNumberLaber.snp.right).offset(30)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.height.equalTo(44)
        }
        //MARK:银行卡号分割线
        bankNumberLayer.addSubview(bankNumberLine)
        bankNumberLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.bottom.right.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
        }
        
        //MARK:开户银行背景
        self.addSubview(bankNameLayer)
        bankNameLayer.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.width.equalToSuperview()
            ConstraintMaker.top.equalTo(bankNumberLayer.snp.bottom)
        }
        
        //MARK:开户银行
        bankNameLayer.addSubview(bankName)
        bankName.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        
        //MARK:开户银行输入框
        bankNameLayer.addSubview(bankNameInput)
        bankNameInput.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalToSuperview()
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        
        //MARK:开户银行分割线
        bankNameLayer.addSubview(bankNameLine)
        bankNameLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.bottom.right.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
        }
        
        //MARK:银行开户人背景
        self.addSubview(bankUserNameLayer)
        bankUserNameLayer.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(bankNameLayer.snp.bottom)
            ConstraintMaker.width.equalToSuperview()
            ConstraintMaker.height.equalTo(44)
        }
        
        //MARK:银行开户人姓名
        bankUserNameLayer.addSubview(bankUserName)
        bankUserName.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.centerY.equalToSuperview()
        }
        
        //MARK:银行开户人昵称输入框
        bankUserNameLayer.addSubview(bankUserNameEdit)
        bankUserNameEdit.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(bankUserName.snp.right).offset(30)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.centerY.equalToSuperview()
        }
        
        self.addSubview(withdrawalBtn)
        withdrawalBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.width.equalToSuperview().inset(30)
            ConstraintMaker.centerX.equalToSuperview()
            ConstraintMaker.bottom.equalToSuperview().offset(-30)
            ConstraintMaker.height.equalTo(44)
        }
    }
}
