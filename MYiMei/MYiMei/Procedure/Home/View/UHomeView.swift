//
//  UHomeView.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/16.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import Charts

protocol UHomeViewDelegate: AnyObject {
    func tapMessageManager()//消息管理
    func tapCommentsManager()//评论管理
    func tapShopSetting()//店铺设置
    func tapFinancialOver()//财务结算
    func tapDepost()//保证金
    func tapSalesControl(sender: UISegmentedControl)//保证金
    func tapPayControl(sender: UISegmentedControl)//保证金
}

class UHomeView: BaseView {
    
    weak var delegate: UHomeViewDelegate?
    
    //蓝色背景
    var blueBg = UIImageView()
    //头像
    var storeAvatarIcon = UIImageView()
    //店铺名称
    var storeNameLaber = UILabel()
    //功能白色背景
    var featuresBg = UIImageView()
    //功能
    var message = UHomeMessageManagementCell()
    var messageBtn = UIButton()
    
    var evaluation = UHomeEvaluationManagementCell()
    var evaluationBtn = UIButton()
    
    var storeSetting = UHomeStoreSettingsCell()
    var storeSettingBtn = UIButton()
    
    var financial = UHomeStoreSettingsCell()
    var financialBtn = UIButton()
    
    var depost = UHomeDepostCell()
    var depostBtn = UIButton()
    //销售白色背景
    var salesWhiteBg = UIImageView()
    //销售统计
    var salesLaber = UILabel()
    var salerLine = UILabel()
    
    //分段-销售统计
    var salesSegmentedControl = UISegmentedControl.init(items: ["汇总","今日","昨日","7日","30日"])
    
    //支付订单数
    var payOrderLaber = UILabel()
    var payOrderNumberLaber = UILabel()
    //支付金额
    var payAmountLaber = UILabel()
    var payAmountNumberLaber = UILabel()
    //待付款
    var pendingPayLayerView = UIView()
    var pendingPayLaber = UILabel()
    var pendingPayLeftIcon = UIImageView()
    var pendingPayRightIcon = UIImageView()
    var pendingPayNumberLaber = UILabel()
    //待发货
    var wiatDeliveryLayerView = UIView()
    var wiatDeliveryLaber = UILabel()
    var wiatDeliveryLeftIcon = UIImageView()
    var wiatDeliveryRightIcon = UIImageView()
    var wiatDeliveryNumberLaber = UILabel()
    //维权订单
    var activistOrderLayerView = UIView()
    var activistOrderLaber = UILabel()
    var activistOrderLeftIcon = UIImageView()
    var activistOrderRightIcon = UIImageView()
    var activistOrderNumberLaber = UILabel()
    //金额白色背景
    var moneyWhiteBg = UIImageView()
    var payAmount = UILabel()
    
    //分段-支付金额
    var paySegmentedControl = UISegmentedControl.init(items: ["今日","昨日","7日","30日"])
    
    var chartView = LineChartView()
    
