//  提现记录的cell
//  UHomeWithdrawalsRecordCell.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/1.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UHomeWithdrawalsRecordCell: UBaseTableViewCell {
    
    //MARK:操作
    var withdrawLaber : UILabel = {
        let ul = UILabel()
        ul.text = "---"
        ul.textColor = UIColor.black
        ul.font = UIFont.boldSystemFont(ofSize: 14)
        return ul
    }()
    
    //MARK:时间
    var timeLaber : UILabel = {
        let ul = UILabel()
        ul.text = "****-**-** **:**"
        ul.textColor = UIColor.hex(hexString: "#999999")
        ul.font = UIFont.systemFont(ofSize: 11)
        return ul
    }()
    
    //MARK:提现状态
    var status : UILabel = {
        let ul = UILabel()
        ul.font = UIFont.systemFont(ofSize: 14)
        ul.text = "待审核"
        ul.textColor = UIColor.hex(hexString: "#1C98F6")
        return ul
    }()
    
    override func configUI() {
        
        contentView.addSubview(withdrawLaber)
        withdrawLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(17)
            ConstraintMaker.top.equalToSuperview().offset(13)
        }

        
        contentView.addSubview(timeLaber)
        timeLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(17)
            ConstraintMaker.top.equalTo(withdrawLaber.snp.bottom).offset(10)
        }

        //MARK:提现记录的状态
        contentView.addSubview(status)
        status.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.right.equalToSuperview().offset(-27)
        }
        
    }
    
    //TODO 提现记录的model
    var model : CashOutRecordModel? {
        didSet {
            guard model != nil else { return }
            
            withdrawLaber.text = model!.money
            timeLaber.text = dateForMatter(timeString: model!.addtime, join: " ")
            switch model!.status {
            case 0:
                status.text = "待审核"
                status.textColor = UIColor.hex(hexString: "#1C98F6")
            case 1:
                status.text = "已通过"
                status.textColor = UIColor.hex(hexString: "#999999")
            case 2:
                status.text = "未通过"
                status.textColor = UIColor.hex(hexString: "#FF4444")
            default:
                status.text = "待审核"
                status.textColor = UIColor.hex(hexString: "#1C98F6")
            }
        }
    }
    
}

