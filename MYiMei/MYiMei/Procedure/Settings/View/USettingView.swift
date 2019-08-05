//
//  USettingView.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/13.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

protocol USettingViewDelegate: AnyObject {
    func tapShopSetting()
    func tapAccountSafe()
    func tapCallThePlatform()
    func tapAboutThePlatform()
}


class USettingView: BaseView {
    
    weak var delegate: USettingViewDelegate?
    
    //蓝色背景图片
    var blueIcon = UIImageView()
    //头部头像
    var headIcon = UIImageView()
    //店铺名称
    var storeNameLaber = UILabel()
    //店铺地址
    var storeAddressLaber = UILabel()
    //第二部分白色背景
    var storeWhiteBg = UIImageView()
    //店铺设置
    var storeLeftIcon = UIImageView()
    var storeBtn = UIButton()
    var storeRightIcon = UIImageView()
    var storeLine = UILabel()
    //账户安全
    var accountSecurityLeftIcon = UIImageView()
    var accountSecurityBtn = UIButton()
    var accountSecurityRightIcon = UIImageView()
    //平台背景
    var platformBg = UIImageView()
    //联系平台
    var contactPlatformBtn = UIButton()
    var contactPlatformLeftIcon = UIImageView()
    var contactPlatformRightIcon = UIImageView()
    var contactPlatformLine = UILabel()
    //关于平台
    var aboutPlatformBtn = UIButton()
    var aboutPlatformLeftIcon = UIImageView()
    var aboutPlatformRightIcon = UIImageView()
    func setView() {
        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        //MARK:蓝色背景图片
        blueIcon.image = UIImage.init(named: "setting_head")
        self.addSubview(blueIcon)
        blueIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(200)
        }
        //MARK:头部头像
        self.addSubview(headIcon)
        headIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalTo(blueIcon)
            ConstraintMaker.top.equalTo(blueIcon.snp.top).offset(49)
            ConstraintMaker.size.equalTo(70)
        }
        //设置圆角
        headIcon.layer.cornerRadius = 35;
        //将多余的部分切掉
        headIcon.layer.masksToBounds = true;
        
        
        //MARK:店铺名称
        storeNameLaber.text = "箭牌卫浴旗舰店"
        storeNameLaber.textColor = UIColor.white
        storeNameLaber.font = UIFont.boldSystemFont(ofSize: 16)
        self.addSubview(storeNameLaber)
        storeNameLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalTo(blueIcon)
            ConstraintMaker.top.equalTo(headIcon.snp.bottom).offset(13)
        }
        //MARK:店铺地址
        storeAddressLaber.text = "新安三路28号海关大厦16楼1610"
        storeAddressLaber.textColor = UIColor.white
        storeAddressLaber.font = UIFont.systemFont(ofSize: 12)
        self.addSubview(storeAddressLaber)
        storeAddressLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalTo(blueIcon)
            ConstraintMaker.top.equalTo(storeNameLaber.snp.bottom).offset(13)
        }
        //MARKl:白色背景
        storeWhiteBg.backgroundColor = UIColor.white
        storeWhiteBg.layer.cornerRadius = 5
        self.addSubview(storeWhiteBg)
        storeWhiteBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(blueIcon.snp.bottom).offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(90)
        }
        //MARK:店铺设置
        storeBtn.setTitle("店铺设置", for: UIControl.State.normal)
        storeBtn.setTitleColor(UIColor.hex(hexString: "#333333"), for: UIControl.State.normal)
        storeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        storeBtn.contentHorizontalAlignment = .left
        storeBtn.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 43, bottom: 0, right: 0)
        self.addSubview(storeBtn)
        storeBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.equalTo(storeWhiteBg)
            ConstraintMaker.top.equalTo(storeWhiteBg.snp.top)
            ConstraintMaker.height.equalTo(45)
        }
        storeBtn.addTarget(self, action: #selector(shopSetting), for: UIControl.Event.touchUpInside)
        
        storeLeftIcon.image = UIImage.init(named: "storeIcon")
        self.addSubview(storeLeftIcon)
        storeLeftIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(storeWhiteBg.snp.left).offset(15)
            ConstraintMaker.top.equalTo(storeWhiteBg.snp.top).offset(13)
            ConstraintMaker.size.equalTo(17)
        }
        storeRightIcon.image = UIImage.init(named: "right_arrow")
        self.addSubview(storeRightIcon)
        storeRightIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(storeWhiteBg.snp.top).offset(16)
            ConstraintMaker.right.equalTo(storeWhiteBg.snp.right).offset(-15)
            ConstraintMaker.height.equalTo(14)
            ConstraintMaker.width.equalTo(9)
        }
        storeLine.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        self.addSubview(storeLine)
        storeLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(storeWhiteBg.snp.left).offset(43)
            ConstraintMaker.top.equalTo(storeBtn.snp.bottom)
            ConstraintMaker.right.equalTo(storeWhiteBg)
            ConstraintMaker.height.equalTo(1)
        }
        //MARK:账户安全
        accountSecurityBtn.setTitle("账户安全", for: UIControl.State.normal)
        accountSecurityBtn.setTitleColor(UIColor.hex(hexString: "#333333"), for: UIControl.State.normal)
        accountSecurityBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        accountSecurityBtn.contentHorizontalAlignment = .left
        accountSecurityBtn.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 43, bottom: 0, right: 0)
        self.addSubview(accountSecurityBtn)
        accountSecurityBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.equalTo(storeWhiteBg)
            ConstraintMaker.top.equalTo(storeLine.snp.bottom)
            ConstraintMaker.height.equalTo(45)
        }
        accountSecurityBtn.addTarget(self, action: #selector(accountSafe), for: UIControl.Event.touchUpInside)
        
        accountSecurityLeftIcon.image = UIImage.init(named: "account_security")
        self.addSubview(accountSecurityLeftIcon)
        accountSecurityLeftIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(storeWhiteBg.snp.left).offset(15)
            ConstraintMaker.top.equalTo(storeLine.snp.bottom).offset(13)
            ConstraintMaker.size.equalTo(17)
        }
        accountSecurityRightIcon.image = UIImage.init(named: "right_arrow")
        self.addSubview(accountSecurityRightIcon)
        accountSecurityRightIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(storeLine.snp.bottom).offset(16)
            ConstraintMaker.right.equalTo(storeWhiteBg.snp.right).offset(-15)
            ConstraintMaker.height.equalTo(14)
            ConstraintMaker.width.equalTo(9)
        }
        //MARKl:平台背景
        platformBg.backgroundColor = UIColor.white
        platformBg.layer.cornerRadius = 5
        self.addSubview(platformBg)
        platformBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(storeWhiteBg.snp.bottom).offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(90)
        }
        //MARK:联系平台
        contactPlatformBtn.setTitle("联系平台", for: UIControl.State.normal)
        contactPlatformBtn.setTitleColor(UIColor.hex(hexString: "#333333"), for: UIControl.State.normal)
        contactPlatformBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        contactPlatformBtn.contentHorizontalAlignment = .left
        contactPlatformBtn.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 43, bottom: 0, right: 0)
        self.addSubview(contactPlatformBtn)
        contactPlatformBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.equalTo(platformBg)
            ConstraintMaker.top.equalTo(platformBg.snp.top)
            ConstraintMaker.height.equalTo(45)
        }
        contactPlatformBtn.addTarget(self, action: #selector(callThePlatform), for: UIControl.Event.touchUpInside)
        
        contactPlatformLeftIcon.image = UIImage.init(named: "contact_platform")
        self.addSubview(contactPlatformLeftIcon)
        contactPlatformLeftIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(platformBg.snp.left).offset(15)
            ConstraintMaker.top.equalTo(platformBg.snp.top).offset(13)
            ConstraintMaker.size.equalTo(17)
        }
        contactPlatformRightIcon.image = UIImage.init(named: "right_arrow")
        self.addSubview(contactPlatformRightIcon)
        contactPlatformRightIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(platformBg.snp.top).offset(16)
            ConstraintMaker.right.equalTo(platformBg.snp.right).offset(-15)
            ConstraintMaker.height.equalTo(14)
            ConstraintMaker.width.equalTo(9)
        }
        contactPlatformLine.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        self.addSubview(contactPlatformLine)
        contactPlatformLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(platformBg.snp.left).offset(43)
            ConstraintMaker.top.equalTo(contactPlatformBtn.snp.bottom)
            ConstraintMaker.right.equalTo(platformBg)
            ConstraintMaker.height.equalTo(1)
        }
        //MARK:关于平台
        aboutPlatformBtn.setTitle("关于平台", for: UIControl.State.normal)
        aboutPlatformBtn.setTitleColor(UIColor.hex(hexString: "#333333"), for: UIControl.State.normal)
        aboutPlatformBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        aboutPlatformBtn.contentHorizontalAlignment = .left
        aboutPlatformBtn.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 43, bottom: 0, right: 0)
        self.addSubview(aboutPlatformBtn)
        aboutPlatformBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.equalTo(platformBg)
            ConstraintMaker.top.equalTo(contactPlatformLine.snp.bottom)
            ConstraintMaker.height.equalTo(45)
        }
        aboutPlatformBtn.addTarget(self, action: #selector(aboutThePlatform), for: UIControl.Event.touchUpInside)
        
        aboutPlatformLeftIcon.image = UIImage.init(named: "about_platform")
        self.addSubview(aboutPlatformLeftIcon)
        aboutPlatformLeftIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(platformBg.snp.left).offset(15)
            ConstraintMaker.top.equalTo(contactPlatformLine.snp.bottom).offset(13)
            ConstraintMaker.size.equalTo(17)
        }
        aboutPlatformRightIcon.image = UIImage.init(named: "right_arrow")
        self.addSubview(aboutPlatformRightIcon)
        aboutPlatformRightIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(contactPlatformLine.snp.bottom).offset(16)
            ConstraintMaker.right.equalTo(platformBg.snp.right).offset(-15)
            ConstraintMaker.height.equalTo(14)
            ConstraintMaker.width.equalTo(9)
        }
    }
    @objc func shopSetting() {
        delegate?.tapShopSetting()
    }
    @objc func accountSafe() {
        delegate?.tapAccountSafe()
    }
    @objc func callThePlatform() {
        delegate?.tapCallThePlatform()
    }
    @objc func aboutThePlatform() {
        delegate?.tapAboutThePlatform()
    }
}
