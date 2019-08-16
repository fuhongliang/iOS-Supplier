//
//  PickGoodsResponseModel.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/6.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

//商品拣货单Model
class PickGoodsResponseModel : Codable {
    var code = Int()
    var msg = String()
    var data : PickGoodsListModel!
}

class PickGoodsListModel: Codable {
    var pick_list : [PickGoodsModel]?
}

class PickGoodsModel: Codable {
    
    var total_pay_price = String()
    var huodan_id = Int()
    var goods_num = Int()
    var goods_count = Int()
    var create_time = Int()
    var pick_status = Int()
    var goods_info : GoodsInfo!
    
}

class GoodsInfo : Codable {
    var num = Int()
    var pic = String()
    var name = String()
    var total_price = String()
    var attr : [Attr]!
}

