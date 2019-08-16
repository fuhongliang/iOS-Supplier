//
//  UModifySetUpShopController.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/11.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UModifySetUpShopController: UBaseViewController {
    
    fileprivate var services = APIUserServices()
    
    let mModifySetUpShopController = UModifySetUpShopView()
    
    var paramIndex: Int?
    
    var paramValue: String?
    
    convenience init(paramIndex: Int?, paramValue: String?) {
        self.init()
        self.paramIndex = paramIndex
        self.paramValue = paramValue
    }
    
    override func configUI() {
        mModifySetUpShopController.setView()
        mModifySetUpShopController.delegate = self
        self.view.addSubview(mModifySetUpShopController)
        self.view.backgroundColor = UIColor.white
        mModifySetUpShopController.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        mModifySetUpShopController.modifyEdit.text = paramValue
    }
    
    func updataStoreInfo(mContent:String){
        var param = String()
        switch paramIndex {
        case 0:
            param = "name"
        case 1:
            param = "realname"
        case 2:
            param = "tel"
        case 3:
            param = "service_tel"
        case 5:
            param = "address"
        case 6:
            param = "mch_color"
        case 7:
            param = "header_color"
        default:
            param = "name"
        }
        
        services.modifyStoreInfo(param: param, paramValue: mContent, {
            showHUDInView(text: "修改成功", inView: self.view)
            self.pressBack()
        }, { (APIErrorModel) in
              showHUDInView(text: APIErrorModel.msg!, inView: self.view)
        })
        
    }
    
}

extension UModifySetUpShopController:UModifySetUpShopViewDelegate{
    func tapOkAction(content: String) {
        guard content.count > 0 else {
            showHUDInView(text: "请输入\(title ?? "内容")", inView: view)
            return
        }
        self.updataStoreInfo(mContent: content)
        
    }
    
}
