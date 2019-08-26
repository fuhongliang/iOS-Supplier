//
//  DeliverGoodsDetailResponseModel.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/9.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

//商品拣货单Model
class DeliverGoodsDetailResponseModel : Codable {
    var code = Int()
    var msg = String()
    var data : DeliverGoodsDetailListModel!
}

class DeliverGoodsDetailListModel: Codable {
    var deliver : DeliverListModel!
    var goods_list : [GoodsListModel]!
}

class GoodsListModel: Codable {
    var num = Int()
    var pic = String()
    var attr : [Attr]!
    var name = String()
    var total_price = String()
    var goods_id = Int()
}

class DeliverListModel : Codable {
    var deliver_id = Int()
    var huodan_id = Int()
    var is_send = Int()
    var addtime = Int()
    var total_price = String()
    var num = Int()
    var goods_attr_count = Int()
    var share_id = Int()
    var name = String()
    var mobile = String()
    var district = String()
}
