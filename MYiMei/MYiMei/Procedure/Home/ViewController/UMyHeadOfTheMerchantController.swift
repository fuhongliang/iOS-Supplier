//
//  UMyHeadOfTheMerchantController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/7.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import SCLAlertView

class UMyHeadOfTheMerchantController: UBaseViewController {
    
    private var service = APIHeadOfShareService()
    
    private var shareList = HeadOfShareDataModel()
    
    let activity = UIActivityIndicatorView()
    var loadMoreView = UIView()
    
    var alert:SCLAlertView? = nil
    let replyBtn = UIButton()
    let cancleBtn = UIButton()
    
    var listType = 0
    private var indexShare:Int = 0
    
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
        
        tw.uempty = UEmptyView { [weak self] in self?.refreshShareData() }
        tw.uHead = URefreshHeader{ [weak self] in self?.refreshShareData() }
        tw.register(cellType: UHeadOfTheMerchantCell.self)
        return tw
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshShareData()
    }
    
    override func configUI() {
        configLoadMoreView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        if listType == 1{
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "增加团长",
                                                            target: self,
                                                            action: #selector(jumpController))
        }
        
        
    }
    
    //MARK:获取团长列表
    func getShareList(){
        
        service.listShare(type: listType, page: pageRecord, { (HeadOfShareResponseModel) in
            if (self.pageRecord != 1) {
//                self.shareList.list.comment.append(contentsOf: CommentsResponseModel.data.comment)
                self.shareList.list.append(contentsOf: HeadOfShareResponseModel.data?.list ?? [])
            } else {
                self.shareList = HeadOfShareResponseModel.data
                self.tableView.uHead.endRefreshing()
            }
            
            if(self.pageRecord > self.shareList.page_count){
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
    
    @objc func jumpController(){
        let vc = UMyHeadOfTheMerchantController()
        vc.title = "添加团长"
        vc.listType = 0
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func refreshShareData() {
        pageRecord = 1
        getShareList()
    }
    
}

extension UMyHeadOfTheMerchantController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK:cell组数
    func numberOfSections(in tableView: UITableView) -> Int {
        guard shareList.list == nil else {
            return 1
        }
        return 0
    }
    
    //MARK:每组cell的数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shareList.list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
    
    //MARK:cell头部高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    //MARK:返回每个cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UHeadOfTheMerchantCell.self)
        
        cell.model = shareList.list[indexPath.row]
        cell.listType = self.listType
        cell.tapAddOrRemove = {
            self.indexShare = indexPath.row
            showAlert(subTitle: "是否\(self.listType == 0 ? "添加" : "删除")该团长?", block: { (alert) in
                alert.addButton("取消", backgroundColor: UIColor.white,textColor:UIColor.hex(hexString: "#1C98F6"), target:self, selector:#selector(self.cancle))
                alert.addButton("确定", backgroundColor: UIColor.white,textColor:UIColor.hex(hexString: "#07D781"), target:self, selector:#selector(self.opShare))
            })
        }

        return cell
    }
    
    //MARK:footerView即将显示的时候的回调
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        
        //当下拉到底部，执行loadMore()
        if (loadMoreEnable && section == shareList.list.count-1) {
            getShareList()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if (shareList.list.count != 1 && section == shareList.list.count-1){
            return 35
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if (shareList.list.count != 1 && section == shareList.list.count-1){
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
    
    //MARK:对团长进行操作
    @objc func opShare(){
        
        if listType == 0 {
            service.addShare(shareId: shareList.list[indexShare].id, {
                showHUDInView(text: "添加成功", inView: self.view)
                self.pressBack()
            }) { (APIErrorModel) in
                print("添加失败\(APIErrorModel.msg ?? "---------")")
            }
        } else {
            service.delShare(shareId: shareList.list[indexShare].id, {
                showHUDInView(text: "删除成功", inView: self.view)
                self.refreshShareData()
            }) { (APIErrorModel) in
                print("删除失败\(APIErrorModel.msg ?? "---------")")
            }
        }

    }
    
    //取消
    @objc func cancle(){
        alert?.hideView()
    }
    
}
