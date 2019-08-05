//
//  UOrdersNotReceiptController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/20.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import SCLAlertView
import JXSegmentedView

class UOrdersNotReceiptController: UBaseViewController {
    
    fileprivate var service = APIOrderServices()
    
    private var orderList = OrderList()
    
    let activity = UIActivityIndicatorView()
    var loadMoreView = UIView()
    
    /*
     订单类型:通过orderType来判断哪一种类型的订单
     */
    var orderType = 2
    
    var mOrderId = 0
    
    //用了记录当前是否允许加载新数据（加载的时候会将其设为false，防止重复加载）
    var loadMoreEnable = true
    //记录当前加载到哪一页
    var pageRecord = 1
    
    lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .grouped)
        tw.backgroundColor = UIColor.background
        tw.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        tw.separatorStyle = UITableViewCell.SeparatorStyle.none
        tw.showsVerticalScrollIndicator = false
        tw.delegate = self
        tw.dataSource = self
//        tw.register(cellType: UOderCell.self)
        tw.uempty = UEmptyView { [weak self] in self?.refreshOrderData() }
        tw.uHead = URefreshHeader{ [weak self] in self?.refreshOrderData() }
        tw.register(cellType: UOrderNotReceiptCell.self)
        return tw
    }()
    
    override func configUI() {
     
        configLoadMoreView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshOrderData()
    }
    
    
    //MARK:网络请求-获取待处理订单列表数据
    func getOrderList(){
        loadMoreEnable = false
        if orderType == -1 {
            showHUDInView(text: "功能正加速开发中", inView: self.view)
            return
        }
        service.getOrderList(status: orderType, page: pageRecord, { (OrderListResponseModel) in
            if (self.pageRecord != 1) {
                self.orderList.order.append(contentsOf: OrderListResponseModel.data.order)
            } else {
                self.orderList = OrderListResponseModel.data
                self.tableView.uHead.endRefreshing()
            }
            
            if(OrderListResponseModel.data.order.count >= 20){
                self.loadMoreEnable = true
            } else {
                self.loadMoreEnable = false
                self.activity.stopAnimating()
            }
            
            self.tableView.uempty?.allowShow = true
            self.tableView.reloadData()
            self.pageRecord += 1
            
        }) { (APIErrorModel) in
            self.tableView.uHead.endRefreshing()
            NSLog(APIErrorModel.msg ?? "...")
        }
    }

    //MARK:打电话给客户
    func callTheClient(index:Int){
        let alertController = UIAlertController(title: "温馨提示", message: "是否拨打客户联系电话？", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "确定", style: UIAlertAction.Style.default) {
            (action: UIAlertAction!) -> Void in
            
            let phone = "telprompt://\(self.orderList.order[index].mobile ?? "")"
            
            if UIApplication.shared.canOpenURL(URL(string: phone)!) {
                UIApplication.shared.openURL(URL(string: phone)!)
            }
        }
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func refreshOrderData() {
        pageRecord = 1
        getOrderList()
    }
    
}

extension UOrdersNotReceiptController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK:cell组数
    func numberOfSections(in tableView: UITableView) -> Int {
        guard orderList.order == nil else {
            return orderList.order.count
        }
        return 0
    }
    
    //MARK:cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //订单商品数据展开时，需要动态获取高度再设置
        return 285
    }
    
    //MARK:每组cell的数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //MARK:cell数量
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return section == 0 ? 16 : CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    //MARK:返回每个cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UOrderNotReceiptCell.self)
        
        cell.callTheClient = {
            self.callTheClient(index: indexPath.section)
        }
        
        cell.modifyPriceOrDeliveryGoods = {
            // 0 待付款  1待发货 2待收货 3已完成 5已取消
            let vc = USettingDeliveryController()
            vc.title = "修改快递信息"
            vc.orderId = self.orderList.order[indexPath.section].order_id
            vc.refreshOrderData = {
                self.refreshOrderData()
            }
            if (self.navigationController == nil){
                let appDelegate  = UIApplication.shared.delegate as! AppDelegate
                let tabBarController = appDelegate.window!.rootViewController as! UTabBarController
                tabBarController.classVC.navigationController?.pushViewController(vc, animated: true)
                return
            }
            self.navigationController?.pushViewController(vc, animated: true)
           
        }
        
        cell.moveToRecycleBin = {
            showHUDInView(text: "此功能正在开发中", inView: self.view)
        }
        
        cell.model = orderList.order[indexPath.section]
        
        return cell
        
    }
    
    //MARK:每个cell即将显示时回调  在这里处理section的圆角
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let cornerRadius: CGFloat = 6.0
        cell.backgroundColor = UIColor.clear
        
        let layer = CAShapeLayer()
        let backgroundLayer = CAShapeLayer()
        let pathRef = CGMutablePath()
        let bounds = cell.bounds;
        
        pathRef.addRoundedRect(in: bounds, cornerWidth: cornerRadius, cornerHeight: cornerRadius)
        
        layer.path = pathRef
        backgroundLayer.path = pathRef
        layer.fillColor = UIColor.white.cgColor
        
        let roundView = UIView(frame: bounds)
        roundView.layer.insertSublayer(layer, at: 0)
        roundView.backgroundColor = UIColor.clear
        cell.backgroundView = roundView
        
    }
    
    //MARK:footerView即将显示的时候的回调
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        
        //当下拉到底部，执行loadMore()
        if (loadMoreEnable && section == orderList.order.count-1) {
            getOrderList()
        }
        
    }
    
    //MARK:点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let orderDetail = UOrderDetailsViewController()
        orderDetail.title = "订单详情"
        orderDetail.orderStatus = orderList.order[indexPath.section].order_status
        orderDetail.orderId = orderList.order[indexPath.section].order_id
        if (navigationController == nil){
            let appDelegate  = UIApplication.shared.delegate as! AppDelegate
            let tabBarController = appDelegate.window!.rootViewController as! UTabBarController
            tabBarController.classVC.navigationController?.pushViewController(orderDetail, animated: true)
            return
        }
        navigationController?.pushViewController(orderDetail, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if (orderList.order.count != 1 && section == orderList.order.count-1){
            return 35
        }
        return 16
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if (orderList.order.count != 1 && section == orderList.order.count-1){
            return loadMoreView
        }
        return nil
    }
    
    func configLoadMoreView() {
        loadMoreView.frame = CGRect(x:0, y:self.tableView.contentSize.height, width:self.tableView.bounds.size.width, height:45)
        loadMoreView.backgroundColor = UIColor.background
        loadMoreView.autoresizingMask = UIView.AutoresizingMask.flexibleWidth
        //添加环形进度条
        activity.color = UIColor.black
        activity.startAnimating()
        
        loadMoreView.addSubview(activity)
        activity.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.centerX.equalToSuperview()
        }
        activity.hidesWhenStopped = true
    }
    
}

extension UOrdersNotReceiptController : JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}
