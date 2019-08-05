//
//  ShopSettingModel.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/8.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

//MARK:店铺设置返回的Json数据
class ShopSettingModel: Codable {
    
    var code: Int?
    
    var msg: String?
    
    var data: MchInfoModel?
    
}

//MARK:返回的店铺data对象
class MchInfoModel: Codable {
    var mch: ShopInfoModel?
}

// MARK:返回店铺对象
class ShopInfoModel: Codable {
    var name: String?
    
    var cat_name: String?
    
    var logo: String?
    
    var province_id: Int?
    
    var city_id: Int?
    
    var district_id: Int?
    
    var realname: String?
    
    var tel: String?
    
    var service_tel: String?
    
    var header_bg: String?
    
    var address: String?
    
    var region: String?
    
}
