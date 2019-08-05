//
//  OrderDetailResponseModel.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/16.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

//MARK:订单列表返回的Json数据
class OrderDetailResponseModel: Codable {
    
    var code : Int!
    var data : OrderDetailModel!
    var msg : String!
    
}

//MARK:返回的订单列表
class OrderDetailModel: Codable{
    
    var order : Order!
    
}
