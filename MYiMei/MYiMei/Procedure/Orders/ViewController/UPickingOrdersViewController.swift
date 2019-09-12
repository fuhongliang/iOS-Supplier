//
//  UPickingOrdersViewController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/6.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import SCLAlertView
import JXSegmentedView

class UPickingOrdersViewController : UBaseViewController {
    
    //TODO 拣货单接口
    private var service = APIOrderServices()
    
    private var pickList = PickGoodsListModel()
    
    let activity = UIActivityIndicatorView()
    var loadMoreView = UIView()
    
    /*
     订单类型:商品拣货单
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
        tw.register(cellType: UPickingOrdersCell.self)
        return tw
    }()
    
    override func configUI() {
//        configLoadMoreView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
        }
        refreshOrderData()
    }
    
    //MARK:网络请求-获取待处理订单列表数据
    func getOrderList(){
        loadMoreEnable = false
        if orderType == -1 {
            showHUDInView(text: "功能正加速开发中", inView: self.view)
            return
        }
        service.pickGoods({ (PickGoodsResponseModel) in
            if (self.pageRecord != 1) {
                self.pickList.pick_list?.append(contentsOf: PickGoodsResponseModel.data.pick_list ?? [])
            } else {
                self.pickList.pick_list = PickGoodsResponseModel.data.pick_list ?? []
                self.tableView.uHead.endRefreshing()
            }
            
            if(PickGoodsResponseModel.data.pick_list?.count ?? 0 >= 20){
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
            self.pickList.pick_list?.removeAll()
            self.tableView.uempty?.allowShow = true
            self.tableView.reloadData()
            showHUDInView(text: APIErrorModel.msg ?? "...", inView: self.view)
        }

    }
    
    @objc func refreshOrderData() {
        pageRecord = 1
        getOrderList()
    }
    
}

extension UPickingOrdersViewController : UITableViewDelegate, UITableViewDataSource {
    
    //MARK:cell组数
    func numberOfSections(in tableView: UITableView) -> Int {
        guard pickList.pick_list == nil else {
            return pickList.pick_list!.count
        }
        return 0
    }
    
    //MARK:cell高度
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        //订单商品数据展开时，需要动态获取高度再设置
//        return 285
//    }
    
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
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UPickingOrdersCell.self)

        cell.compeletPicking = {
            //TODO 完成拣货接口
            self.compeletePick(pickId: self.pickList.pick_list?[indexPath.section].huodan_id ?? -1)
        }
        
        cell.model = pickList.pick_list![indexPath.section]
        
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
        if (loadMoreEnable && section == pickList.pick_list!.count-1) {
            getOrderList()
        }
        
    }
    
    //MARK:点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let orderDetail = UPickintOrderDetailViewController()
        orderDetail.title = "订单详情"
        orderDetail.pickID = String(pickList.pick_list?[indexPath.section].huodan_id ?? 0)
        orderDetail.addTime = dateForMatter(timeString: pickList.pick_list?[indexPath.section].create_time ?? 0, join: " ")
        orderDetail.goodsCatNum = String(pickList.pick_list?[indexPath.section].goods_count ?? 0)
        orderDetail.goodsNum = String(pickList.pick_list?[indexPath.section].goods_num ?? 0)
        orderDetail.totalPrice = pickList.pick_list?[indexPath.section].total_pay_price ?? ""
        orderDetail.pickStatus = pickList.pick_list?[indexPath.section].pick_status ?? 1
        if (navigationController == nil) {
            let appDelegate  = UIApplication.shared.delegate as! AppDelegate
            let tabBarController = appDelegate.window!.rootViewController as! UTabBarController
            tabBarController.classVC.navigationController?.pushViewController(orderDetail, animated: true)
            return
        }
        navigationController?.pushViewController(orderDetail, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if (pickList.pick_list!.count != 1 && section == pickList.pick_list!.count-1){
            return 35
        }
        return 16
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if (pickList.pick_list!.count != 1 && section == pickList.pick_list!.count-1){
            return loadMoreView
        }
        return nil
    }
    
    //MARK:完成拣货接口
    func compeletePick(pickId:Int) {
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
            self.service.setPick(huodanId:pickId, {
                showHUDInView(text: "拣货成功", inView: self.view)
                self.refreshOrderData()
            }, { (APIErrorModel) in
                print(APIErrorModel.msg ?? "........")
            })
        }
        
//        let subview = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 203))
//
//        alert.customSubview = subview
        
        let attr = "是否确认完成拣货?"
        alert.showCustom(attr, subTitle: "", color: UIColor.white, icon: UIImage(), animationStyle: .noAnimation)
    }
    
//    func configLoadMoreView() {
//        loadMoreView.frame = CGRect(x:0, y:self.tableView.contentSize.height, width:self.tableView.bounds.size.width, height:45)
//        loadMoreView.backgroundColor = UIColor.background
//        loadMoreView.autoresizingMask = UIView.AutoresizingMask.flexibleWidth
//        //添加环形进度条
//        activity.color = UIColor.black
//        activity.startAnimating()
//
//        loadMoreView.addSubview(activity)
//        activity.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.centerY.centerX.equalToSuperview()
//        }
//        activity.hidesWhenStopped = true
//    }
    
}

extension UPickingOrdersViewController  : JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}
