//
//  UAccountSafeController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/3.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UAccountSafeController: UBaseViewController{
    
    let accountSafeView = UAccountSafeView()
    
    var title：String = "账号与安全"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accountSafeView.delegate = self
        accountSafeView.configUI()
        self.view.addSubview(accountSafeView)
        accountSafeView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }

    func showAlertControllerStyle() {
        let alertController = UIAlertController(title: "温馨提示", message: "是否确定退出登录？", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "确定", style: UIAlertAction.Style.default) {
            (action: UIAlertAction!) -> Void in
            self.logout()
        }
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }

    func logout() -> Void {
        APIUser.shared.cleanUser()
        (UIApplication.shared.delegate as! AppDelegate).showLoginView()
        JPUSHService.deleteAlias({ (iResCode, iAlias, seq) in
            print("注销极光别名儿 \(iResCode),\(String(describing: iAlias)),\(seq)")
        }, seq: 0)
    }
    
    func jumpToChangePassword() {
        let vc = UChangePasswordController()
        vc.title = "修改密码"
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension UAccountSafeController: UAccountSafeViewDelegate {
    func tapModifyPasswordAction() {
        jumpToChangePassword()
    }
    
    func tapLogoutAction() {
        self.showAlertControllerStyle()
    }
    
}
