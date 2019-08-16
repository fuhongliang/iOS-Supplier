//
//  UHomeFinancialSettlementController.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/30.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import SCLAlertView
import JXSegmentedView

class UHomeFinancialSettlementController: UBaseViewController {
    
    let mHomeFinancialSettlementView = UHomeFinancialSettlementView()
    
    let segmentedDataSource = JXSegmentedTitleDataSource()
    let segmentedView = JXSegmentedView()
    lazy var listContainerView: JXSegmentedListContainerView! = {
        return JXSegmentedListContainerView(dataSource: self)
    }()

    var titles = ["收支明细","提现记录"]
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        listContainerView.frame = CGRect(x: 0, y: 105 + 44, width: view.bounds.size.width, height: view.bounds.size.height - 105 - 44)
    }
    
    override func configUI() {
        
        mHomeFinancialSettlementView.setView()
        mHomeFinancialSettlementView.withdrawBtn.addTarget(self, action: #selector(showAlert), for: UIControl.Event.touchUpInside)
        self.view.addSubview(mHomeFinancialSettlementView)
        self.view.backgroundColor = UIColor.white
        
        mHomeFinancialSettlementView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
        
        //配置数据源
        segmentedDataSource.isTitleColorGradientEnabled = true
        segmentedDataSource.titles = titles
        segmentedDataSource.titleNormalColor = UIColor.hex(hexString: "#999999")
        segmentedDataSource.titleSelectedColor = UIColor.hex(hexString: "#333333")
        segmentedDataSource.isItemSpacingAverageEnabled = true
        segmentedDataSource.reloadData(selectedIndex: 0)
        
        //配置指示器
        let indicator = JXSegmentedIndicatorLineView()
        //        indicator.indicatorWidth = screenWidth / 2
        indicator.lineStyle = .normal
        indicator.indicatorColor = UIColor.hex(hexString: "#1C98F6")
        indicator.indicatorCornerRadius = 0
        indicator.indicatorHeight = 2
        
        //segmentedViewDataSource一定要通过属性强持有！！！！！！！！！
        segmentedView.dataSource = segmentedDataSource
        segmentedView.indicators = [indicator]
        segmentedView.delegate = self
        segmentedView.frame = CGRect(x: 0, y: 105, width: screenWidth, height: 44)
        view.addSubview(segmentedView)
        
        segmentedView.contentScrollView = listContainerView.scrollView
        view.addSubview(listContainerView)
        
    }
    
    //MARK:显示提现窗口
    @IBAction func showAlert(){
        let style = SCLAlertView.SCLAppearance(
            kWindowWidth: 300, kTitleFont: UIFont(name: "HelveticaNeue", size: 18)!,
            kTextFont: UIFont(name: "HelveticaNeue-Bold", size: 20)!,
            kButtonFont: UIFont(name: "HelveticaNeue", size: 18)!,
            showCloseButton: false,
            showCircularIcon: false,
            hideWhenBackgroundViewIsTapped:true,
            buttonsLayout: .horizontal
        )
        
        let alert = SCLAlertView(appearance: style)
        if Double(mHomeFinancialSettlementView.overNumberLaber.text!) ?? 0 >= 1 {
            alert.addButton("提现到银行卡",textColor:UIColor.hex(hexString: "#1C98F6")) {
                
                let vc = UBankCardWithdrawController()
                vc.title = "提现"
                vc.maxAmount = Double(self.mHomeFinancialSettlementView.overNumberLaber.text ?? "0")!
                self.navigationController?.pushViewController(vc, animated: true)
            }
            alert.addButton("提现到微信",textColor:UIColor.hex(hexString: "#35C42E")) {
                
                let vc = UWeChatWithdrawController()
                vc.title = "提现"
                vc.maxAmount = Double(self.mHomeFinancialSettlementView.overNumberLaber.text ?? "0")!
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            alert.showCustom("", subTitle: "请选择提现方式", color: UIColor.white, icon: UIImage(), animationStyle: .noAnimation)
        } else {
            alert.addButton("知道了",textColor:UIColor.hex(hexString: "#1C98F6")) {
                print("余额不够")
            }
            alert.showCustom("", subTitle: "余额不足1元,无法提现", color: UIColor.white, icon: UIImage(), animationStyle: .noAnimation)
        }
        
    }
}

extension UHomeFinancialSettlementController: JXSegmentedViewDelegate, JXSegmentedListContainerViewDataSource {
    
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
        if index == 0 {
            let vc = UFinancialSettlementListController()
            return vc
        } else {
            let vc = UCashOutRecordListController()
            return vc
        }
        
    }
}
