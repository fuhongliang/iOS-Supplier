//
//  GoodsDetailModel.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/27.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

// MARK:商品对象
class GoodsDetailModel: Codable {
    var mch_id: Int?

    var access_token: String?

    var name: String?

    var detail: String?

    var cover_pic: String?

    var goods_pic: String?

    var pt_cat_id:Int?

    var goods_cat_id:Int?

    var unit:String?

    var virtual_sales:Int?

    var weight:Int?

    var original_price:Double?

    var price:Double?

    var pieces:String?

    var forehead:String?

    var service:String?

    var goods_num:Int?

}
