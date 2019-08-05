//
//  UManagerOrdersController.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/24.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import JXSegmentedView

class UManagerOrdersController: UBaseViewController {
    var segmentedDataSource = JXSegmentedTitleDataSource()
    var segmentedView = JXSegmentedView()
    lazy var listContainerView: JXSegmentedListContainerView! = {
        return JXSegmentedListContainerView(dataSource: self)
    }()

    let indicator = JXSegmentedIndicatorBackgroundView()
    let titles = ["普通订单","售后订单"]
    
    let totalItemWidth: CGFloat = 150
    
    override func viewDidLoad() {
        super.viewDidLoad()

        segmentedDataSource.itemContentWidth = 168 / CGFloat(titles.count)
        segmentedDataSource.titles = titles
        segmentedDataSource.isTitleMaskEnabled = true
        segmentedDataSource.titleNormalColor = UIColor.white
        segmentedDataSource.titleSelectedColor = UIColor.hex(hexString: "#1C98F6")
        segmentedDataSource.itemSpacing = 0
        segmentedDataSource.reloadData(selectedIndex: 0)

        indicator.indicatorHeight = 30
        indicator.backgroundWidthIncrement = 0
        indicator.indicatorColor = UIColor.white
        indicator.indicatorCornerRadius = 0

        segmentedView.frame = CGRect(x: 0, y: 0, width: 168, height: 30)
        segmentedView.layer.masksToBounds = true
        segmentedView.layer.cornerRadius = 2
        segmentedView.layer.borderColor = UIColor.white.cgColor
        segmentedView.layer.borderWidth = 1 / UIScreen.main.scale
        segmentedView.dataSource = segmentedDataSource
        segmentedView.indicators = [indicator]
        segmentedView.delegate = self
        //打开头部的显示
        self.navigationItem.titleView = segmentedView
//        self.navigationItem.title = "订单管理"

        segmentedView.contentScrollView = listContainerView.scrollView
        view.addSubview(listContainerView)

        edgesForExtendedLayout = .top
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        listContainerView.frame = view.bounds
    }

}

extension UManagerOrdersController : JXSegmentedViewDelegate,JXSegmentedListContainerViewDataSource {
    
    func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {
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
        let vc = UOrdersChildViewController()
        if index == 0 {
            vc.titles = ["全部", "待处理", "待收货", "已完成", "已取消"]
            vc.listType = 0
        } else {
            vc.titles = ["全部", "待处理", "已处理"]
            vc.listType = 1
        }
        return vc

    }
    
}
