//
//  PickGoodsDetailResponseModel.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/7.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

//商品拣货单Model
class PickGoodsDetailResponseModel : Codable {
    var code = Int()
    var msg = String()
    var data : PickGoodsDetailListModel!
}

class PickGoodsDetailListModel: Codable {
    var goods_list : [PickGoodsDetailModel]!
}

class PickGoodsDetailModel: Codable {
    
    var id = Int()
    var is_pick = Int()
    var num = Int()
    var pic = String()
    var attr : [Attr]!
    var name = String()
    var total_price = String()
    var goods_id = Int()
    
}
