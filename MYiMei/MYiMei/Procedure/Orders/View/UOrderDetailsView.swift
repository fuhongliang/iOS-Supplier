//
//  UOrderDetailsView.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/4.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import SnapKit
import KMPlaceholderTextView

class UOrderDetailsView: BaseView {
    
    //字段说明
    var orderStatusLaber = UILabel()

    //背景
    var headBg = UIImageView()
    
    func setView()  {
//        self.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        //MARK:头部背景
        headBg.image = UIImage.init(named: "order_deatails_bg")
        self.addSubview(headBg)
        headBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.left.right.equalToSuperview()
            ConstraintMaker.height.equalTo(160)
        }
        
        
        //MARK:订单状态
        orderStatusLaber.text = "订单已经提交，等待买家付款"
        orderStatusLaber.textColor = UIColor.white
        orderStatusLaber.font = UIFont.boldSystemFont(ofSize: 24)
        self.addSubview(orderStatusLaber)
        orderStatusLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalToSuperview().offset(19)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        
    }
}
