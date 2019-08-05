//
//  MchApplyModel.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/7/10.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

class MchApplyModel: Codable {
    var username: String?

    var password: String?

    var tel: String?

    var realname: String?

    var name: String?

    var province: String?

    var city: String?

    var district: String?

    var address: String?

    var mch_common_cat_id: String?

    var service_tel: String?

    var logo: String?

    var header_bg: String?

    var longitude: String?

    var latitude: String?

    var business_license: String?
}

// MARK:地址
class LocationInfo: Codable {
    var province: String?

    var city: String?

    var district: String?

    var addresss: String?

    var longitude: String?

    var latitude: String?
}

