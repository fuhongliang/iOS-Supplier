//
//  DeliverGoodsResponseModel.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/9.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

//配货单Model
class DeliverGoodsResponseModel : Codable {
    var code = Int()
    var msg = String()
    var data : DeliverGoodsListModel!
}

class DeliverGoodsListModel: Codable {
    var list : [DeliverGoodsModel]?
}

class DeliverGoodsModel: Codable {
    
    var deliver_id = Int()//备货单ID
    var huodan_id = Int()//拣货单ID
    var is_send = Int()//0待发货 1已发货
    var addtime = Int()//添加时间
    var send_no = String()//配货单号
    var total_price = String()//合计价格
    var num = Int()//商品数量
    var goods_attr_count = Int()//商品分类数
    
    var share_id = Int()//团长ID
    
    var name = String()//团长名称
    var mobile = String()//手机号
    var district = String()//地址
    var goods_info : GoodsInfo!//商品信息
    
}

