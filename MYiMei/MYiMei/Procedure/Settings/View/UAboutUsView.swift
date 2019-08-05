//
//  UAboutUsView.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/17.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UAboutUsView: BaseView {
    //图片
    var logoIcon = UIImageView()
    //字段说明
    var merchantSideLaber = UILabel()
    
    var helpingMerchantsLaber = UILabel()
    
    var numberLaber = UILabel()
    
    var labelLaber = UILabel()
    
    var companyLaber = UILabel()
    
    
    func setView() {
        self.backgroundColor = UIColor.white
        
        logoIcon.image = UIImage.init(named: "logo")
        self.addSubview(logoIcon)
        logoIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalToSuperview()
            ConstraintMaker.top.equalToSuperview().offset(66)
            ConstraintMaker.size.equalTo(90)
        }
        merchantSideLaber.text = "一美一物商家端"
        merchantSideLaber.textColor = UIColor.hex(hexString: "#333333")
        merchantSideLaber.font = UIFont.systemFont(ofSize: 18)
        self.addSubview(merchantSideLaber)
        merchantSideLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalToSuperview()
            ConstraintMaker.top.equalTo(logoIcon.snp.bottom).offset(13)
        }
        helpingMerchantsLaber.text = "助力商家，高效经营"
        helpingMerchantsLaber.textColor = UIColor.hex(hexString: "#999999")
        helpingMerchantsLaber.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(helpingMerchantsLaber)
        helpingMerchantsLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalToSuperview()
            ConstraintMaker.top.equalTo(merchantSideLaber.snp.bottom).offset(14)
        }
        numberLaber.text = "V1.1.1"
        numberLaber.textColor = UIColor.hex(hexString: "#333333")
        numberLaber.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(numberLaber)
        numberLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalToSuperview()
            ConstraintMaker.top.equalTo(helpingMerchantsLaber.snp.bottom).offset(13)
        }
        
        labelLaber.text = "《一美一物软件许可及服务协议》"
        labelLaber.textColor = UIColor.hex(hexString: "#1C98F6")
        labelLaber.font = UIFont.systemFont(ofSize: 12)
        self.addSubview(labelLaber)
        labelLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalToSuperview()
            ConstraintMaker.bottom.equalToSuperview().offset(-44)
        }
        
        companyLaber.text = "深圳市前海一户文化科技有限公司 版权所有 粤ICP备 12067984号"
        companyLaber.textColor = UIColor.hex(hexString: "#999999")
        companyLaber.font = UIFont.systemFont(ofSize: 10)
        self.addSubview(companyLaber)
        companyLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalToSuperview()
            ConstraintMaker.bottom.equalToSuperview().offset(-20)
        }
    }
}
