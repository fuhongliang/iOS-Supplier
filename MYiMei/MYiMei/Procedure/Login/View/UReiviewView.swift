//
//  UReviewView.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/2.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit


class UReviwView: BaseView {
    
    //图片
    var menuIcon =  UIImageView()
    //文字
    var textone = UILabel()
    //字段
    var texttwo = UILabel()
    //按钮
    var button = UIButton()
    func setView(){
        self.backgroundColor = UIColor.white
        //图片
        menuIcon.image = UIImage.init(named: "apply_status")
        self.addSubview(menuIcon)
        menuIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalToSuperview()
            ConstraintMaker.size.equalTo(CGSize(width: 100, height: 100))
            ConstraintMaker.top.equalToSuperview().offset(114)
        }
        //文字
        textone.text = "您的入驻申请已提交，请等待管理员审核"
        textone.font = UIFont.systemFont(ofSize: 14)
        textone.textColor = UIColor.hex(hexString: "#999999")
        self.addSubview(textone)
        textone.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalToSuperview()
            ConstraintMaker.top.equalTo(menuIcon.snp.bottom).offset(30)
        }
        
        //字段
        texttwo.text = "我们将以短信的方式通知您审核结果~"
        texttwo.font = UIFont.systemFont(ofSize: 14)
        texttwo.textColor = UIColor.hex(hexString: "#999999")
        self.addSubview(texttwo)
        texttwo.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalToSuperview()
            ConstraintMaker.top.equalTo(textone.snp.bottom).offset(10)
        }
        
        //按钮
        button.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        button.setTitle("确定", for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 3
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(button)
        button.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(texttwo.snp.bottom).offset(30)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.width.equalToSuperview()
        }
    }
    
}
