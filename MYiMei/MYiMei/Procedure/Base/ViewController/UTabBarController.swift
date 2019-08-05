//
//  UTabBarController.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/24.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UTabBarController: UITabBarController {
    
    let homePageVC = UHomeController()
    let classVC = UManagerOrdersController()
    
    ///NEW
    let goodsVC = UGoodsManagementController()
    let settingVC = USettingViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.isTranslucent = false

        /// 待处理
        
        addChildViewController(homePageVC,
                               title: "首页",
                               image: UIImage(named: "tab_home"),
                               selectedImage: UIImage(named: "tab_home_S"))

        /// 订单管理
        
        addChildViewController(classVC,
                               title: "订单",
                               image: UIImage(named: "tab_manager_orders"),
                               selectedImage: UIImage(named: "tab_manager_orders_S"))

        /// 我的店铺
        
        addChildViewController(goodsVC,
                               title: "商品",
                               navigateTile: "商品管理",
                               image: UIImage(named: "tab_goods"),
                               selectedImage: UIImage(named: "tab_goods_S"))
        
        /// 设置
        addChildViewController(settingVC,
                               title: "设置",
                               image:  UIImage(named: "tab_setting"),
                               selectedImage: UIImage(named: "tab_setting_S"))

    }

    func addChildViewController(_ childController: UIViewController, title:String?,navigateTile:String = "", image:UIImage? ,selectedImage:UIImage?) {

        childController.title = navigateTile == "" ? title : navigateTile
        childController.tabBarItem = UITabBarItem(title: title,
                                                  image: image?.withRenderingMode(.alwaysOriginal),
                                                  selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
        childController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 0);

        if UIDevice.current.userInterfaceIdiom == .phone {
            childController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        addChild(UNavigationController(rootViewController: childController))
    }

}

extension UTabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let select = selectedViewController else { return .lightContent }
        return select.preferredStatusBarStyle
    }
}

