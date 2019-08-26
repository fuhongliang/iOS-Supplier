//
//  UPickintOrderDetailViewController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/6.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
class UPickintOrderDetailViewController : UBaseViewController {
    
    var orderId = 0
    
    // 0 待付款  1待发货 2待收货 3已完成 5已取消
    var orderStatus = 0
    
    var orderModel = [PickGoodsDetailModel]()
    var isRequestOrderDetail = false
    
    private let service = APIOrderServices()
    
    var pickStatus = 0
    var pickID = ""
    var addTime = ""
    var goodsCatNum = ""
    var goodsNum = ""
    var totalPrice = ""
    
    
    lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .grouped)
        tw.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        tw.separatorStyle = UITableViewCell.SeparatorStyle.none
        tw.showsVerticalScrollIndicator = false
        tw.delegate = self
        tw.dataSource = self
        tw.register(cellType: UOrderDetailSectionTitleCell.self)
        tw.register(cellType: UOrderDetailInfoFiveItemCell.self)
        tw.register(cellType: UOrderDetailGoodsCell.self)
        return tw
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        service.pickOrderDetail(huodanId: pickID, { (PickGoodsDetailResponseModel) in
            self.orderModel = PickGoodsDetailResponseModel.data.goods_list
            self.isRequestOrderDetail = true
            self.tableView.reloadData()
        }) { (APIErrorModel) in
            print("...-----...")
        }
    }
    
    override func configUI() {

        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
        }
        
    }
    
}

extension UPickintOrderDetailViewController : UITableViewDelegate, UITableViewDataSource {
    
    //MARK:cell组数
    func numberOfSections(in tableView: UITableView) -> Int {
        if !isRequestOrderDetail {
            return 0 //如果请求未完成则不显示
        }
        if pickStatus == 0{
            return 3
        } else {
            return 2
        }
    }
    
    //MARK:
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //TODO 详情cell高度
        
