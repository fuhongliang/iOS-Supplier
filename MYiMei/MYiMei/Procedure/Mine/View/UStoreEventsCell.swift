//
//  UStoreEventsCell.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/25.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UStoreEventsCell: UBaseTableViewCell {

    var subscribeFinancialAction : (() -> ())?
    var subscribeGoodsManagementAction : (() -> ())?
    var subscribeStoreSettingsAction : (() -> ())?
    var subscribeBusinessDataAction : (() -> ())?

    //今日订单收入
    var todayIncome = UDataCell()
    //今日订单量
    var todayOrders = UDataCell()

    //蓝色背景
    var bluebgView: UIImageView = {
        let iw = UIImageView()
        iw.contentMode = .scaleAspectFill
        iw.backgroundColor = UIColor.theme
        return iw
    }()

    //白色背景
    var whitebgView: UIImageView = {
        let iw = UIImageView()
        iw.clipsToBounds = true
        iw.layer.cornerRadius = 20
        iw.contentMode = .scaleAspectFill
        iw.backgroundColor = UIColor.white
        return iw
    }()

    //店铺概况
    var storeInfoLabel = UILabel()

    //店铺总订单量
    var storeOrdersAmountLabel: UILabel = {
        let ll = UILabel()
        ll.font = UIFont.systemFont(ofSize: 18)
        ll.textColor = UIColor.black
        ll.text = "0"
        return ll
    }()
    var storeOrdersAmountDescrLabel: UILabel = {
        let ll = UILabel()
        ll.font = UIFont.systemFont(ofSize: 11)
        ll.textColor = UIColor.hex(hexString: "#666666")
        ll.text = "店铺总订单量"
        ll.textAlignment = .center
        return ll
    }()

    //店铺总商品量
    var storeGoodsAmountLabel: UILabel = {
        let ll = UILabel()
        ll.font = UIFont.systemFont(ofSize: 18)
        ll.textColor = UIColor.black
        ll.text = "0"
        return ll
    }()
    var storeGoodsAmountDescrLabel: UILabel = {
        let ll = UILabel()
        ll.font = UIFont.systemFont(ofSize: 11)
        ll.textColor = UIColor.hex(hexString: "#666666")
        ll.text = "店铺总收入"
        ll.textAlignment = .center
        return ll
    }()


    //30天下单量
    var thirtyDaysOrderAmountLabel: UILabel = {
        let ll = UILabel()
        ll.font = UIFont.systemFont(ofSize: 18)
        ll.textColor = UIColor.black
        ll.text = "0"
        return ll
    }()
    var thirtyDaysOrderAmountDescrLabel: UILabel = {
        let ll = UILabel()
        ll.font = UIFont.systemFont(ofSize: 11)
        ll.textColor = UIColor.hex(hexString: "#666666")
        ll.text = "30天下单量"
        ll.textAlignment = .center
        return ll
    }()

    //30天销售额
    var thirtyDaysIncomeAmountLabel: UILabel = {
        let ll = UILabel()
        ll.font = UIFont.systemFont(ofSize: 18)
        ll.textColor = UIColor.black
        ll.text = "0"
        return ll
    }()
    var thirtyDaysIncomeAmountDescrLabel: UILabel = {
        let ll = UILabel()
        ll.font = UIFont.systemFont(ofSize: 11)
        ll.textColor = UIColor.hex(hexString: "#666666")
        ll.text = "30天销售额"
        ll.textAlignment = .center
        return ll
    }()

    //分割线
    var line = UIImageView()

    //功能菜单
    var financial = UMenuDepost()
    var financialBtn = UIButton()

    var goodsManagement = UMenuGoodsManagement()
    var goodsManagementBtn = UIButton()

    var storeSettings = UMenuStoreSettings()
    var storeSettingsBtn = UIButton()

    var businessData = UMenuBusinessData()
    var businessDataBtn = UIButton()

    override func configUI() {
        contentView.addSubview(bluebgView)
        bluebgView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(93)
            ConstraintMaker.width.equalToSuperview()
        }

        contentView.addSubview(whitebgView)
        whitebgView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalTo(bluebgView.snp.bottom).offset(-20)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(177)
            ConstraintMaker.width.equalToSuperview()
        }


        contentView.addSubview(todayIncome)
        todayIncome.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalToSuperview()
            // 宽度等于父视图宽度的1/2
            ConstraintMaker.width.equalToSuperview().dividedBy(2)
        }

        todayOrders.decrsLabel.text = "今日订单数/单"
        contentView.addSubview(todayOrders)
        todayOrders.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(todayIncome.snp.right)
            // 宽度等于父视图宽度的1/2
            ConstraintMaker.width.equalToSuperview().dividedBy(2)
        }

        storeInfoLabel.text = "店铺概括"
        storeInfoLabel.textColor = UIColor.hex(hexString: "#808080")
        storeInfoLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(storeInfoLabel)
        storeInfoLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(whitebgView.snp.top).offset(21)
        }

        //总订单
        contentView.addSubview(storeOrdersAmountDescrLabel)
        storeOrdersAmountDescrLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.bottom.equalTo(storeInfoLabel.snp.top).offset(68)
            ConstraintMaker.width.equalToSuperview().dividedBy(4)
        }

        contentView.addSubview(storeOrdersAmountLabel)
        storeOrdersAmountLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalTo(storeOrdersAmountDescrLabel)
            ConstraintMaker.bottom.equalTo(storeOrdersAmountDescrLabel.snp.top).offset(-5)
        }

        //总商品
        contentView.addSubview(storeGoodsAmountDescrLabel)
        storeGoodsAmountDescrLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(storeOrdersAmountDescrLabel.snp.right)
            ConstraintMaker.bottom.equalTo(storeOrdersAmountDescrLabel.snp.bottom)
            ConstraintMaker.width.equalToSuperview().dividedBy(4)
        }

        contentView.addSubview(storeGoodsAmountLabel)
        storeGoodsAmountLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalTo(storeGoodsAmountDescrLabel)
            ConstraintMaker.bottom.equalTo(storeGoodsAmountDescrLabel.snp.top).offset(-5)
        }


        //30天下单量
        contentView.addSubview(thirtyDaysOrderAmountDescrLabel)
        thirtyDaysOrderAmountDescrLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(storeGoodsAmountDescrLabel.snp.right)
            ConstraintMaker.bottom.equalTo(storeGoodsAmountDescrLabel.snp.bottom)
            ConstraintMaker.width.equalToSuperview().dividedBy(4)
        }

        contentView.addSubview(thirtyDaysOrderAmountLabel)
        thirtyDaysOrderAmountLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalTo(thirtyDaysOrderAmountDescrLabel)
            ConstraintMaker.bottom.equalTo(thirtyDaysOrderAmountDescrLabel.snp.top).offset(-5)
        }

        //30天销售额
        contentView.addSubview(thirtyDaysIncomeAmountDescrLabel)
        thirtyDaysIncomeAmountDescrLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(thirtyDaysOrderAmountDescrLabel.snp.right)
            ConstraintMaker.bottom.equalTo(thirtyDaysOrderAmountDescrLabel.snp.bottom)
            ConstraintMaker.width.equalToSuperview().dividedBy(4)
        }

        contentView.addSubview(thirtyDaysIncomeAmountLabel)
        thirtyDaysIncomeAmountLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalTo(thirtyDaysIncomeAmountDescrLabel)
            ConstraintMaker.bottom.equalTo(thirtyDaysIncomeAmountDescrLabel.snp.top).offset(-5)
        }

        //分割线
        line.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        contentView.addSubview(line)
        line.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(thirtyDaysIncomeAmountDescrLabel.snp.bottom).offset(16)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(1)
        }

        //商品管理
        goodsManagement.configUI()
        contentView.addSubview(goodsManagement)
        goodsManagement.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.width.equalToSuperview().dividedBy(4)
            ConstraintMaker.top.equalTo(line.snp.bottom).offset(17)
        }

        contentView.addSubview(goodsManagementBtn)
        goodsManagementBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.width.equalToSuperview().dividedBy(4)
            ConstraintMaker.top.equalTo(line.snp.bottom).offset(17)
        }


        //店铺设置
        storeSettings.configUI()
        contentView.addSubview(storeSettings)
        storeSettings.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(goodsManagement.snp.right)
             ConstraintMaker.top.equalTo(line.snp.bottom).offset(17)
            ConstraintMaker.width.equalToSuperview().dividedBy(4)
        }

        contentView.addSubview(storeSettingsBtn)
        storeSettingsBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(goodsManagement.snp.right)
            ConstraintMaker.top.equalTo(line.snp.bottom).offset(17)
            ConstraintMaker.width.equalToSuperview().dividedBy(4)
        }

        //经营数据
        businessData.configUI()
        contentView.addSubview(businessData)
        businessData.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(storeSettings.snp.right)
             ConstraintMaker.top.equalTo(line.snp.bottom).offset(17)
            ConstraintMaker.width.equalToSuperview().dividedBy(4)
        }
        contentView.addSubview(businessDataBtn)
        businessDataBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(storeSettings.snp.right)
            ConstraintMaker.top.equalTo(line.snp.bottom).offset(17)
            ConstraintMaker.width.equalToSuperview().dividedBy(4)
        }
        
        //保证金
        financial.configUI()
        contentView.addSubview(financial)
        financial.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(businessData.snp.right)
            ConstraintMaker.top.equalTo(line.snp.bottom).offset(17)
            ConstraintMaker.width.equalToSuperview().dividedBy(4)
        }
        
        contentView.addSubview(financialBtn)
        financialBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(businessData.snp.right)
            ConstraintMaker.top.equalTo(line.snp.bottom).offset(17)
            ConstraintMaker.width.equalToSuperview().dividedBy(4)
        }
        

        goodsManagementBtn.addTarget(self, action: #selector(tapGoodsManagementAction), for: UIControl.Event.touchDown)
        storeSettingsBtn.addTarget(self, action: #selector(tapStoreSettingsAction), for: UIControl.Event.touchDown)
        financialBtn.addTarget(self, action: #selector(okTapFinancialAction), for: UIControl.Event.touchDown)
        businessDataBtn.addTarget(self, action: #selector(tapBusinessDataAction), for: UIControl.Event.touchDown)
    }

    @objc func okTapFinancialAction() {
        subscribeFinancialAction?()
    }

    @objc func tapGoodsManagementAction() {
        subscribeGoodsManagementAction?()
    }

    @objc func tapStoreSettingsAction() {
        subscribeStoreSettingsAction?()
    }
    @objc func tapBusinessDataAction() {
        subscribeBusinessDataAction?()
    }


    var model: DashBoardModel? {
        didSet {
            guard let model = model else { return }
            todayIncome.dataLabel.text = String(model.sell_statistics_today?.order_price ?? "0.00")
            todayOrders.dataLabel.text = String(model.sell_statistics_today?.order_num ?? 0)
            storeOrdersAmountLabel.text = String(model.sell_statistics_total?.order_num ?? 0)
            storeGoodsAmountLabel.text = String(model.sell_statistics_total?.order_price ?? "0.00")
            thirtyDaysOrderAmountLabel.text = String(model.sell_statistics_thirtydays?.order_num ?? 0)
            thirtyDaysIncomeAmountLabel.text = String(model.sell_statistics_thirtydays?.order_price ?? "0.00")
        }
    }
}

