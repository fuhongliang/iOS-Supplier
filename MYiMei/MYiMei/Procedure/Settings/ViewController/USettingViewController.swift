//
//  USettingViewController.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/13.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class USettingViewController: UBaseViewController {
    
    let mSettingView = USettingView()
    
    fileprivate var service = APIUserServices()
    
    override func configUI() {
        mSettingView.setView()
        self.view.addSubview(mSettingView)
        self.view.backgroundColor = UIColor.white
        mSettingView.delegate = self
        mSettingView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        getStoreInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func getStoreInfo(){
        service.storeInfo({ (StoreInfoModel) in
            let url = URL(string: StoreInfoModel.data.mch?.logo ?? "")
            self.mSettingView.headIcon.kf.setImage(with: url)
            self.mSettingView.storeNameLaber.text = StoreInfoModel.data.mch?.name
            self.mSettingView.storeAddressLaber.text = StoreInfoModel.data.mch?.address
        }) { (APIErrorModel) in
            
        }
    }
    
    func showAlertControllerStyle() {
        let alertController = UIAlertController(title: "温馨提示", message: "是否拨打平台联系电话？", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "确定", style: UIAlertAction.Style.default) {
            (action: UIAlertAction!) -> Void in
            
            let phone = "telprompt://" + APIUser.shared.user!.service_tel!
            
            if UIApplication.shared.canOpenURL(URL(string: phone)!) {
                UIApplication.shared.openURL(URL(string: phone)!)
            }
        }
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

extension USettingViewController : USettingViewDelegate {
    func tapShopSetting() {
        let vc = USetUpShopController()
        vc.title = "店铺设置"
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tapAccountSafe() {
        let vc = UAccountSafeController()
        vc.title = "账户安全"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tapCallThePlatform() {
        self.showAlertControllerStyle()
    }
    
    func tapAboutThePlatform() {
        let vc = AboutUsViewController()
        vc.title = "关于平台"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
