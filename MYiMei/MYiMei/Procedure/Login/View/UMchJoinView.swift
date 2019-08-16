//
//  UMchJoinView.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/1.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit


protocol UMchJoinViewDelegate: AnyObject {
    func tapChooseStoreLogoPicAction()
    func tapChooseStoreBgPicAction()
    func tapChooseLicensePicAction()
    func tapChooseStoreAddressAction()
    func tapChooseStoreClassAction()
    func tapPushApply(contactName: String, phoneNumber: String,storeName: String, storeClass: String,storeAddress: String, serviceTel: String)
}

class UMchJoinView: BaseView {

    var titleLabel =  UILabel()
    //MARK:第一块白色背景
     var whiteBgOne = UIImageView()

    //MARK:联系人
    var contactLabel = UILabel()
    var contactEdit = UITextField()
    var contactLine = UILabel()

    //MARK:手机号码
    var phoneNumberLabel = UILabel()
    var phoneNumberEdit = UITextField()
    var phoneNumberLine = UILabel()

    //MARK:店铺名称
    var storeNameLabel = UILabel()
    var storeNameEdit = UITextField()
    var storeNameLine = UILabel()

    //MARK:店铺分类
    var storeCategoryLabel = UILabel()
    var storeCategoryBtn = UIButton()
    var storeCategoryIcon = UIImageView()
    var storeCategoryLine = UILabel()

    //MARK:店铺地址
    var storeAddressLabel = UILabel()
    var storeAddressBtn = UIButton()
    var storeAddressIcon = UIImageView()
    var storeAddressLine = UILabel()

    //MARK:店铺地址详情
    var storeAddressEdit = UITextField()
    var storeAddressEditLine = UILabel()

    //MARK:客服电话
    var consumerPhoneLaber = UILabel()
    var consumerPhoneEdit = UITextField()

    //MARK:店铺图片模块
    var storePhotoLabel = UILabel()

    //MARK:店铺图片白色背景,第二块白色背景
    var whiteBgTwo = UIImageView()

    //MARK:店铺背景
    var storeBgLabel = UILabel()
    var storeBgBtn = UIButton()
    var storeBgDescriptionLabel = UILabel()
    var storeBgLebelLine = UILabel()

    //MARK:店铺Logo
    var storeLogoLabel = UILabel()
    var storeLogoBtn = UIButton()
    var storeLogoDescriptionLabel = UILabel()
    var storeLogoLine = UILabel()

    //MARK:店铺营业执照
    var storeLicenseLabel = UILabel()
    var storeLicenseBtn = UIButton()
    var storeLicenseDescriptionLabel = UILabel()

    //MARK:申请入驻按钮
    var joinButton = UIButton()

    //MARK:接口代理
    weak var delegate: UMchJoinViewDelegate?

    func setView(){
        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        //MARK:店铺信息
        titleLabel.text = "店铺基本信息"
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = UIColor.hex(hexString: "#808080")
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalToSuperview().offset(20)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.width.equalToSuperview()
        }
        
