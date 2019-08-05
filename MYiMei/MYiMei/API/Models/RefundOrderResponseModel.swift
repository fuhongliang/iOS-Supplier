//
//  RefundOrderResponseModel.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/29.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

//售后订单列表
class RefundOrderResponseModel: Codable {
    var code = Int()
    var msg = String()
    var data : RefundOrderListModel!
    
}

class RefundOrderListModel: Codable {
    var refund_order : [RefundOrderModel]!
}

class RefundOrderModel: Codable {
    var order_refund_id = Int()
    var name = String()
    var mobile = String()
    var address = String()
    var order_refund_no = String()
    var addtime = Int()
    var type = Int()
    var status = Int()
    var refuse_desc = String()
    var is_agree = Int()
    var desc = String()
    var pic_list : [String]!
    var refund_price = String()
    var is_user_send = Int()
    var user_send_express = String()
    var user_send_express_no = String()
    var goods_name = String()
    var goods_pic = String()
    var attr : [Attr]!
    var num = Int()
    var total_price = String()
}

