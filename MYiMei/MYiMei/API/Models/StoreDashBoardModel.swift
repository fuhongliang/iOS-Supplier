//
//  StoreDashBoardModel.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/7/11.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

class StoreDashBoardModel: Codable {

    var code: Int?

    var msg: String?

    var data: StoreDashBoardResponeDataModel?

}


class StoreDashBoardResponeDataModel: Codable {
    var store: DashBoardModel?
}


class DashBoardModel: Codable {

    var sell_statistics_today: SellStatisticsTodayModel?
    var sell_statistics_yesterday: SellStatisticsTodayModel?
    var sell_statistics_sevendays: SellStatisticsTodayModel?
    var sell_statistics_thirtydays: SellStatisticsTodayModel?
    var sell_statistics_total: SellStatisticsTodayModel?

    var order_statistics: OrderStatisticsModel?
    var order_price_chart: OrderPriceChartModel?
}

class SellStatisticsTodayModel: Codable {

    var order_num = Int()

    var order_price = String()

}

class OrderStatisticsModel: Codable {

    var wait_pay_orders = Int()

     var wait_send_orders = Int()

    var refunding_orders = Int()

}

class OrderPriceChartModel: Codable {
    var today: OrderPriceChartTodayModel?
    var yesterday: OrderPriceChartTodayModel?
    var sevenday: OrderPriceChartTodayModel?
    var thirtyday: OrderPriceChartTodayModel?
}

class OrderPriceChartTodayModel: Codable {

    var time = [String]()

    var income = [String]()

}



