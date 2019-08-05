//
//  USettingDeliveryController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/8.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class USettingDeliveryController: UBaseViewController {
    
    var refreshOrderData : (() -> ())?
    
    let settingDelivery = USettingDeliveryView()
    
    var expressList = [ExpressModel]()
    
    let service = APIOrderServices()
    
    var curCatIndex = 0//当前选择的物流公司索引
    
    var orderId = 0
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configUI() {
        settingDelivery.configUI()
        settingDelivery.delegate = self
        
        view.addSubview(settingDelivery)
        settingDelivery.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getExpressList()
    }
    
    func getExpressList() {
        service.getExpressList({ (ExpressListResponesModel) in
            self.expressList = ExpressListResponesModel.data?.express ?? []
        }) { (APIErrorModel) in
            NSLog("请求失败")
            showHUDInView(text: "获取物流公司失败,请重试", inView: self.view)
        }
    }
    
    func chooseCourierDelivery() {
        //MARK:请求按钮
        let express = settingDelivery.courierCompanyChoiceBtn.currentTitle ?? ""
        if express == "请选择" || express == "" {
            showHUDInView(text: "请选择物流公司", inView: self.view)
            return
        }
        let expressNo = settingDelivery.courierOrderNoLabel.text ?? ""
        let words = settingDelivery.courierLeaveMessageTF.text ?? ""
        service.deliveryGoods(order_id: orderId, is_express: 1, express: express, express_no: expressNo, words: words, {
            print("发货成功")
            showHUDInView(text: "发货成功", inView: self.view)
            //通过上层的传递的闭包刷新数据
            self.refreshOrderData?()
            
            self.pressBack()
        }) { (APIErrorModel) in
            print(APIErrorModel.msg ?? "发货失败")
            showHUDInView(text: "发货失败", inView: self.view)
        }
    }
    
    func setExpress() {
        // Simple Option Picker
        var dummyList = [String]()
        for item in expressList {
            dummyList.append(item.name!)
        }
        // Simple Option Picker with selected index
        RPicker.selectOption(title: "", hideCancel: true, dataArray: dummyList, selectedIndex: curCatIndex) { (selctedText, atIndex) in
            self.curCatIndex = atIndex
            self.settingDelivery.courierCompanyChoiceBtn.setTitle(selctedText, for: .normal)
        }
    }
    
}

extension USettingDeliveryController: USettingDeliveryViewDelegate {
    func checkCourierDeliverySwitch() {
        chooseCourierDelivery()
    }
}
