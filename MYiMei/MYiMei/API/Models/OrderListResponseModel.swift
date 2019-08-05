//
//  OrderListResponseModel.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/10.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

//MARK:订单列表返回的Json数据
class OrderListResponseModel: Codable {
    
    var code : Int!
    var data : OrderList!
    var msg : String!
    
}

//MARK:返回的订单列表
class OrderList: Codable{
    
    var order : [Order]!
    
}

// MARK:返回订单对象
class Order : Codable{
    
    var order_id : Int!
    var name : String!
    var mobile : String!
    var address : String!
    var remark : String!
    var seller_comments : String?//商家备注
    var express : String!
    var express_no : String!
    var order_no : String!
    var addtime : Int!
    var express_price : String!
    var total_price : String!
    var pay_price : String!
    var before_update_price : String!//修改前实际支付费用
    var coupon_sub_price : String!
    var is_pay : Int!
    var pay_type : Int!
    var pay_time : Int!
    var is_send : Int!
    var send_time : Int!
    var is_confirm : Int!
    var confirm_time : Int!
    var is_delete : Int!
    var order_status : Int!//订单状态
    var goodsList : [GoodsList]!
    
    
}

//MARK:订单中商品详情
class GoodsList : Codable{
    var name : String!
    var total_price : String!
    var pic : String!
    var attr : [Attr]!
    var num : Int!
}

//MARK:商品的商品规格
class Attr : Codable{
    var attr_id = Int()
    var attr_group_name : String!
    var attr_name : String!
    var no : String!
}
