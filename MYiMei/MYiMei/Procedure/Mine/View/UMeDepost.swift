//
//  UMeDepost.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/9.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import WebKit
class UMeDepost: UBaseTableViewCell {
    //图标
    var depostIcon = UIImageView()
    //字段说明
    var depostReviewLaber = UILabel()
    var depostAmountLaber = UILabel()
    var depostAmountNumberLaber = UILabel()
    var certificateLaber = UILabel()
    //背景
    var depostBg = UIImageView()
    var certificateBg = UIImageView()
    var certificatePhotoBg = UMeDepostcell ()
    var tableView = UITableView()
    var webView = WKWebView()

    func setView(){
        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        //MARK:保证金审核图标
        depostIcon.image = UIImage.init(named: "review")
        self.addSubview(depostIcon)
        depostIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(25)
            ConstraintMaker.top.equalToSuperview().offset(15)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //MARK:保证金审核中
        depostReviewLaber.text = "保证金审核中"
        depostReviewLaber.textColor = UIColor.hex(hexString: "#1D9EFF")
        depostReviewLaber.font = UIFont.boldSystemFont(ofSize: 17)
        self.addSubview(depostReviewLaber)
        depostReviewLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalToSuperview().offset(19)
            ConstraintMaker.left.equalTo(depostIcon.snp.right).offset(10)
        }
        //MARK:保证金背景
        depostBg.backgroundColor = UIColor.white
        self.addSubview(depostBg)
        depostBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.top.equalTo(depostIcon.snp.bottom).offset(16)
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
        }
        //MARK:保证金总金额
        depostAmountLaber.text = "保证金总金额"
        depostAmountLaber.textColor = UIColor.hex(hexString: "#010101")
        depostAmountLaber.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(depostAmountLaber)
        depostAmountLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(depostBg.snp.top).offset(15)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //MARK:保证金金额数字
        depostAmountNumberLaber.text = "￥1506.00"
        depostAmountNumberLaber.textColor = UIColor.hex(hexString: "#FF4444")
        depostAmountNumberLaber.font = UIFont.boldSystemFont(ofSize: 15)
        self.addSubview(depostAmountNumberLaber)
        depostAmountNumberLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(depostBg.snp.top).offset(17)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        //MARK:转账凭证背景
        certificateBg.backgroundColor = UIColor.white
        self.addSubview(certificateBg)
        certificateBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.top.equalTo(depostBg.snp.bottom).offset(15)
        }
        //MARK:转账凭证字段
        certificateLaber.text = "转账凭证"
        certificateLaber.textColor = UIColor.hex(hexString: "#010101")
        certificateLaber.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(certificateLaber)
        
        certificateLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(certificateBg.snp.top).offset(19)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        
        tableView.frame = .zero
        self.addSubview(tableView)
        tableView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.width.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(certificateBg.snp.bottom)
            ConstraintMaker.height.equalTo(331)
        }
        
        self.addSubview(webView)
        webView.frame = self.frame
        webView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.width.equalToSuperview()
            ConstraintMaker.height.equalTo(100)
            ConstraintMaker.top.equalTo(certificateBg.snp.bottom).offset(15)
        }
    }
}
