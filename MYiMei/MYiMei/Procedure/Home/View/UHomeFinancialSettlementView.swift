//
//  UHomeFinancialSettlementView.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/30.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UHomeFinancialSettlementView: BaseView {
    
    var overBg = UIView()
    var overLaber = UILabel()
    var overNumberLaber = UILabel()
    
    //MARK:¥
    var rmb : UILabel = {
        let ul = UILabel()
        ul.text = "¥"
        ul.textColor = UIColor.white
        ul.font = UIFont.systemFont(ofSize: 17)
        return ul
    }()

    var withdrawBtn = UIButton()
    
    func setView() {
        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        
        overBg.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        self.addSubview(overBg)
        overBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(105)
        }
        overLaber.text = "账户余额(元)"
        overLaber.textColor = UIColor.hex(hexString: "#DDF0FF")
        overLaber.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(overLaber)
        overLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(overBg.snp.top).offset(20)
        }
        
        //MARK:￥
        self.addSubview(rmb)
        rmb.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(overLaber.snp.bottom).offset(23)
        }
        
        overNumberLaber.text = ""
        overNumberLaber.textColor = UIColor.white
        overNumberLaber.font = UIFont.boldSystemFont(ofSize: 26)
        self.addSubview(overNumberLaber)
        overNumberLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(rmb.snp.right).offset(2)
            ConstraintMaker.bottom.equalTo(rmb).offset(3)
        }
        
        withdrawBtn.setTitle("提现", for: UIControl.State.normal)
        withdrawBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        withdrawBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        withdrawBtn.layer.borderColor = UIColor.white.cgColor
        withdrawBtn.layer.borderWidth = 0.5
        withdrawBtn.layer.cornerRadius = 3
        self.addSubview(withdrawBtn)
        withdrawBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalTo(overBg)
            ConstraintMaker.right.equalTo(overBg.snp.right).offset(-15)
            ConstraintMaker.height.equalTo(33)
            ConstraintMaker.width.equalTo(52)
        }
        

    }
}
