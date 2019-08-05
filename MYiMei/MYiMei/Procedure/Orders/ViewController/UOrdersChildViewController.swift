//
//  UOrdersChildViewController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/15.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import JXSegmentedView

class UOrdersChildViewController: UBaseViewController {
    
    
    let segmentedDataSource = JXSegmentedTitleDataSource()
    let segmentedView = JXSegmentedView()
    lazy var listContainerView: JXSegmentedListContainerView! = {
        return JXSegmentedListContainerView(dataSource: self)
    }()
    
    /*
     判断是否当前的订单页面是什么状态
     0 -> 普通订单
     1 -> 维权订单
     */
    var listType = 0
    
    var titles = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        listContainerView.frame = CGRect(x: 0, y: 50, width: view.bounds.size.width, height: view.bounds.size.height - 50)
    }
    
    override func configUI() {
        
        view.backgroundColor = UIColor.white
        
        //配置数据源
        segmentedDataSource.isTitleColorGradientEnabled = true
        segmentedDataSource.titles = titles
        segmentedDataSource.titleNormalColor = UIColor.hex(hexString: "#999999")
        segmentedDataSource.titleSelectedColor = UIColor.hex(hexString: "#333333")
        segmentedDataSource.reloadData(selectedIndex: 0)
        
        //配置指示器
        let indicator = JXSegmentedIndicatorLineView()
        indicator.indicatorWidth = JXSegmentedViewAutomaticDimension
        indicator.lineStyle = .lengthen
        indicator.indicatorColor = UIColor.hex(hexString: "#1C98F6")
        indicator.indicatorCornerRadius = 0
        indicator.indicatorHeight = 2
        
        //segmentedViewDataSource一定要通过属性强持有！！！！！！！！！
        segmentedView.dataSource = segmentedDataSource
        segmentedView.indicators = [indicator]
        segmentedView.delegate = self
        segmentedView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 50)
        view.addSubview(segmentedView)
        
        segmentedView.contentScrollView = listContainerView.scrollView
        view.addSubview(listContainerView)
    }
    
}

extension UOrdersChildViewController: JXSegmentedListContainerViewListDelegate, JXSegmentedViewDelegate, JXSegmentedListContainerViewDataSource {
    func listView() -> UIView {
        return view
    }
    
    func segmentedView(_ segmentedView: JXSegmentedView, didClickSelectedItemAt index: Int) {
        listContainerView.didClickSelectedItem(at: index)
    }
    
    func segmentedView(_ segmentedView: JXSegmentedView, scrollingFrom leftIndex: Int, to rightIndex: Int, percent: CGFloat) {
        listContainerView.segmentedViewScrolling(from: leftIndex, to: rightIndex, percent: percent, selectedIndex: segmentedView.selectedIndex)
    }
    
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        if let titleDataSource = segmentedView.dataSource as? JXSegmentedBaseDataSource {
            return titleDataSource.dataSource.count
        }
        return 0
    }
    
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        let vc = UOrdersUnprocessedViewController()
        if listType == 0{ // 普通订单
            if index == 1 {//待处理
                let controller = UOrdersUnprocessedViewController()
                return controller
            } else if index == 2 {//待收货
                let controller = UOrdersNotReceiptController()
                return controller
            } else if index == 3 {
                let controller = UOrdersCompleteController()
                return controller
            } else if index == 4 {
                let controller = UOrdersCancleController()
                return controller
            }
        } else { // 售后订单
            let vc = URefundOrderController()
            vc.orderType = index
            return vc
        }
        return vc
    }
}

