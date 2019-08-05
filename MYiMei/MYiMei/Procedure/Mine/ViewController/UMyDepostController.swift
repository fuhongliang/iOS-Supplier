//
//  UMyDepostController.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/7/11.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class UMyDepostController: UBaseViewController {

    fileprivate var service: APIStoreServices = APIStoreServices()
    fileprivate let depostService = APIDepositServices()

    var depostReview = false

    var depostArray = [DepostModel]()

    var agreeMentContent = String()

    lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .grouped)
        tw.backgroundColor = UIColor.background
        tw.delegate = self
        tw.dataSource = self
        tw.register(cellType: UBaseTableViewCell.self)
        tw.register(cellType: UDepostStatusCell.self)
        tw.register(cellType: UDepostPhotoCell.self)
        tw.register(cellType: UWebViewCell.self)
        return tw
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        let btnItem = UIBarButtonItem.init(title: "追加", style: .plain, target: self, action: #selector(tapAddDepostAction))
        btnItem.tintColor = UIColor.white
        btnItem.width = 60
        navigationItem.rightBarButtonItem = btnItem
        getStoreDepost()
        loadUrl()
    }

    private lazy var head: UMineHead = {
        return UMineHead(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 2))
    }()

    private lazy var navigationBarY: CGFloat = {
        return navigationController?.navigationBar.frame.maxY ?? 0
    }()

    //MARK:初始化视图
    override func configUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(self.view.usnp.edges).priority(.low)
            $0.top.equalToSuperview()
        }

        tableView.parallaxHeader.view = head
        tableView.parallaxHeader.height = 2
        tableView.parallaxHeader.minimumHeight = navigationBarY
        tableView.parallaxHeader.mode = .fill
        tableView.separatorColor = UIColor.clear
    }

    //MARK:追加保证金
    @objc func tapAddDepostAction() {
        let vc = UDepostPostController()
        vc.title = "追加保证金"
        navigationController?.pushViewController(vc, animated: true)
    }

    //MARK:获取店铺保证金
    func getStoreDepost() {
        service.getStoreDepostData({ (StoreDepostReponseModel) in
            if(StoreDepostReponseModel.data?.review?.count ?? 0>0){
                self.depostReview = true
                self.depostArray = StoreDepostReponseModel.data!.review!
            }else{
                self.depostReview = false
                self.depostArray = StoreDepostReponseModel.data!.pass!
            }
            self.tableView.reloadData()

        }, { (APIErrorModel) in
            showHUDInView(text: APIErrorModel.msg!, inView: self.view)
        })
    }

    //MARK:请求保证金协议
    func loadUrl() {
        depostService.getDepositAgreement({ (DepositAgreementResponsModel) in
            self.agreeMentContent = DepositAgreementResponsModel.data?.content ?? "暂无协议内容"
            self.tableView.reloadData()
        }) { (APIErrorModel) in
            showHUDInView(text: APIErrorModel.msg ?? "获取保证金协议失败", inView: self.view)
        }
    }
    
}

extension UMyDepostController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableVsiew: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0){
            return 99
        }else if(indexPath.section == 1){
            return 150
        }else {
            return 350
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if(section == 0){
            return 1
        }else if(section == 1){
            return depostArray.count
        }else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UDepostStatusCell.self)
            if(depostReview){
                cell.depostStatusLabel.text = "保证金审核中"
                cell.depostStatusIcon.image = UIImage.init(named: "review")
                var money = Double()
                for depost in depostArray {
                    let depostMoney = Double(depost.price)
                    money = money + depostMoney!
                }
                cell.depostAmountNumberLabel.text = String(money)
            }else{
                cell.depostStatusLabel.text = "已缴纳保证金"
                cell.depostStatusIcon.image = UIImage.init(named: "paid")
            }

            return cell
        }else if(indexPath.section == 1){
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UDepostPhotoCell.self)
            let url = URL(string: depostArray[indexPath.row].image_url)
            cell.depostPhoto.kf.setImage(with: url)
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UWebViewCell.self)
            cell.webView.loadHTMLString(agreeMentContent, baseURL: URL(string:"http://yiwuyimei-test.oss-cn-beijing.aliyuncs.com"))
            return cell
        }

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }

}




