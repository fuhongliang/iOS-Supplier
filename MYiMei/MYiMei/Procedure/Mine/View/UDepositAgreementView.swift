//
//  UDepositAgreementView.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/9.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import WebKit

class UDepositAgreementView: BaseView {
    
    weak var delegate: UDepositAgreementViewDelegate?
    
    var wkWebView = WKWebView()
    
    var agreeBtn = UIButton()
    var checkButton = UIButton.init(type: .custom)
    
    var agreeLabel = UILabel()
    
    var text = "我已阅读并同意以上"
    var bookName = "《一美一物保证金协议》"
    let attributed = NSMutableAttributedString()
    
    var isSelect:Bool = true
    
    
    func configUI(){
        self.backgroundColor = UIColor.white
        
        agreeBtn.setTitle("我同意", for: .normal)
        agreeBtn.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        agreeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        agreeBtn.clipsToBounds = true
        agreeBtn.layer.cornerRadius = 4
        self.addSubview(agreeBtn)
        agreeBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.bottom.equalToSuperview().offset(-59)
        }
        agreeBtn.addTarget(self, action: #selector(checkAgreeMent), for: UIControl.Event.touchDown)
        
        checkButton.setBackgroundImage(UIImage.init(named: "uncheck_btn"), for: .normal)
        checkButton.setBackgroundImage(UIImage.init(named: "check_btn"), for: .selected)
        self.addSubview(checkButton)
        checkButton.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.width.height.equalTo(12)
            ConstraintMaker.left.equalTo(agreeBtn).offset(2)
            ConstraintMaker.bottom.equalTo(agreeBtn.snp.top).offset(-23)
        }
        checkButton.addTarget(self, action: #selector(checkState), for: UIControl.Event.touchUpInside)
        
        //MARK:我已阅读并同意...（富文本）
        let blueAttribute = NSMutableAttributedString.init(string: bookName,attributes: [NSAttributedString.Key.foregroundColor : UIColor.hex(hexString: "#1C98F6")])
        let blackAttribute = NSMutableAttributedString.init(string: text,attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        attributed.append(blackAttribute)
        attributed.append(blueAttribute)
        agreeLabel.font = UIFont.systemFont(ofSize: 13)
        agreeLabel.attributedText = attributed
        self.addSubview(agreeLabel)
        agreeLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.bottom.equalTo(agreeBtn.snp.top).offset(-21)
            ConstraintMaker.left.equalTo(checkButton.snp.right).offset(7)
        }
        
        self.addSubview(wkWebView)
        wkWebView.frame = self.frame
        wkWebView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.width.equalToSuperview().offset(15)
            ConstraintMaker.top.equalToSuperview().offset(15)
            ConstraintMaker.bottom.equalTo(checkButton.snp.top).offset(-20)
        }
    }
    
    
    @objc func checkAgreeMent() {
        delegate?.agree()
    }
    
    @objc func checkState(){
        checkButton.isSelected = isSelect
        isSelect = !isSelect
    }
    
    
}
