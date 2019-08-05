//
//  UCashOutRecordListController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/1.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import JXSegmentedView

class UCashOutRecordListController: UBaseViewController {
    
    fileprivate var service = APIStoreServices()
    
    private var cashOutRecordList : [CashOutRecordModel]?
    
    let activity = UIActivityIndicatorView()
    var loadMoreView = UIView()
    
    let replyBtn = UIButton()
    let cancleBtn = UIButton()
    let inputReplyTF = UITextView(frame: CGRect(x: 0, y: 0, width: 180, height: 35))
    
    //用来记录当前是否允许加载新数据（加载的时候会将其设为false，防止重复加载）
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
        
        tw.uempty = UEmptyView { [weak self] in self?.refreshCashListData() }
        tw.uHead = URefreshHeader{ [weak self] in self?.refreshCashListData() }
        tw.register(cellType: UHomeWithdrawalsRecordCell.self)
        return tw
    }()
    
    override func configUI() {

        configLoadMoreView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
            //            ConstraintMaker.top.bottom.left.right.equalToSuperview()
        }
        getCashOutRecordList()
        
    }
    
    //MARK:获取收支明细的数据
    @objc func getCashOutRecordList(){
        
        service.cashOutRecord(page: pageRecord, { (CashOutRecordResponseModel) in
            self.cashOutRecordList = CashOutRecordResponseModel.data.cash
            self.tableView.reloadData()
            
            if (self.pageRecord != 1) {
                self.cashOutRecordList?.append(contentsOf: CashOutRecordResponseModel.data.cash)
            } else {
                self.cashOutRecordList = CashOutRecordResponseModel.data.cash
                self.tableView.uHead.endRefreshing()
            }
            
            if(CashOutRecordResponseModel.data.cash.count >= 20){
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
            print(APIErrorModel.msg ?? ".............")
        }
        
    }
    
    @objc func refreshCashListData() {
        pageRecord = 1
        getCashOutRecordList()
    }
    
}

extension UCashOutRecordListController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK:cell组数
    func numberOfSections(in tableView: UITableView) -> Int {
        guard cashOutRecordList == nil else {
            return 1
        }
        return 0
    }
    
    //MARK:cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    //MARK:每组cell的数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cashOutRecordList!.count
    }
    
    //MARK:返回每个cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UHomeWithdrawalsRecordCell.self)
        cell.model = cashOutRecordList![indexPath.row]
        return cell
    }
    
    //MARK:footerView即将显示的时候的回调
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        //当下拉到底部，执行loadMore()
        if (loadMoreEnable && section == cashOutRecordList!.count-1) {
            getCashOutRecordList()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }

    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if (cashOutRecordList!.count != 1 && section == cashOutRecordList!.count-1){
            return 35
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if (cashOutRecordList!.count != 1 && section == cashOutRecordList!.count-1){
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

extension UCashOutRecordListController : JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}
