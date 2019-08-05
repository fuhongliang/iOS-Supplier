//
//  UMessageManagerController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/20.
//  Copyright © 2019 符宏梁. All rights reserved.
//


import UIKit

class UMessageManagerController : UBaseViewController {
    
    fileprivate var service = APIMessageServices()
    
    private var messageList = MessageListModel()
    
    lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .grouped)
        tw.backgroundColor = UIColor.background
        tw.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
//        tw.separatorStyle = UITableViewCell.SeparatorStyle.none
        tw.showsVerticalScrollIndicator = false
        tw.delegate = self
        tw.dataSource = self
        
        tw.estimatedRowHeight = 66
        tw.rowHeight = UITableView.automaticDimension
        
        tw.uempty = UEmptyView { [weak self] in self?.getMessageInfo() }
        tw.uHead = URefreshHeader { [weak self] in self?.getMessageInfo() }
        tw.register(cellType: UMessageManagementCellView.self)
        return tw
    }()
    
    override func configUI() {
        
//        tableView.refreshControl = UIRefreshControl()
//        tableView.refreshControl?.attributedTitle = NSAttributedString(string: "正在刷新订单数据...")
//        tableView.refreshControl?.addTarget(self, action: #selector(refreshOrderData), for: .valueChanged)
//        configLoadMoreView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        getMessageInfo()
        
        
    }
    
    func getMessageInfo(){
        service.getOrderMessageNotice(page: 1, { (MessageNoticeModel) in
            self.messageList = MessageNoticeModel.data
            self.tableView.reloadData()
            self.tableView.uHead.endRefreshing()
        }) { (APIErrorModel) in
            showHUDInView(text: "网络错误", inView: self.view)
            self.tableView.uHead.endRefreshing()
        }
    }
 
}

extension UMessageManagerController : UITableViewDelegate, UITableViewDataSource {
    
    //MARK:cell组数
    func numberOfSections(in tableView: UITableView) -> Int {
        guard messageList.msg == nil else {
            return 1
        }
        return 0
    }
    
    //MARK:cell高度
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 66
//
//    }
    
    //MARK:每组cell的数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.msg.count
    }
    
    //MARK:section头部的高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        //头部section 高点
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    //MARK:返回每个cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UMessageManagementCellView.self)
        cell.model = messageList.msg[indexPath.row]
        return cell
        
    }
    
    //MARK:点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