        //MARK:白色背景
        whiteBgOne.backgroundColor = UIColor.white
        self.addSubview(whiteBgOne)
        whiteBgOne.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalTo(titleLabel.snp.bottom).offset(11)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(314)
        }

        //MARK:联系人
        contactLabel.tintColor = UIColor.black
        contactLabel.text = "联系人"
        contactLabel.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(contactLabel)
        contactLabel.snp.makeConstraints{(ConstraintMaker)in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(whiteBgOne.snp.top).offset(14)
        }
    
        contactEdit.tintColor = UIColor.hex(hexString: "#CCCCCC")
        contactEdit.textColor = UIColor.black
        contactEdit.placeholder = "请输入"
        contactEdit.textAlignment = .right
        contactEdit.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(contactEdit)
        contactEdit.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(contactLabel.snp.right).offset(30)
            ConstraintMaker.top.equalTo(whiteBgOne.snp.top)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.width.equalTo(240)
        }
        
        contactLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(contactLine)
        contactLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(contactEdit.snp.bottom)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
        }
        
        
        //MARK:手机号
        phoneNumberLabel.tintColor = UIColor.black
        phoneNumberLabel.text = "手机号"
        phoneNumberLabel.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(phoneNumberLabel)
        phoneNumberLabel.snp.makeConstraints{(ConstraintMaker)in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(contactLine.snp.bottom).offset(14)
        }
        
        phoneNumberEdit.tintColor = UIColor.hex(hexString: "#CCCCCC")
        phoneNumberEdit.textColor = UIColor.black
        phoneNumberEdit.placeholder = "请输入"
        phoneNumberEdit.font = UIFont.systemFont(ofSize: 17)
        phoneNumberEdit.textAlignment = .right
        phoneNumberEdit.keyboardType = UIKeyboardType.numberPad
        self.addSubview(phoneNumberEdit)
        phoneNumberEdit.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(contactLine.snp.top)
            ConstraintMaker.left.equalTo(phoneNumberLabel.snp.right).offset(30)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.width.equalTo(240)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }

        phoneNumberLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(phoneNumberLine)
        phoneNumberLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(phoneNumberEdit.snp.bottom)
        }
        
        //MARK:店铺名称
        storeNameLabel.text = "店铺名称"
        storeNameLabel.tintColor = UIColor.black
        storeNameLabel.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(storeNameLabel)
        storeNameLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(phoneNumberLine.snp.bottom).offset(14)
        }
        
        storeNameEdit.tintColor = UIColor.hex(hexString: "#CCCCCC")
        storeNameEdit.textColor = UIColor.black
        storeNameEdit.placeholder = "请输入"
        storeNameEdit.font = UIFont.systemFont(ofSize: 17)
        storeNameEdit.textAlignment = .right
        self.addSubview(storeNameEdit)
        storeNameEdit.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(phoneNumberLine.snp.bottom)
            ConstraintMaker.left.equalTo(storeNameLabel.snp.right).offset(30)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.width.equalTo(240)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        
        storeNameLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(storeNameLine)
        storeNameLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(storeNameEdit.snp.bottom)
        }
        
        //MARK:店铺分类
        storeCategoryLabel.text = "店铺分类"
        storeCategoryLabel.textColor = UIColor.black
        storeCategoryLabel.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(storeCategoryLabel)
        storeCategoryLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(storeNameLine.snp.bottom).offset(14)
        }

        storeCategoryBtn.setTitleColor( UIColor.black, for: UIControl.State.normal)
        storeCategoryBtn.setTitle("请选择", for: UIControl.State.normal)
        storeAddressBtn.tintColor = UIColor.hex(hexString: "#CCCCCC")
        storeCategoryBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        storeCategoryBtn.contentHorizontalAlignment = .right
        self.addSubview(storeCategoryBtn)
        storeCategoryBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(storeCategoryLabel.snp.right).offset(30)
            ConstraintMaker.top.equalTo(storeNameLine.snp.bottom)
            ConstraintMaker.right.equalToSuperview().offset(-33)
            ConstraintMaker.height.equalTo(44)
        }

        storeCategoryBtn.addTarget(self, action: #selector(chooseStoreClassAction), for: UIControl.Event.touchUpInside)

        storeCategoryIcon.image = UIImage.init(named: "notice")
        self.addSubview(storeCategoryIcon)
        storeCategoryIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(storeNameLine.snp.bottom).offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(14)
            ConstraintMaker.width.equalTo(9)
        }

        storeCategoryLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(storeCategoryLine)
        storeCategoryLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(storeCategoryBtn.snp.bottom)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
        }

        //MARK:店铺地址
        storeAddressLabel.text = "店铺地址"
        storeAddressLabel.textColor = UIColor.black
        storeAddressLabel.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(storeAddressLabel)
        storeAddressLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(storeCategoryLine.snp.bottom).offset(14)
        }

        storeAddressBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        storeAddressBtn.tintColor = UIColor.hex(hexString: "#CCCCCC")
        storeAddressBtn.setTitle("请选择", for: UIControl.State.normal)
        storeAddressBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        storeAddressBtn.contentHorizontalAlignment = .right

        self.addSubview(storeAddressBtn)
        storeAddressBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(storeAddressLabel.snp.right).offset(30)
            ConstraintMaker.top.equalTo(storeCategoryLine.snp.bottom)
            ConstraintMaker.right.equalToSuperview().offset(-33)
            ConstraintMaker.height.equalTo(44)
        }
        //MARK:选择店铺地址操作
        storeAddressBtn.addTarget(self, action: #selector(tapChooseStoreAddressAction), for: UIControl.Event.touchUpInside)


        storeAddressLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(storeAddressLine)
        storeAddressLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(storeAddressBtn.snp.bottom)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
        }
        storeAddressIcon.image = UIImage.init(named: "notice")
        self.addSubview(storeAddressIcon)
        storeAddressIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(14)
            ConstraintMaker.width.equalTo(9)
            ConstraintMaker.left.equalTo(storeAddressBtn.snp.right).offset(9)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.top.equalTo(storeCategoryLine.snp.bottom).offset(15)
        }

        //MARK:店铺详细地址
        storeAddressEdit.tintColor = UIColor.hex(hexString: "#CCCCCC")
        storeAddressEdit.textColor = UIColor.black
        storeAddressEdit.placeholder = "详细地址例: 1号楼101室"
        storeAddressEdit.font = UIFont.systemFont(ofSize: 17)
        storeAddressEdit.textAlignment = .left
        self.addSubview(storeAddressEdit)
        storeAddressEdit.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.top.equalTo(storeAddressLine.snp.bottom)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }

        storeAddressEditLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(storeAddressEditLine)
        storeAddressEditLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(storeAddressEdit.snp.bottom)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
        }
        
        //MARK:客服电话
        consumerPhoneLaber.text = "客服电话"
        consumerPhoneLaber.textColor = UIColor.black
        consumerPhoneLaber.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(consumerPhoneLaber)
        consumerPhoneLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(storeAddressEditLine.snp.bottom).offset(14)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        
        consumerPhoneEdit.tintColor = UIColor.hex(hexString: "#CCCCCC")
        consumerPhoneEdit.placeholder = "请输入"
        consumerPhoneEdit.textColor = UIColor.black
        consumerPhoneEdit.font = UIFont.systemFont(ofSize: 17)
        consumerPhoneEdit.textAlignment = .right
        consumerPhoneEdit.keyboardType = UIKeyboardType.numberPad
        self.addSubview(consumerPhoneEdit)
        consumerPhoneEdit.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(consumerPhoneLaber.snp.right).offset(30)
            ConstraintMaker.top.equalTo(storeAddressEditLine.snp.bottom)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.width.equalTo(240)
        }

        //MARK:店铺照片
        storePhotoLabel.text = "店铺照片"
        storePhotoLabel.textColor = UIColor.hex(hexString: "#808080")
        self.addSubview(storePhotoLabel)
        storePhotoLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(whiteBgOne.snp.bottom).offset(19)
        }

        //MARK:第二块白色背景图
        whiteBgTwo.backgroundColor = UIColor.white
        self.addSubview(whiteBgTwo)
        whiteBgTwo.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalTo(storePhotoLabel.snp.bottom).offset(11)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(272)
        }
        
        //MARK:店铺背景
        storeBgLabel.text = "店铺背景"
        storeBgLabel.textColor = UIColor.black
        storeBgLabel.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(storeBgLabel)
        storeBgLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(whiteBgTwo.snp.top).offset(37)
        }
        
        storeBgBtn.setBackgroundImage(UIImage.init(named: "add"), for: UIControl.State.normal)
        self.addSubview(storeBgBtn)
        storeBgBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(145)
            ConstraintMaker.top.equalTo(whiteBgTwo.snp.top).offset(15)
             ConstraintMaker.size.equalTo(60)
        }

        storeBgDescriptionLabel.text = "顶部店铺背景（支持jpg、jprg、png格式，大小不超过1mb尺寸建议750*300px"
        storeBgDescriptionLabel.font = UIFont.systemFont(ofSize: 12)
        storeBgDescriptionLabel.lineBreakMode = .byWordWrapping
        storeBgDescriptionLabel.numberOfLines = 0
        storeBgDescriptionLabel.textColor = UIColor.hex(hexString: "#CCCCCC")
        self.addSubview(storeBgDescriptionLabel)
        storeBgDescriptionLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(storeBgBtn.snp.right).offset(12)
            ConstraintMaker.top.equalTo(whiteBgTwo.snp.top).offset(19)
            ConstraintMaker.right.equalToSuperview().offset(-13)
        }
        
        storeBgLebelLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(storeBgLebelLine)
        storeBgLebelLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.top.equalTo(storeBgBtn.snp.bottom).offset(15)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
        }

       //Mark:店铺背景选择
        storeBgBtn.addTarget(self, action: #selector(chooseStoreBgPicAction), for: UIControl.Event.touchUpInside)

        //MARK:店铺logo
        storeLogoLabel.text = "店铺LOGO"
        storeLogoLabel.textColor = UIColor.black
        storeLogoLabel.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(storeLogoLabel)
        storeLogoLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(storeBgLebelLine.snp.bottom).offset(37)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }


        storeLogoBtn.setBackgroundImage(UIImage.init(named: "add"), for: UIControl.State.normal)
        self.addSubview(storeLogoBtn)
        storeLogoBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(145)
            ConstraintMaker.top.equalTo(storeBgLebelLine.snp.bottom).offset(15)
            ConstraintMaker.size.equalTo(60)
        }

        storeLogoDescriptionLabel.text = "店铺Logo（支持jpg、jprg、png格式，大小不超过1mb尺寸建议100*100px"
        storeLogoDescriptionLabel.font = UIFont.systemFont(ofSize: 12)
        storeLogoDescriptionLabel.lineBreakMode = .byWordWrapping
        storeLogoDescriptionLabel.numberOfLines = 0
        storeLogoDescriptionLabel.textColor = UIColor.hex(hexString: "#CCCCCC")
        self.addSubview(storeLogoDescriptionLabel)
        storeLogoDescriptionLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(storeLogoBtn.snp.right).offset(12)
            ConstraintMaker.top.equalTo(storeBgLebelLine.snp.top).offset(19)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }

        storeLogoLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(storeLogoLine)
        storeLogoLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.top.equalTo(storeLogoBtn.snp.bottom).offset(15)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
        }
        //Mark:Logo选择
        storeLogoBtn.addTarget(self, action: #selector(chooseStoreLogoPicAction), for: UIControl.Event.touchUpInside)


        //MARK:店铺营业执照
        storeLicenseLabel.text = "营业执照"
        storeLicenseLabel.textColor = UIColor.black
        storeLicenseLabel.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(storeLicenseLabel)
        storeLicenseLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(storeLogoLine.snp.bottom).offset(37)
        }

        storeLicenseBtn.setBackgroundImage(UIImage.init(named: "add"), for: UIControl.State.normal)
        self.addSubview(storeLicenseBtn)
        storeLicenseBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(145)
            ConstraintMaker.top.equalTo(storeLogoLine.snp.bottom).offset(15)
            ConstraintMaker.size.equalTo(60)
        }

        storeLicenseDescriptionLabel.text = "营业执照（支持jpg、jprg、png格式，大小不超过1mb尺寸建议100*100px"
        storeLicenseDescriptionLabel.font = UIFont.systemFont(ofSize: 12)
        storeLicenseDescriptionLabel.lineBreakMode = .byWordWrapping
        storeLicenseDescriptionLabel.numberOfLines = 0
        storeLicenseDescriptionLabel.textColor = UIColor.hex(hexString: "#CCCCCC")
        self.addSubview(storeLicenseDescriptionLabel)
        storeLicenseDescriptionLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(storeLicenseBtn.snp.right).offset(12)
            ConstraintMaker.top.equalTo(storeLogoLine.snp.top).offset(20)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        //Mark:营业执照选择
        storeLicenseBtn.addTarget(self, action: #selector(chooseLicensePicAction), for: UIControl.Event.touchUpInside)

         //MARK:提交审核
        joinButton.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        joinButton.setTitle("提交审核", for: UIControl.State.normal)
        joinButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        joinButton.layer.masksToBounds = true
        joinButton.layer.cornerRadius = 3
        joinButton.titleLabel?.font = UIFont .boldSystemFont(ofSize: 17)
        self.addSubview(joinButton)
        joinButton.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(whiteBgTwo.snp.bottom).offset(49)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(44)
        }

        joinButton.addTarget(self, action: #selector(pushAppyAction), for: UIControl.Event.touchUpInside)
    }

    @objc func tapChooseStoreAddressAction() {
        delegate?.tapChooseStoreAddressAction()
    }

    @objc func chooseStoreLogoPicAction() {
        delegate?.tapChooseStoreLogoPicAction()
    }

    @objc func chooseStoreBgPicAction() {
        delegate?.tapChooseStoreBgPicAction()
    }

    @objc func chooseLicensePicAction() {
        delegate?.tapChooseLicensePicAction()
    }

    @objc func chooseStoreClassAction() {
        delegate?.tapChooseStoreClassAction()
    }

    @objc func pushAppyAction() {
        delegate?.tapPushApply(contactName: contactEdit.text!, phoneNumber: phoneNumberEdit.text!, storeName: storeNameEdit.text!, storeClass: storeCategoryBtn.currentTitle!, storeAddress: storeAddressEdit.text!, serviceTel: consumerPhoneEdit.text!)
    }

}