    func setView() {
        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        
        //MARK:蓝色背景
        blueBg.image = UIImage.init(named: "home_blueBg")
        self.addSubview(blueBg)
        blueBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(126 + UIApplication.shared.statusBarFrame.height)
        }
        //MARK:头像
        storeAvatarIcon.backgroundColor = UIColor.white
        storeAvatarIcon.layer.cornerRadius = 17
        storeAvatarIcon.layer.masksToBounds = true
        self.addSubview(storeAvatarIcon)
        storeAvatarIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(blueBg.snp.top).offset(15 + UIApplication.shared.statusBarFrame.height)
            ConstraintMaker.size.equalTo(34)
        }
        //MARk:店铺名称
        storeNameLaber.text = "箭牌卫浴旗舰店"
        storeNameLaber.textColor = UIColor.white
        storeNameLaber.font = UIFont.boldSystemFont(ofSize: 17)
        self.addSubview(storeNameLaber)
        storeNameLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(storeAvatarIcon.snp.right).offset(15)
            ConstraintMaker.centerY.equalTo(storeAvatarIcon)
        }
        //MARK:功能背景
        featuresBg.backgroundColor = UIColor.white
        featuresBg.layer.cornerRadius = 5
        self.addSubview(featuresBg)
        featuresBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(storeAvatarIcon.snp.bottom).offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(80)
        }
        //MARK:消息管理
        message.configUI()
        self.addSubview(message)
        message.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(featuresBg.snp.left)
            ConstraintMaker.top.equalTo(featuresBg.snp.top).offset(17)
            ConstraintMaker.width.equalTo(featuresBg).dividedBy(5)
        }
        self.addSubview(messageBtn)
        messageBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(featuresBg.snp.left)
            ConstraintMaker.top.equalTo(featuresBg.snp.top).offset(17)
            ConstraintMaker.width.equalTo(featuresBg).dividedBy(5)
        }
        messageBtn.addTarget(self, action: #selector(messageManager), for: UIControl.Event.touchUpInside)
        //MARK:评论管理
        evaluation.configUI()
        self.addSubview(evaluation)
        evaluation.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(message.snp.right)
            ConstraintMaker.top.equalTo(featuresBg.snp.top).offset(17)
            ConstraintMaker.width.equalTo(featuresBg).dividedBy(5)
        }
        self.addSubview(evaluationBtn)
        evaluationBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(message.snp.right)
            ConstraintMaker.top.equalTo(featuresBg.snp.top).offset(17)
            ConstraintMaker.width.equalTo(featuresBg).dividedBy(5)
        }
        evaluationBtn.addTarget(self, action: #selector(commentsManager), for: UIControl.Event.touchUpInside)
        //MARK:店铺设置
        storeSetting.configUI()
        self.addSubview(storeSetting)
        storeSetting.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(evaluation.snp.right)
            ConstraintMaker.top.equalTo(featuresBg.snp.top).offset(17)
           ConstraintMaker.width.equalTo(featuresBg).dividedBy(5)
        }
        
        self.addSubview(storeSettingBtn)
        storeSettingBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(evaluation.snp.right)
            ConstraintMaker.top.equalTo(featuresBg.snp.top).offset(17)
            ConstraintMaker.width.equalTo(featuresBg).dividedBy(5)
        }
        storeSettingBtn.addTarget(self, action: #selector(shopSetting), for: UIControl.Event.touchUpInside)
        //MARK:财务结算
        financial.configUI()
        financial.menuIcon.image = UIImage.init(named: "homeFinancialSettlementCell")
        financial.marginLabel.text = "财务结算"
        self.addSubview(financial)
        financial.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(storeSetting.snp.right)
            ConstraintMaker.top.equalTo(featuresBg.snp.top).offset(17)
            ConstraintMaker.width.equalTo(featuresBg).dividedBy(5)
        }
        self.addSubview(financialBtn)
        financialBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(storeSetting.snp.right)
            ConstraintMaker.top.equalTo(featuresBg.snp.top).offset(17)
            ConstraintMaker.width.equalTo(featuresBg).dividedBy(5)
        }
        financialBtn.addTarget(self, action: #selector(financialOver), for: UIControl.Event.touchUpInside)
        //MARK:保证金
        depost.configUI()
        self.addSubview(depost)
        depost.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(financial.snp.right)
            ConstraintMaker.top.equalTo(featuresBg.snp.top).offset(17)
            ConstraintMaker.width.equalTo(featuresBg).dividedBy(5)
        }
        self.addSubview(depostBtn)
        depostBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(financial.snp.right)
            ConstraintMaker.top.equalTo(featuresBg.snp.top).offset(17)
            ConstraintMaker.width.equalTo(featuresBg).dividedBy(5)
        }
        depostBtn.addTarget(self, action: #selector(depostTap), for: UIControl.Event.touchUpInside)
        
        //MARK:销售统计背景
        salesWhiteBg.backgroundColor = UIColor.white
        salesWhiteBg.layer.cornerRadius = 5
        self.addSubview(salesWhiteBg)
        salesWhiteBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(featuresBg.snp.bottom).offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(216)
        }
        salesLaber.text = "销售统计"
        salesLaber.textColor = UIColor.hex(hexString: "#333333")
        salesLaber.font = UIFont.boldSystemFont(ofSize: 15)
        self.addSubview(salesLaber)
        salesLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(salesWhiteBg.snp.left).offset(15)
            ConstraintMaker.top.equalTo(salesWhiteBg.snp.top).offset(15)
        }
        
        salesSegmentedControl.tintColor = UIColor.hex(hexString: "#1C98F6")
        salesSegmentedControl.layer.borderColor = UIColor.hex(hexString: "#1C98F6").cgColor
        salesSegmentedControl.layer.borderWidth = 1
        salesSegmentedControl.layer.cornerRadius = 15
        salesSegmentedControl.layer.masksToBounds = true
        self.addSubview(salesSegmentedControl)
        salesSegmentedControl.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(salesWhiteBg).offset(16)
            ConstraintMaker.right.equalTo(salesWhiteBg).offset(-16)
            ConstraintMaker.top.equalTo(salesLaber.snp.bottom).offset(15)
            ConstraintMaker.height.equalTo(28)
        }
        salesSegmentedControl.addTarget(self, action: #selector(salesContorl(_:)), for: .valueChanged)
        
        //MARK:支付订单数
        payOrderLaber.text = "支付订单数"
        payOrderLaber.textColor = UIColor.hex(hexString: "#999999")
        payOrderLaber.font = UIFont.systemFont(ofSize: 12)
        payOrderLaber.textAlignment = .center
        self.addSubview(payOrderLaber)
        payOrderLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(salesWhiteBg.snp.left)
            ConstraintMaker.top.equalTo(salesSegmentedControl.snp.bottom).offset(40)
            ConstraintMaker.width.equalTo(salesWhiteBg.snp.width).dividedBy(2)
        }
        payOrderNumberLaber.text = "4343"
        payOrderNumberLaber.textColor = UIColor.black
        payOrderNumberLaber.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(payOrderNumberLaber)
        payOrderNumberLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.bottom.equalTo(payOrderLaber.snp.top).offset(-5)
            ConstraintMaker.centerX.equalTo(payOrderLaber)
        }
        //MARK:支付金额
        payAmountLaber.text = "支付金额"
        payAmountLaber.textColor = UIColor.hex(hexString: "#999999")
        payAmountLaber.textAlignment = .center
        payAmountLaber.font = UIFont.systemFont(ofSize: 12)
        self.addSubview(payAmountLaber)
        payAmountLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(payOrderLaber.snp.right)
            ConstraintMaker.top.equalTo(salesSegmentedControl.snp.bottom).offset(40)
            ConstraintMaker.width.equalTo(salesWhiteBg.snp.width).dividedBy(2)
        }
        payAmountNumberLaber.text = "43434.00"
        payAmountNumberLaber.textColor = UIColor.black
        payAmountNumberLaber.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(payAmountNumberLaber)
        payAmountNumberLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.bottom.equalTo(payAmountLaber.snp.top).offset(-5)
            ConstraintMaker.centerX.equalTo(payAmountLaber)
        }
        //MARK:分割线
        salerLine.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        self.addSubview(salerLine)
        salerLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(salesWhiteBg.snp.left).offset(15)
            ConstraintMaker.top.equalTo(payOrderLaber.snp.bottom).offset(15)
            ConstraintMaker.right.equalTo(salesWhiteBg.snp.right).offset(-15)
            ConstraintMaker.height.equalTo(1)
        }
        //MARK:待付款
        self.addSubview(pendingPayLayerView)
        pendingPayLayerView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(salesWhiteBg.snp.left)
            ConstraintMaker.top.equalTo(salerLine.snp.bottom).offset(15)
            ConstraintMaker.width.equalTo(salesWhiteBg.snp.width).dividedBy(3)
        }
        pendingPayLaber.text = "待付款"
        pendingPayLaber.textColor = UIColor.hex(hexString: "#999999")
        pendingPayLaber.font = UIFont.systemFont(ofSize: 12)
        pendingPayLaber.textAlignment = .center
        pendingPayLayerView.addSubview(pendingPayLaber)
        pendingPayLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(salerLine.snp.bottom).offset(15)
            ConstraintMaker.centerX.equalToSuperview()
        }
        pendingPayLeftIcon.image = UIImage.init(named: "pending_pay")
        pendingPayLayerView.addSubview(pendingPayLeftIcon)
        pendingPayLeftIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalTo(pendingPayLaber.snp.left).offset(-5)
            ConstraintMaker.centerY.equalTo(pendingPayLaber)
            ConstraintMaker.size.equalTo(12)
        }
        pendingPayRightIcon.image = UIImage.init(named: "right_icon")
        pendingPayLayerView.addSubview(pendingPayRightIcon)
        pendingPayRightIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(pendingPayLaber.snp.right).offset(7)
            ConstraintMaker.centerY.equalTo(pendingPayLaber)
            ConstraintMaker.width.equalTo(6)
            ConstraintMaker.height.equalTo(9)
        }
        pendingPayNumberLaber.text = "245"
        pendingPayNumberLaber.textColor = UIColor.black
        pendingPayNumberLaber.font = UIFont.systemFont(ofSize: 16)
        pendingPayLayerView.addSubview(pendingPayNumberLaber)
        pendingPayNumberLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalTo(pendingPayLaber)
            ConstraintMaker.top.equalTo(pendingPayLaber.snp.bottom).offset(8)
        }
        //MARK:待发货
        self.addSubview(wiatDeliveryLayerView)
        wiatDeliveryLayerView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(pendingPayLayerView.snp.right)
            ConstraintMaker.top.equalTo(salerLine.snp.bottom).offset(15)
            ConstraintMaker.width.equalTo(salesWhiteBg.snp.width).dividedBy(3)
        }
        wiatDeliveryLaber.text = "待发货"
        wiatDeliveryLaber.textColor = UIColor.hex(hexString: "#999999")
        wiatDeliveryLaber.font = UIFont.systemFont(ofSize: 12)
        wiatDeliveryLaber.textAlignment = .center
        wiatDeliveryLayerView.addSubview(wiatDeliveryLaber)
        wiatDeliveryLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(salerLine.snp.bottom).offset(15)
            ConstraintMaker.centerX.equalToSuperview()
        }
        wiatDeliveryLeftIcon.image = UIImage.init(named: "wiat_delivery")
        wiatDeliveryLayerView.addSubview(wiatDeliveryLeftIcon)
        wiatDeliveryLeftIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalTo(wiatDeliveryLaber.snp.left).offset(-5)
            ConstraintMaker.centerY.equalTo(wiatDeliveryLaber)
            ConstraintMaker.size.equalTo(12)
        }
        wiatDeliveryRightIcon.image = UIImage.init(named: "right_icon")
        wiatDeliveryLayerView.addSubview(wiatDeliveryRightIcon)
        wiatDeliveryRightIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(wiatDeliveryLaber.snp.right).offset(7)
            ConstraintMaker.centerY.equalTo(wiatDeliveryLaber)
            ConstraintMaker.width.equalTo(6)
            ConstraintMaker.height.equalTo(9)
        }
        wiatDeliveryNumberLaber.text = "245"
        wiatDeliveryNumberLaber.textColor = UIColor.black
        wiatDeliveryNumberLaber.font = UIFont.systemFont(ofSize: 16)
        wiatDeliveryLayerView.addSubview(wiatDeliveryNumberLaber)
        wiatDeliveryNumberLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalTo(wiatDeliveryLaber)
            ConstraintMaker.top.equalTo(wiatDeliveryLaber.snp.bottom).offset(8)
        }
        //MARK:维权订单
        self.addSubview(activistOrderLayerView)
        activistOrderLayerView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(wiatDeliveryLayerView.snp.right)
            ConstraintMaker.top.equalTo(salerLine.snp.bottom).offset(15)
            ConstraintMaker.width.equalTo(salesWhiteBg.snp.width).dividedBy(3)
        }
        activistOrderLaber.text = "维权订单"
        activistOrderLaber.textColor = UIColor.hex(hexString: "#999999")
        activistOrderLaber.font = UIFont.systemFont(ofSize: 12)
        activistOrderLaber.textAlignment = .center
        activistOrderLayerView.addSubview(activistOrderLaber)
        activistOrderLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(salerLine.snp.bottom).offset(15)
            ConstraintMaker.centerX.equalToSuperview()
        }
        activistOrderLeftIcon.image = UIImage.init(named: "activist_order")
        activistOrderLayerView.addSubview(activistOrderLeftIcon)
        activistOrderLeftIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalTo(activistOrderLaber.snp.left).offset(-5)
            ConstraintMaker.centerY.equalTo(activistOrderLaber)
            ConstraintMaker.size.equalTo(12)
        }
        activistOrderRightIcon.image = UIImage.init(named: "right_icon")
        activistOrderLayerView.addSubview(activistOrderRightIcon)
        activistOrderRightIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(activistOrderLaber.snp.right).offset(7)
            ConstraintMaker.centerY.equalTo(activistOrderLaber)
            ConstraintMaker.width.equalTo(6)
            ConstraintMaker.height.equalTo(9)
        }
        activistOrderNumberLaber.text = "245"
        activistOrderNumberLaber.textColor = UIColor.black
        activistOrderNumberLaber.font = UIFont.systemFont(ofSize: 16)
        activistOrderLayerView.addSubview(activistOrderNumberLaber)
        activistOrderNumberLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalTo(activistOrderLaber)
            ConstraintMaker.top.equalTo(activistOrderLaber.snp.bottom).offset(8)
        }
        
        //MARK:支付金额背景
        moneyWhiteBg.backgroundColor = UIColor.white
        moneyWhiteBg.layer.cornerRadius = 5
        self.addSubview(moneyWhiteBg)
        moneyWhiteBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(salesWhiteBg.snp.bottom).offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(250)
        }
        payAmount.text = "支付金额"
        payAmount.textColor = UIColor.hex(hexString: "#333333")
        payAmount.font = UIFont.boldSystemFont(ofSize: 15)
        self.addSubview(payAmount)
        payAmount.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(moneyWhiteBg.snp.left).offset(15)
            ConstraintMaker.top.equalTo(moneyWhiteBg.snp.top).offset(15)
        }
        
        paySegmentedControl.tintColor = UIColor.hex(hexString: "#1C98F6")
        paySegmentedControl.layer.borderColor = UIColor.hex(hexString: "#1C98F6").cgColor
        paySegmentedControl.layer.borderWidth = 1
        paySegmentedControl.layer.cornerRadius = 15
        paySegmentedControl.layer.masksToBounds = true
        self.addSubview(paySegmentedControl)
        paySegmentedControl.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(moneyWhiteBg).offset(16)
            ConstraintMaker.right.equalTo(moneyWhiteBg).offset(-16)
            ConstraintMaker.top.equalTo(payAmount.snp.bottom).offset(15)
            ConstraintMaker.height.equalTo(28)
        }
        paySegmentedControl.addTarget(self, action: #selector(payContorl(_:)), for: .valueChanged)

        self.addSubview(chartView)
        chartView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(moneyWhiteBg).offset(15)
            ConstraintMaker.right.equalTo(moneyWhiteBg).offset(-15)
            ConstraintMaker.top.equalTo(paySegmentedControl.snp.bottom).offset(15)
            ConstraintMaker.height.equalTo(155)
        }
    }
    @objc func messageManager() {
        delegate?.tapMessageManager()//消息管理
    }
    @objc func commentsManager() {
        delegate?.tapCommentsManager()
    }
    @objc func shopSetting() {
        delegate?.tapShopSetting()
    }
    @objc func financialOver() {
        delegate?.tapFinancialOver()
    }
    @objc func depostTap() {
        delegate?.tapDepost()
    }
    @objc func salesContorl(_ sender: UISegmentedControl){
        delegate?.tapSalesControl(sender: sender)
    }
    @objc func payContorl(_ sender: UISegmentedControl){
        delegate?.tapPayControl(sender: sender)
    }
}
