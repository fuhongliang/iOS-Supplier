//
//  UHomeController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/24.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import Charts

class UHomeController: UBaseViewController {
    
    var mHomeView = UHomeView()
    
    fileprivate let service = APIStoreServices()
    fileprivate let storeService = APIUserServices()
    
    var storeData = StoreDashBoardResponeDataModel()
    
    var depostPass = false
    
    var depostReview = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mHomeView.delegate = self
        getStoreData()
        getStoreInfo()
        getStoreDepost()
    }
    
    override func configUI() {
        mHomeView.setView()
        view.addSubview(mHomeView)
        mHomeView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: 销售数据分段控制器的点击事件
    @IBAction func changeSalesData(_ sender: UISegmentedControl) {
        if storeData.store == nil {
            return
        }
        switch sender.selectedSegmentIndex {
        case 0:
            self.mHomeView.payOrderNumberLaber.text = String(storeData.store?.sell_statistics_total?.order_num ?? 0)
            self.mHomeView.payAmountNumberLaber.text = storeData.store?.sell_statistics_total?.order_price ?? "0"
        case 1:
            self.mHomeView.payOrderNumberLaber.text = String(storeData.store?.sell_statistics_today?.order_num ?? 0)
            self.mHomeView.payAmountNumberLaber.text = storeData.store?.sell_statistics_today?.order_price ?? "0"
        case 2:
            self.mHomeView.payOrderNumberLaber.text = String(storeData.store?.sell_statistics_yesterday?.order_num ?? 0)
            self.mHomeView.payAmountNumberLaber.text = storeData.store?.sell_statistics_yesterday?.order_price ?? "0"
        case 3:
            self.mHomeView.payOrderNumberLaber.text = String(storeData.store?.sell_statistics_sevendays?.order_num ?? 0)
            self.mHomeView.payAmountNumberLaber.text = storeData.store?.sell_statistics_sevendays?.order_price ?? "0"
        case 4:
            self.mHomeView.payOrderNumberLaber.text = String(storeData.store?.sell_statistics_thirtydays?.order_num ?? 0)
            self.mHomeView.payAmountNumberLaber.text = storeData.store?.sell_statistics_thirtydays?.order_price ?? "0"
        default:
            break
        }
    }
    
    /*
     MARK:处理表格数据的数组
     先转换成Double类型的数组
     再把数组中最小负值置为0 并把所有值都加上最小负值的绝对值
     */
    func dealWithChartArray(index: Int) -> [Double] {
        var icome:[Double] = []
        if index == 0 {
            icome = stringArrayConvertDoubleArray(stringArray: storeData.store?.order_price_chart?.today?.income ?? [])
        } else if index == 1 {
            icome = stringArrayConvertDoubleArray(stringArray: storeData.store?.order_price_chart?.yesterday?.income ?? [])
        } else if index == 2 {
            icome = stringArrayConvertDoubleArray(stringArray: storeData.store?.order_price_chart?.sevenday?.income ?? [])
        } else if index == 3 {
            icome = stringArrayConvertDoubleArray(stringArray: storeData.store?.order_price_chart?.thirtyday?.income ?? [])
        }
        let minValue:Double = icome.min() ?? 0
        if minValue<0 {
            for index in 0..<icome.count {
                icome[index] += abs(minValue)
            }
        }
        return icome
    }
    
    // MARK: 图表分段控制器的点击事件
    @IBAction func changeChartsData(_ sender: UISegmentedControl) {
        if storeData.store == nil {
            return
        }
        switch sender.selectedSegmentIndex {
        case 0:
            
            let todayIcome = dealWithChartArray(index: 0)
            
            setChatsData(chartLine: storeData.store?.order_price_chart?.today?.income ?? [])
            configCharts(xValues: storeData.store?.order_price_chart?.today?.time ?? [], yAxisMaximum: todayIcome.max() ?? 0, yAxisMinimum: todayIcome.min() ?? 0)
        case 1:
            let yesterdayIcome = dealWithChartArray(index: 1)
            
            setChatsData(chartLine: storeData.store?.order_price_chart?.yesterday?.income ?? [])
            configCharts(xValues: storeData.store?.order_price_chart?.yesterday?.time ?? [], yAxisMaximum: yesterdayIcome.max() ?? 0, yAxisMinimum: yesterdayIcome.min() ?? 0)
        case 2:
            let sevenIcome = dealWithChartArray(index: 2)
            
            setChatsData(chartLine: storeData.store?.order_price_chart?.sevenday?.income ?? [])
            configCharts(xValues: storeData.store?.order_price_chart?.sevenday?.time ?? [], yAxisMaximum: sevenIcome.max() ?? 0, yAxisMinimum: sevenIcome.min() ?? 0)
        case 3:
            let thirtyIcome = dealWithChartArray(index: 3)
            
            setChatsData(chartLine: storeData.store?.order_price_chart?.thirtyday?.income ?? [])
            configCharts(xValues: storeData.store?.order_price_chart?.thirtyday?.time ?? [], yAxisMaximum: thirtyIcome.max() ?? 0, yAxisMinimum: thirtyIcome.min() ?? 0)
        default:
            break
        }
    }
    
    /*
     MARK:设置折线图的样式和x,y轴的样式
     xValues:横向的单位
     yAxisMaximum:纵向的最大刻度
     */
    func configCharts(xValues:[String],yAxisMaximum:Double,yAxisMinimum: Double){
        mHomeView.chartView.delegate = self
        
        //折线图无数据时显示的提示文字
        mHomeView.chartView.noDataText = "暂无营业数据"
        mHomeView.chartView.doubleTapToZoomEnabled = false //双击缩放
        mHomeView.chartView.xAxis.labelPosition = .bottom //x轴单位显示在下方
        mHomeView.chartView.xAxis.axisLineColor = UIColor.hex(hexString: "#F2F2F2") //x轴颜色
        
        //-----动态设置点
        mHomeView.chartView.xAxis.axisMinimum = 0 //最小刻度值 x轴
        mHomeView.chartView.xAxis.axisMaximum = Double(xValues.count-1) //最大刻度值
        mHomeView.chartView.xAxis.granularity = 1 //最小间隔
        mHomeView.chartView.xAxis.gridColor = UIColor.hex(hexString: "#F2F2F2") //x轴对应网格线的颜色
        
        mHomeView.chartView.leftAxis.axisMinimum = 0 //最小刻度值 y轴
        mHomeView.chartView.leftAxis.axisMaximum = yAxisMaximum + 2000 //最大刻度值
        mHomeView.chartView.leftAxis.granularity = (abs(yAxisMinimum) + abs(yAxisMaximum)) / 10 //最小间隔
        
        var values = xValues
        //自定义刻度标签文字
        if values.count > 28 {
            for index in 0..<values.count {
                if index % 5 != 0 {
                    values[index] = ""
                }
            }
        }
        mHomeView.chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: values)
        mHomeView.chartView.xAxis.labelCount = xValues.count
//        mHomeView.chartView.xAxis.forceLabelsEnabled = true
        mHomeView.chartView.xAxis.granularityEnabled = true
        //----动态设置点
        
        mHomeView.chartView.xAxis.labelTextColor = UIColor.hex(hexString: "#999999") //刻度文字颜色
        mHomeView.chartView.xAxis.labelFont = .systemFont(ofSize: 9) //刻度文字大小
        
        mHomeView.chartView.xAxis.drawGridLinesEnabled = false //不绘制纵向的网格线
        mHomeView.chartView.rightAxis.enabled = false //禁用右侧的Y轴
//        mHomeView.chartView.leftAxis.enabled = false
        mHomeView.chartView.leftAxis.drawAxisLineEnabled = false
        
        mHomeView.chartView.leftAxis.gridColor = UIColor.hex(hexString: "#F2F2F2") //左Y轴对应网格线的颜色
        mHomeView.chartView.leftAxis.gridLineWidth = 1 //右Y轴对应网格线的大小
        
        //播放y轴方向动画，持续时间1秒
        mHomeView.chartView.animate(yAxisDuration: 1)
        
    }
    
    //MARK:设置图表的数据
    func setChatsData(chartLine:[String]) {
        //生成随机数据
        var dataEntries = [ChartDataEntry]()
        for i in 0..<chartLine.count {
            let entry = ChartDataEntry.init(x: Double(i), y: Double(chartLine[i] ) as! Double)
            dataEntries.append(entry)
        }
        //数据作为1根折线里的所有数据
        let chartDataSet = LineChartDataSet(entries: dataEntries, label: "营业额")
        chartDataSet.colors = [UIColor.hex(hexString: "#1C98F6")]//线的颜色
        chartDataSet.drawCirclesEnabled = false //不绘制转折点
        chartDataSet.mode = .linear  //贝塞尔曲线
//        chartDataSet.valueColors = [UIColor.hex(hexString: "#1C98F6")] //拐点上的文字颜色
//        chartDataSet.valueFont = .systemFont(ofSize: 9) //拐点上的文字大小
        chartDataSet.drawValuesEnabled = false //不绘制拐点上的文字
        
        chartDataSet.drawFilledEnabled = true //开启填充色绘制
        let gradientColors = [UIColor.hex(hexString: "#2BC1FF").cgColor, UIColor.white.cgColor] as CFArray //渐变颜色数组
        let colorLocations:[CGFloat] = [1.0, 0.0] //每组颜色所在位置（范围0~1)
        let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(),colors: gradientColors, locations: colorLocations) //生成渐变色
        chartDataSet.fill = Fill.fillWithLinearGradient(gradient!, angle: 90) //将渐变色作为填充对象
        chartDataSet.highlightEnabled = false  //不启用十字线
        
        //目前折线图只包括1根折线
        let chartData = LineChartData(dataSets: [chartDataSet])
        
        //设置折现图数据
        mHomeView.chartView.data = chartData
    }
    
    //MARK:获取店铺经营数据
    func getStoreData() {
        self.service.getStoreOperateData({ (StoreDashBoardModel) in
            self.storeData = StoreDashBoardModel.data!
            if(self.storeData.store != nil){
                
                self.mHomeView.pendingPayNumberLaber.text = String(self.storeData.store?.order_statistics?.wait_pay_orders ?? 0)
                self.mHomeView.wiatDeliveryNumberLaber.text = String(self.storeData.store?.order_statistics?.wait_send_orders ?? 0)
                self.mHomeView.activistOrderNumberLaber.text = String(self.storeData.store?.order_statistics?.refunding_orders ?? 0)
                
                //设置图表的初始数据
                self.mHomeView.paySegmentedControl.selectedSegmentIndex = 0
                let todayIcome = self.dealWithChartArray(index: 0)
                self.setChatsData(chartLine: self.storeData.store?.order_price_chart?.today?.income ?? [])
                self.configCharts(xValues: self.storeData.store?.order_price_chart?.today?.time ?? [], yAxisMaximum: todayIcome.max() ?? 0, yAxisMinimum: todayIcome.min() ?? 0)
                
                //设置销售的初始数据
                self.mHomeView.salesSegmentedControl.selectedSegmentIndex = 0
                self.mHomeView.payOrderNumberLaber.text = String(self.storeData.store?.sell_statistics_total?.order_num ?? 0)
                self.mHomeView.payAmountNumberLaber.text = self.storeData.store?.sell_statistics_total?.order_price ?? "0"
            }
            
        }) { (APIErrorModel) in
            showHUDInView(text: String(APIErrorModel.msg ?? ""), inView: self.view)
        }
    }
    
    //MARK:获取店铺信息
    func getStoreInfo(){
        self.storeService.storeInfo({ (StoreInfoModel) in
            let url = URL(string: StoreInfoModel.data.mch?.logo ?? "")
            self.mHomeView.storeAvatarIcon.kf.setImage(with: url)
            self.mHomeView.storeNameLaber.text = StoreInfoModel.data.mch?.name
        }) { (APIErrorModel) in
            
        }
    }
    
    //MARK:获取店铺保证金
    func getStoreDepost() {
        service.getStoreDepostData({ (StoreDepostReponseModel) in
            if(StoreDepostReponseModel.data?.pass?.count ?? 0>0){
                self.depostPass = true
            }else{
                self.depostPass = false
            }
            if(StoreDepostReponseModel.data?.review?.count ?? 0>0){
                self.depostReview = true
            }else{
                self.depostReview = false
            }
            
            self.mHomeView.depost.menuIcon.image = UIImage.init(named: self.depostPass ? "menu_margin" : "depost_empty")

            
        }, { (APIErrorModel) in
            showHUDInView(text: APIErrorModel.msg ?? "网络错误", inView: self.view)
        })
    }
    
    func setHomeData(data:StoreDashBoardResponeDataModel) {
        //订单量/收入
        self.mHomeView.payOrderNumberLaber.text = String(data.store?.sell_statistics_today?.order_num ?? 0)
        self.mHomeView.payAmountNumberLaber.text = data.store?.sell_statistics_today?.order_price ?? "0"
        
        //订单类型数
        self.mHomeView.pendingPayNumberLaber.text = String(data.store?.order_statistics?.wait_pay_orders ?? 0)
        self.mHomeView.wiatDeliveryNumberLaber.text = String(data.store?.order_statistics?.wait_send_orders ?? 0)
        self.mHomeView.activistOrderNumberLaber.text = String(data.store?.order_statistics?.refunding_orders ?? 0)
        
    }
    
    //显示MarkerView标签
    func showMarkerView(value:String){
        //使用气泡状的标签
        let marker = BalloonMarker(color: UIColor(white: 180/255, alpha: 1),
                                   font: .systemFont(ofSize: 12),
                                   textColor: .white,
                                   insets: UIEdgeInsets(top: 8, left: 8, bottom: 20, right: 8))
        marker.chartView = self.mHomeView.chartView
        marker.minimumSize = CGSize(width: 80, height: 40)
        marker.setLabel("数据：\(value)")
        self.mHomeView.chartView.marker = marker
    }
    
    
    //MARK:跳转保证金协议
    func goToDepositAgreement(){
        if(depostPass){
            let vc = UMyDepostController()
            vc.title = "我的保证金"
            self.navigationController?.pushViewController(vc, animated: true)
        }else if(depostReview){
            let vc = UMyDepostController()
            vc.title = "我的保证金"
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            //未交保证金时跳转
            let vc = UDepositAgreementController()
            vc.title = "保证金协议"
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
extension UHomeController: ChartViewDelegate,UHomeViewDelegate {
    
    func tapPayControl(sender: UISegmentedControl) {
        changeChartsData(_ : sender)
    }
    
    func tapSalesControl(sender: UISegmentedControl) {
        changeSalesData(_ : sender)
    }
    
    func tapMessageManager() {
        let vc = UMessageManagerController()
        vc.title = "消息管理"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tapCommentsManager() {
        //评论管理
        let vc = UCommentController()
        vc.title = "评价管理"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tapShopSetting() {
        let vc = USetUpShopController()
        vc.title = "店铺设置"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tapFinancialOver() {
//        showHUDInView(text: "此功能正在开发中", inView: self.view)
        let vc = UHomeFinancialSettlementController()
        vc.title = "财务结算"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tapDepost() {
        self.goToDepositAgreement()
    }
    
    
    //折线上的点选中回调
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        self.showMarkerView(value: "")
    }
    
}