        if indexPath.row == 0 {
            return 42
        } else if indexPath.section == 0 {
            return 115
        } else if indexPath.section == 1 {
            return 90
        }
        return 44//确定按钮的高度
        
    }
    
    //MARK:每组cell的数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 2
        case 1:
            return orderModel.count + 1
        default:
            return 1
        }
        
    }
    
    //MARK:每个section的头部的高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 15 : CGFloat.leastNormalMagnitude
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == numberOfSections(in: tableView)-1 ? 30 : 15
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    //MARK:返回每个cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0 ){
            if (indexPath.row == 0){
                return getSectionTitleCell(index: indexPath, title: "订单详情")
            } else {
                //这里判断订单状态 remove掉多余的行
                return getInfoCell(index: indexPath)
            }
        } else {
            if (indexPath.row == 0){
                //如果是未拣货
                if indexPath.section == 2 {
                    return getSectionTitleCell(index: indexPath, title: "完成拣货", textDirection: .center)
                }
                return getSectionTitleCell(index: indexPath, title: "商品信息")
            } else {
                //商品cell
                return getGoodsCell(index: indexPath)
            }
        }
        
    }
    
    
    //MARK:footerView即将显示的时候的回调
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        
    }
    
    //MARK:点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            //TODO--完成拣货货接口
            self.service.setPick(huodanId:Int(pickID) ?? 0, {
                showHUDInView(text: "拣货成功", inView: self.view)
            }, { (APIErrorModel) in
                showHUDInView(text: "拣货失败", inView: self.view)
                print(APIErrorModel.msg ?? "请求异常")
            })
        }
    }
    
    //MARK:每个cell即将显示时回调  在这里处理section的圆角
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let cornerRadius: CGFloat = 4.0
        cell.backgroundColor = UIColor.clear
        
        let layer = CAShapeLayer()
        let backgroundLayer = CAShapeLayer()
        let pathRef = CGMutablePath()
        let bounds = cell.bounds;
        
        let numberOfRows = self.tableView.numberOfRows(inSection: indexPath.section)
        
        var needSeparator = false
        if (indexPath.row == 0 && numberOfRows == 1) {
            if bounds.height >= cornerRadius{
                pathRef.addRoundedRect(in: bounds, cornerWidth: cornerRadius, cornerHeight: cornerRadius)
            }
        }else if (indexPath.row == 0) {
            pathRef.move(to: CGPoint(x: bounds.minX, y: bounds.maxY))
            pathRef.addArc(tangent1End: CGPoint(x: bounds.minX, y: bounds.minY), tangent2End: CGPoint(x: bounds.midX, y: bounds.minY), radius: cornerRadius)
            pathRef.addArc(tangent1End: CGPoint(x: bounds.maxX, y: bounds.minY), tangent2End: CGPoint(x: bounds.maxX, y: bounds.midY), radius: cornerRadius)
            pathRef.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
            needSeparator = true;
        } else if indexPath.row == (numberOfRows-1) {
            pathRef.move(to: CGPoint(x: bounds.minX, y: bounds.minY))
            pathRef.addArc(tangent1End: CGPoint(x: bounds.minX, y: bounds.maxY), tangent2End: CGPoint(x: bounds.midX, y: bounds.maxY), radius: cornerRadius)
            pathRef.addArc(tangent1End: CGPoint(x: bounds.maxX, y: bounds.maxY), tangent2End: CGPoint(x: bounds.maxX, y: bounds.midY), radius: cornerRadius)
            pathRef.addLine(to: CGPoint(x: bounds.maxX, y: bounds.minY))
        } else {
            pathRef.addRect(bounds)
            needSeparator = true
        }
        
        layer.path = pathRef
        backgroundLayer.path = pathRef
        if indexPath.section == 2 {
            layer.fillColor = UIColor.hex(hexString: "#1C98F6").cgColor
        } else {
            layer.fillColor = UIColor.white.cgColor
        }
        //绘制分割线
        if (needSeparator) {
            let lineLayer = CALayer()
            let lineHeight = /*(1.0 / UIScreen.main.scale)*/ CGFloat(1)
            lineLayer.frame = CGRect(x: bounds.minX + 15, y: bounds.size.height-lineHeight, width: bounds.size.width - 30, height: lineHeight)
            lineLayer.backgroundColor = UIColor.hex(hexString: "#F2F2F2").cgColor
            
            layer.addSublayer(lineLayer)
        }
        
        let roundView = UIView(frame: bounds)
        roundView.layer.insertSublayer(layer, at: 0)
        roundView.backgroundColor = UIColor.clear
        cell.backgroundView = roundView
        
    }
    
    //MARK:返回标题的cell （订单详情、商品信息）
    func getSectionTitleCell(index:IndexPath,title: String, textDirection:NSTextAlignment? = nil) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(for: index, cellType: UOrderDetailSectionTitleCell.self)
        guard !isRequestOrderDetail else {
            if textDirection != nil {
                cell.sectionCellTitle.textAlignment = textDirection!
                cell.sectionCellTitle.textColor = UIColor.white
            }
            cell.sectionCellTitle.text = title
            return cell
        }
        return cell
    }
    
    /*
     MARK:返回订单有四个显示文字的cell
     num:显示的数量
     colorIndex:需要改变颜色的item的索引值(可多选 1，2，3，4)
     colorArray:需要改变的颜色数组(可根据num 和 colorIndex的索引变化 例：num为2 则colorArray的count最大只能为2)
     labelOne:第一个的item文字说明
     labelTwo:第二个的item文字说明
     labelThree:第三个的item文字说明
     labelFour:第四个的item文字说明
     */
    func getInfoCell(index:IndexPath, labelOneValue:String = "", labelTwoValue:String = "", labelThreeValue:String = "", labelFourValue:String = "") -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: index, cellType: UOrderDetailInfoFiveItemCell.self)
        guard !isRequestOrderDetail else {
            cell.freightRightLaber.text = self.addTime
            cell.orderAmountRightLaber.text = self.goodsCatNum
            cell.bgModifypPriceRightLaber.text = self.goodsNum
            cell.actualAmountRightLaber.text = self.totalPrice
//            cell.fiveContentLabel.text = self.totalPrice
            
            
            cell.freightLeftLaber.text = "生成时间"
            cell.orderAmountLeftLaber.text = "商品种类"
            cell.bgModifypPriceLeftLaber.text = "商品数量"
            cell.actualAmountLeftLaber.text = "合计价格"
//            cell.fiveLabel.text = "合计价格"
            
            return cell
        }
        return cell
    }
    
    //MARK:返回商品的cell
    func getGoodsCell(index:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: index, cellType: UOrderDetailGoodsCell.self)
        guard !isRequestOrderDetail else {
            let url = URL(string: orderModel[index.row-1].pic)
            cell.commodityIcon.kf.setImage(with: url)
            cell.commodityNameLaber.text = orderModel[index.row-1].name
            var specification = ""
            
            for item in orderModel[index.row-1].attr {
                specification += item.attr_group_name + ":" + item.attr_name
            }
            cell.commoditySpecificationLaber.text = specification
            cell.commodityPriceLaber.text = "￥\(String(orderModel[index.row-1].total_price))"
            cell.commodityNumberLaber.text = "x" + String(orderModel[index.row-1].num)
            return cell
        }
        return cell
    }
    
}
