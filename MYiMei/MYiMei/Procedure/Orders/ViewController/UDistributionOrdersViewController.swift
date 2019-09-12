//
//  UDistributionOrdersViewController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/6.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import SCLAlertView
import JXSegmentedView

class UDistributionOrdersViewController : UBaseViewController {
    
    //TODO 配货单接口
    private var service = APIOrderServices()
    
    private var orderList = DeliverGoodsListModel()
    
    let activity = UIActivityIndicatorView()
    var loadMoreView = UIView()
    
    /*
     订单类型:配货单
     */
    var orderType = 1
    
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
        
        tw.estimatedRowHeight = 200
        tw.rowHeight = UITableView.automaticDimension
        
        tw.uempty = UEmptyView { [weak self] in self?.refreshOrderData() }
        tw.uHead = URefreshHeader{ [weak self] in self?.refreshOrderData() }
        tw.register(cellType: UDistributionOrdersCell.self)
        return tw
    }()
    
    override func configUI() {
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
        service.deliverGoods({ (DeliverGoodsResponseModel) in
//            if (self.pageRecord != 1) {
//                self.orderList.order.append(contentsOf: OrderListResponseModel.data.order)
//            } else {
                self.orderList = DeliverGoodsResponseModel.data
                self.tableView.uHead.endRefreshing()
//            }
            
//            if(OrderListResponseModel.data.order.count >= 20){
//                self.loadMoreEnable = true
//            } else {
//                self.loadMoreEnable = false
//                self.activity.stopAnimating()
//            }
            
            self.tableView.uempty?.allowShow = true
            self.tableView.reloadData()
//            self.pageRecord += 1
        }, { (APIErrorModel) in
            self.tableView.uHead.endRefreshing()
            NSLog(APIErrorModel.msg ?? "...")
        })
    }
    
    
    //MARK:打电话给客户
    func callTheClient(index:Int){
        let alertController = UIAlertController(title: "温馨提示", message: "是否拨打客户联系电话？", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "确定", style: UIAlertAction.Style.default) {
            (action: UIAlertAction!) -> Void in
            
            let phone = "telprompt://\(self.orderList.list?[index].mobile ?? "")"
            
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

extension UDistributionOrdersViewController : UITableViewDelegate, UITableViewDataSource {
    
    //MARK:cell组数
    func numberOfSections(in tableView: UITableView) -> Int {
        guard orderList.list == nil else {
            return orderList.list!.count
        }
        return 0
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
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UDistributionOrdersCell.self)
        
        cell.callTheClient = {
            MYiMei.callTheClient(phoneNumber: self.orderList.list?[indexPath.section].mobile ?? "")
//            self.callTheClient(index: indexPath.section)
        }
        
        cell.compeletDistribution = {
            //TODO 完成配货接口
            self.compeleteSend(deliverId: self.orderList.list?[indexPath.section].deliver_id ?? -1)
        }
        
        cell.model = orderList.list?[indexPath.section]
        
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
        
    }
    
    //MARK:点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let orderDetail = UDistributionOrdersDetailViewController()
        orderDetail.title = "配货单详情"
        orderDetail.deliverId = orderList.list?[indexPath.section].deliver_id ?? 0

        if (navigationController == nil){
            let appDelegate  = UIApplication.shared.delegate as! AppDelegate
            let tabBarController = appDelegate.window!.rootViewController as! UTabBarController
            tabBarController.classVC.navigationController?.pushViewController(orderDetail, animated: true)
            return
        }
        navigationController?.pushViewController(orderDetail, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

        return 16
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        return nil
    }
    
    //MARK:完成拣货接口
    func compeleteSend(deliverId:Int) {
        let style = SCLAlertView.SCLAppearance(
            kWindowWidth: 300, kTitleFont: UIFont(name: "HelveticaNeue", size: 18)!,
            kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
            kButtonFont: UIFont(name: "HelveticaNeue", size: 18)!,
            showCloseButton: false,
            showCircularIcon: false,
            hideWhenBackgroundViewIsTapped:true,
            buttonsLayout: .horizontal
        )
        
        let alert = SCLAlertView(appearance: style)
        
        alert.addButton("取消",textColor:UIColor.black) {
            print("取消")
        }
        alert.addButton("确定",textColor:UIColor.hex(hexString: "#1C98F6")) {
            self.service.setDeliver(deliverId: deliverId, {
                showHUDInView(text: "配货成功", inView: self.view)
                self.refreshOrderData()
            }, { (APIErrorModel) in
                print(APIErrorModel.msg ?? ".........")
            })
        }
        
        let attr = "是否确认完成配货?"
        alert.showCustom(attr, subTitle: "", color: UIColor.white, icon: UIImage(), animationStyle: .noAnimation)
    }

}

extension UDistributionOrdersViewController  : JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}
