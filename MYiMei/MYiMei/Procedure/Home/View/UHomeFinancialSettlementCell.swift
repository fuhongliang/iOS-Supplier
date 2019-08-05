//
//  UHomeFinancialSettlementCell.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/30.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UHomeFinancialSettlementCell: BaseView {
    var whiteBg = UIImageView()
    var withdrawLaber = UILabel()
    var withdrawNumberlaber = UILabel()
    var timeLaber = UILabel()
    var expenditureLaber = UILabel()
    func setView() {
       
        whiteBg.backgroundColor = UIColor.white
        self.addSubview(whiteBg)
        whiteBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(57)
        }
        withdrawLaber.text = "账户提现"
        withdrawLaber.textColor = UIColor.black
        withdrawLaber.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(withdrawLaber)
        withdrawLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(17)
            ConstraintMaker.top.equalTo(whiteBg.snp.top).offset(13)
        }
        withdrawNumberlaber.text = "-200.00"
        withdrawNumberlaber.textColor = UIColor.hex(hexString: "#FF4444")
        withdrawNumberlaber.font = UIFont.boldSystemFont(ofSize: 14)
        self.addSubview(withdrawNumberlaber)
        withdrawNumberlaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(whiteBg.snp.top).offset(14)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        timeLaber.text = "2019-07-26 11:25"
        timeLaber.textColor = UIColor.hex(hexString: "#999999")
        timeLaber.font = UIFont.systemFont(ofSize: 11)
        self.addSubview(timeLaber)
        timeLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(17)
            ConstraintMaker.top.equalTo(withdrawLaber.snp.bottom).offset(10)
        }
        expenditureLaber.text = "支出"
        expenditureLaber.textColor = UIColor.hex(hexString: "#999999")
        expenditureLaber.font = UIFont.systemFont(ofSize: 11)
        self.addSubview(expenditureLaber)
        expenditureLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(withdrawNumberlaber.snp.bottom).offset(10)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
    }
}

