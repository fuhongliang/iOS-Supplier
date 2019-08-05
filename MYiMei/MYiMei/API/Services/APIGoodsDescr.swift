//
//  APIGoodsDescr.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/7/24.
//  Copyright © 2019 符宏梁. All rights reserved.
//
import Foundation

public func saveGoodsDescr(goodsDescr: String) {
    UserDefaults.standard.set(goodsDescr, forKey: "API_GOODSDESCR")
}

public func cleanGoodsDescr() {
    UserDefaults.standard.set("", forKey: "API_GOODSDESCR")
}

public func getGoodsDescr() -> String {
    if let goodsDescr = UserDefaults.standard.object(forKey: "API_GOODSDESCR") as? String {
        if goodsDescr.count > 0 {
            print(" goodsDescr--- \(goodsDescr)")
            return goodsDescr
        }
    }
    return ""
}
