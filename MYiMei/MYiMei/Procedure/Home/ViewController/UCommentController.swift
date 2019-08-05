//
//  UCommentController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/25.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import JXSegmentedView

class UCommentController: UBaseViewController {
    
    let segmentedDataSource = JXSegmentedTitleDataSource()
    let segmentedView = JXSegmentedView()
    lazy var listContainerView: JXSegmentedListContainerView! = {
        return JXSegmentedListContainerView(dataSource: self)
    }()
    
    var titles = ["全部评价","未回复"]
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        listContainerView.frame = CGRect(x: 0, y: 44, width: view.bounds.size.width, height: view.bounds.size.height - 44)
    }
    
    override func configUI() {
        view.backgroundColor = UIColor.white
        
        //配置数据源
        segmentedDataSource.isTitleColorGradientEnabled = true
        segmentedDataSource.titles = titles
        segmentedDataSource.titleNormalColor = UIColor.hex(hexString: "#999999")
        segmentedDataSource.titleSelectedColor = UIColor.hex(hexString: "#333333")
        segmentedDataSource.isItemSpacingAverageEnabled = true
        segmentedDataSource.reloadData(selectedIndex: 0)
        
        //配置指示器
        let indicator = JXSegmentedIndicatorLineView()
        indicator.lineStyle = .normal
        indicator.indicatorColor = UIColor.hex(hexString: "#1C98F6")
        indicator.indicatorCornerRadius = 0
        indicator.indicatorHeight = 2
        
        //segmentedViewDataSource一定要通过属性强持有！！！！！！！！！
        segmentedView.dataSource = segmentedDataSource
        segmentedView.indicators = [indicator]
        segmentedView.delegate = self
        segmentedView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 44)
        view.addSubview(segmentedView)
        
        segmentedView.contentScrollView = listContainerView.scrollView
        view.addSubview(listContainerView)
    }
}

extension UCommentController: JXSegmentedViewDelegate, JXSegmentedListContainerViewDataSource {
    
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
        let vc = UCommentListController()
        vc.commentType = index
        return vc
    }
}

