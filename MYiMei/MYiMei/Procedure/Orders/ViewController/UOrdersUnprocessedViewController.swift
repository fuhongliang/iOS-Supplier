//
//  UOrdersUnprocessedViewController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/20.
//  Copyright © 2019 符宏梁. All rights reserved.
//


import UIKit
import SCLAlertView
import JXSegmentedView

class UOrdersUnprocessedViewController: UBaseViewController {
    
    fileprivate var service = APIOrderServices()
    
    private var orderList = OrderList()
    
    let activity = UIActivityIndicatorView()
    var loadMoreView = UIView()
    
    /*
     订单类型:通过orderType来判断哪一种类型的订单
     */
    var orderType = 1
    
    var mOrderId = 0
    
    var alert:SCLAlertView? = nil
    
    let tipGoodsLabel = UILabel() // 商品价格输入框上面的提示
    let goodsLabel = UILabel() //商品价格
    let tipFreightLabel = UILabel() // 运费价格输入框上面的提示
    let freightLabel = UILabel() //运费价格
    let warnLabel = UILabel()
    let addPriceBtn = UIButton()
    
    let reducePriceBtn = UIButton()
    let inputFreightPriceTF = UITextField(frame: CGRect(x: 0, y: 0, width: 180, height: 35))
    let inputGoodsPriceTF = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 35))
    
    //用了记录当前是否允许加载新数据（加载的时候会将其设为false，防止重复加载）
    var loadMoreEnable = true
    //记录当前加载到哪一页
    var pageRecord = 1
    
    let style = SCLAlertView.SCLAppearance(
        kWindowWidth: 300, kTitleFont: UIFont(name: "HelveticaNeue-Bold", size: 20)!,
        kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
        kButtonFont: UIFont(name: "HelveticaNeue", size: 18)!,
        showCloseButton: false,
        showCircularIcon: false,
        hideWhenBackgroundViewIsTapped:true,
        buttonsLayout: .horizontal
    )
    
    lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .grouped)
        tw.backgroundColor = UIColor.background
        tw.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        tw.separatorStyle = UITableViewCell.SeparatorStyle.none
        tw.showsVerticalScrollIndicator = false
        tw.delegate = self
        tw.dataSource = self
        tw.uempty = UEmptyView { [weak self] in self?.refreshOrderData() }
        tw.uHead = URefreshHeader{ [weak self] in self?.refreshOrderData() }
        tw.register(cellType: UOrderNotPayCell.self)
        tw.register(cellType: UOrderNotSendCell.self)
        return tw
    }()
    
    override func configUI() {
        configLoadMoreView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
        }
        getOrderList()
        
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
    
    //MARK:修改订单价格
    func modifyOrderPrice(orderId: Int, updatePrice: Int, updateExpress: Int, type: Int){
        service.modifyOrderPrice(orderId: orderId, updatePrice: updatePrice, updateExpress: updateExpress, type: type, {
            showHUDInView(text: "修改成功", inView: self.view)
            self.refreshOrderData()
        }) { (APIErrorModel) in
//            print(APIErrorModel.msg)
            showHUDInView(text: "修改失败", inView: self.view)
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
    
    //MARK:设置发货
    func sendGoods(index:Int){

        let window = SCLAlertView(appearance: style)
        window.addButton("无需快递",textColor:UIColor.hex(hexString: "#1C98F6")) {
            self.service.deliveryGoods(order_id: self.orderList.order[index].order_id, is_express: 0, express: "", express_no: "", words: "", {
                showHUDInView(text: "发货成功", inView: self.view)
                self.refreshOrderData()
            }, { (APIErrorModel) in
                print(APIErrorModel.msg ?? "-----")
            })
        }
        window.addButton("物流配送",textColor:UIColor.hex(hexString: "#35C42E")) {
            let vc = USettingDeliveryController()
            vc.title = "设置发货"
            vc.orderId = self.orderList.order[index].order_id
            self.pushViewController(vc, animated: true)
        }
        window.showCustom("温馨提示", subTitle: "请选择发货方式", color: UIColor.white, icon: UIImage(), animationStyle: .noAnimation)
    }
    
    @objc func refreshOrderData() {
        pageRecord = 1
        getOrderList()
    }
    
    //加价
    @objc func addOrderPrice(orderId: Int,updatePrice: Int, updateExpress: Int){
        
        self.modifyOrderPrice(orderId: mOrderId, updatePrice: updatePrice, updateExpress: updateExpress, type: 1)
    }
    
    //优惠
    @objc func reduceOrderPrice(orderId: Int,updatePrice: Int, updateExpress: Int){
        self.modifyOrderPrice(orderId: mOrderId, updatePrice: updatePrice, updateExpress: updateExpress, type: 0)
    }
    
}

extension UOrdersUnprocessedViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        
        let orderStatus = orderList.order[indexPath.section].order_status
        
        if orderStatus == 0 {
            
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UOrderNotPayCell.self)
            
            cell.callTheClient = {
                self.callTheClient(index: indexPath.section)
            }
            
            cell.modifyPriceOrDeliveryGoods = {
                // 0 待付款  1待发货 2待收货 3已完成 5已取消
                
                NSLog("修改价格")
                self.mOrderId = self.orderList.order[indexPath.section].order_id
                //获取点击事件
                self.configAlertView()
                
            }
            
            cell.moveToRecycleBin = {
                showHUDInView(text: "此功能正在开发中", inView: self.view)
            }
            
            cell.model = orderList.order[indexPath.section]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UOrderNotSendCell.self)
            cell.callTheClient = {
                self.callTheClient(index: indexPath.section)
            }
            
            cell.modifyPriceOrDeliveryGoods = {
                // 0 待付款  1待发货 2待收货 3已完成 5已取消
                NSLog("发货")
                self.sendGoods(index: indexPath.section)
                
            }
            
            cell.moveToRecycleBin = {
                showHUDInView(text: "此功能正在开发中", inView: self.view)
            }
            
            cell.model = orderList.order[indexPath.section]
            return cell
        }
        
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
    
    func configAlertView(){
        
        // Initialize SCLAlertView using custom Appearance
        alert = SCLAlertView(appearance: style)
        // Creat the subview
        alert?.viewWillAppear(true)
        let subview = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 203))
        
        tipGoodsLabel.text = "修改订单中所有商品的总价格"
        tipGoodsLabel.font = UIFont.systemFont(ofSize: 15)
        tipGoodsLabel.textColor = UIColor.hex(hexString: "#808080")
        subview.addSubview(tipGoodsLabel)
        tipGoodsLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalToSuperview().offset(10)
        }
        
        goodsLabel.text = "商品价格:"
        goodsLabel.font = UIFont.systemFont(ofSize: 15)
        goodsLabel.textColor = UIColor.black
        subview.addSubview(goodsLabel)
        goodsLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(35)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(tipGoodsLabel.snp.bottom).offset(11)
        }
        
        //商品价格输入框
        inputGoodsPriceTF.text = ""
        inputGoodsPriceTF.layer.borderColor = UIColor.hex(hexString: "#E5E5E5").cgColor
        inputGoodsPriceTF.layer.borderWidth = 1
        inputGoodsPriceTF.layer.cornerRadius = 2
        inputGoodsPriceTF.keyboardType = UIKeyboardType.decimalPad
        inputGoodsPriceTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 35))
        inputGoodsPriceTF.leftViewMode = .always
        subview.addSubview(inputGoodsPriceTF)
        inputGoodsPriceTF.snp.makeConstraints({ (ConstraintMaker) in
            ConstraintMaker.left.equalTo(goodsLabel.snp.right).offset(5)
            ConstraintMaker.width.equalTo(180)
            ConstraintMaker.height.equalTo(35)
            ConstraintMaker.top.equalTo(tipGoodsLabel.snp.bottom).offset(11)
        })
        
        tipFreightLabel.text = "修改的是订单中运费的价格"
        tipFreightLabel.font = UIFont.systemFont(ofSize: 15)
        tipFreightLabel.textColor = UIColor.hex(hexString: "#808080")
        subview.addSubview(tipFreightLabel)
        tipFreightLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(inputGoodsPriceTF.snp.bottom).offset(20)
        }
        
        freightLabel.text = "运费价格:"
        freightLabel.font = UIFont.systemFont(ofSize: 15)
        freightLabel.textColor = UIColor.black
        subview.addSubview(freightLabel)
        freightLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(35)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(tipFreightLabel.snp.bottom).offset(11)
        }
        
        //运费价格输入框
        inputFreightPriceTF.text = ""
        inputFreightPriceTF.keyboardType = UIKeyboardType.decimalPad
        inputFreightPriceTF.layer.borderColor = UIColor.hex(hexString: "#E5E5E5").cgColor
        inputFreightPriceTF.layer.borderWidth = 1
        inputFreightPriceTF.layer.cornerRadius = 2
        inputFreightPriceTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 35))
        inputFreightPriceTF.leftViewMode = .always
        subview.addSubview(inputFreightPriceTF)
        inputFreightPriceTF.snp.makeConstraints({ (ConstraintMaker) in
            ConstraintMaker.left.equalTo(freightLabel.snp.right).offset(5)
            ConstraintMaker.width.equalTo(180)
            ConstraintMaker.height.equalTo(35)
            ConstraintMaker.top.equalTo(tipFreightLabel.snp.bottom).offset(11)
        })
        
        warnLabel.text = "优惠的运费不能超过原来的运费"
        warnLabel.textColor = UIColor.hex(hexString: "#FF4444")
        warnLabel.font = UIFont.systemFont(ofSize: 15)
        subview.addSubview(warnLabel)
        warnLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(inputFreightPriceTF.snp.bottom).offset(15)
        }
        
        _ = alert?.addButton("加价", backgroundColor: UIColor.white,textColor:UIColor.hex(hexString: "#1C98F6"), target:self, selector:#selector(addPrice))
        _ = alert?.addButton("优惠", backgroundColor: UIColor.white,textColor:UIColor.hex(hexString: "#07D781"), target:self, selector:#selector(reducePrice))
        
        alert?.customSubview = subview
        
        alert?.showEdit("价格修改", subTitle: "ddddddddd",animationStyle:.noAnimation)
        
    }
    
    //优惠
    @objc func reducePrice(){
        var goodspp:Int = 0
        var devily:Int = 0
        if(inputGoodsPriceTF.text?.count ?? 0 >= 0){
            if let goodsPrice = Int(inputGoodsPriceTF.text ?? "0") {
                goodspp = goodsPrice
            }
        }
        if(inputFreightPriceTF.text?.count ?? 0 >= 0){
            if let goodsPrice = Int(inputFreightPriceTF.text ?? "0") {
                devily = goodsPrice
            }
        }

        if(goodspp == 0 && devily == 0){
            return
        }
        
        self.reduceOrderPrice(orderId: mOrderId, updatePrice: goodspp, updateExpress: devily)
        alert?.hideView()
    }
    
    //加价
    @objc func addPrice(orderId: Int,updatePrice: Int, updateExpress: Int){
        var goodspp:Int = 0
        var devily:Int = 0

        if(inputGoodsPriceTF.text?.count ?? 0 >= 0){
            if let goodsPrice = Int(inputGoodsPriceTF.text ?? "0") {
                goodspp = goodsPrice
            }
        }

        if(inputFreightPriceTF.text?.count ?? 0 >= 0){
            if let goodsPrice = Int(inputFreightPriceTF.text ?? "0") {
                devily = goodsPrice
            }
        }

        if(goodspp == 0 && devily == 0){
            return
        }
        
        self.addOrderPrice(orderId: mOrderId, updatePrice: goodspp, updateExpress: devily)
        alert?.hideView()
    }
    
}

extension UOrdersUnprocessedViewController : JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}
