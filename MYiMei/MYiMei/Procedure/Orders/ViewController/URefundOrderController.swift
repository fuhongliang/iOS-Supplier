//
//  URefundOrderController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/30.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import SCLAlertView
import JXSegmentedView

class URefundOrderController : UBaseViewController {
    
    fileprivate var service = APIOrderServices()
    
    private var orderList = RefundOrderListModel()
    
    let activity = UIActivityIndicatorView()
    var loadMoreView = UIView()
    
    /*
     订单类型:通过orderType来判断哪一种类型的订单
     0->全部 1->待处理 2->已处理
     */
    var orderType = 0
    
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
        
        tw.uempty = UEmptyView { [weak self] in self?.getOrderList() }
        tw.uHead = URefreshHeader{ [weak self] in self?.refreshOrderData() }
        tw.register(cellType: URefundOrderUntreatedCell.self)
        return tw
    }()
    
    override func configUI() {
        configLoadMoreView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
        }
//        getOrderList()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshOrderData()
    }
    
    //MARK:网络请求-获取待处理订单列表数据
    func getOrderList(){
        loadMoreEnable = false
        
        service.getRefundOrderList(page: pageRecord, refundStatus: orderType, { (RefundOrderResponseModel) in
            if (self.pageRecord != 1) {
                self.orderList.refund_order.append(contentsOf: RefundOrderResponseModel.data.refund_order)
            } else {
                self.orderList.refund_order = RefundOrderResponseModel.data.refund_order
                self.tableView.uHead.endRefreshing()
            }
            
            if(RefundOrderResponseModel.data.refund_order.count >= 20){
                self.loadMoreEnable = true
            } else {
                self.loadMoreEnable = false
                self.activity.stopAnimating()
            }
            
            self.tableView.uempty?.allowShow = true
            self.tableView.reloadData()
            self.pageRecord += 1
        }, { (APIErrorModel) in
            self.tableView.uHead.endRefreshing()
            NSLog(APIErrorModel.msg ?? "...")
        })
    }
    
    //MARK:网络请求-同意售后处理
    func confirmDealWith(refundAmount:String,refundOrderId:Int){
        //TODO 同意处理的接口
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
            self.service.handleRefundOrder(refundOrderId: refundOrderId, option: 1, refuseDesc: "", {
                showHUDInView(text: "退款成功", inView: self.view)
            }, { (APIErrorModel) in
                self.tipRefundAmountFailure()
            })
        }
        
        let subview = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 203))
        
        alert.customSubview = subview
        
        let attr = "确认通过后退款金额将直接返还给用户！"
        alert.showCustom("确认同意退款", subTitle: attr, color: UIColor.white, icon: UIImage(), animationStyle: .noAnimation)
    }
    
    //MARK:网络请求-拒绝售后处理
    func refusedDealWith(refundAmount:String,refundOrderId:Int){
        //TODO 拒绝处理的接口
        let style = SCLAlertView.SCLAppearance(
            kWindowWidth: 300, kTitleFont: UIFont(name: "HelveticaNeue-Bold", size: 20)!,
            kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
            kButtonFont: UIFont(name: "HelveticaNeue", size: 18)!,
            showCloseButton: false,
            showCircularIcon: false,
            hideWhenBackgroundViewIsTapped:true,
            buttonsLayout: .horizontal
        )
        
        //TODO 拒绝理由
        let alert = SCLAlertView(appearance: style)
        alert.addButton("取消",textColor:UIColor.black) {
            print("取消")
        }
        alert.addButton("确定",textColor:UIColor.hex(hexString: "#1C98F6")) {
            self.service.handleRefundOrder(refundOrderId: refundOrderId, option: 0, refuseDesc: "", {
                showHUDInView(text: "拒绝成功", inView: self.view)
            }, { (APIErrorModel) in
                showHUDInView(text: "拒绝失败", inView: self.view)
            })
        }
        let attr = "确认拒绝该退货退款申请？"
        alert.showCustom("温馨提示", subTitle: attr, color: UIColor.white, icon: UIImage(),animationStyle: .noAnimation)
    }
    
    //MARK:提示退款失败
    func tipRefundAmountFailure(){
        let style = SCLAlertView.SCLAppearance(
            kWindowWidth: 300, kTitleFont: UIFont(name: "HelveticaNeue-Bold", size: 20)!,
            kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
            kButtonFont: UIFont(name: "HelveticaNeue", size: 18)!,
            showCloseButton: false,
            showCircularIcon: false,
            hideWhenBackgroundViewIsTapped:true,
            buttonsLayout: .horizontal
        )
        
        
        let alert = SCLAlertView(appearance: style)
        alert.addButton("知道了",textColor:UIColor.hex(hexString: "#1C98F6")) {}
        let attr = "退款失败，账户余额不足，请充值"
        alert.showCustom("温馨提示", subTitle: attr, color: UIColor.white, icon: UIImage(),animationStyle: .noAnimation)
        
    }
    
    //MARK:打电话给客户
    func callTheClient(index:Int){
        let alertController = UIAlertController(title: "温馨提示", message: "是否拨打客户联系电话？", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "确定", style: UIAlertAction.Style.default) {
            (action: UIAlertAction!) -> Void in
            
            let phone = "telprompt://\(self.orderList.refund_order[index].mobile )"
            
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

extension URefundOrderController : UITableViewDelegate, UITableViewDataSource {
    
    //MARK:cell组数
    func numberOfSections(in tableView: UITableView) -> Int {
        guard orderList.refund_order == nil else {
            return orderList.refund_order.count
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
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: URefundOrderUntreatedCell.self)
        //打电话给用户
        cell.callTheClient = {
            self.callTheClient(index: indexPath.section)
        }
        //同意处理
        cell.confirmDealWith = {
            self.confirmDealWith(refundAmount: self.orderList.refund_order[indexPath.section].refund_price, refundOrderId: self.orderList.refund_order[indexPath.section].order_refund_id)
        }
        //拒绝处理
        cell.refusedDealWith = {
            self.refusedDealWith(refundAmount: self.orderList.refund_order[indexPath.section].refund_price, refundOrderId: self.orderList.refund_order[indexPath.section].order_refund_id)
        }
        
        //重新加载单元格数据
        cell.model = orderList.refund_order[indexPath.section]
        
        return cell
        
    }
    
    //MARK:每个cell即将显示时回调  在这里处理section的圆角
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let cornerRadius: CGFloat = 10.0
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
        if (loadMoreEnable && section == orderList.refund_order.count-1) {
            getOrderList()
        }
        
    }
    
    //MARK:点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if (orderList.refund_order.count != 1 && section == orderList.refund_order.count-1){
            return 35
        }
        return 16
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if (orderList.refund_order.count != 1 && section == orderList.refund_order.count-1){
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

extension URefundOrderController : JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}

