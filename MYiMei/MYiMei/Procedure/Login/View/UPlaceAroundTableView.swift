//
//  UPlaceAroundTableView.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/7/9.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import AMapSearchKit

let kMoreButtonTitle = "更多..."

@objc protocol PlaceAroundTableViewDeleagate: NSObjectProtocol {

    func didTableViewSelectedChanged(selectedPOI: AMapPOI!)
    func didLoadMorePOIButtonTapped()
    func didPositionCellTapped()
}

class UPlaceAroundTableView: UIView, UITableViewDataSource, UITableViewDelegate, AMapSearchDelegate {
    weak var delegate: PlaceAroundTableViewDeleagate?

    var currentAddress: String?

    var tableView: UITableView!
    var searchPoiArray: Array<AMapPOI> = Array()
    var selectedIndexPath: IndexPath?
    var isFromMoreButton: Bool = false
    var moreButton: UIButton!
    var selectPoi = AMapPOI()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initTableView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func initTableView() {
        tableView = UITableView(frame: self.bounds, style: UITableView.Style.plain)
        tableView.autoresizingMask = [UIView.AutoresizingMask.flexibleHeight, UIView.AutoresizingMask.flexibleWidth]
        tableView.delegate = self
        tableView.dataSource = self
        self.addSubview(tableView)
        initTableViewFooter()
    }

    func initTableViewFooter() {
        let margin: CGFloat = 20.0
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: 60))
        moreButton = UIButton(type: UIButton.ButtonType.custom)
        moreButton.frame = footer.bounds
        moreButton.setTitle(kMoreButtonTitle, for: UIControl.State.normal)
        moreButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        moreButton.setTitleColor(UIColor.gray, for: UIControl.State.highlighted)
        moreButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        moreButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: 0)
        moreButton.addTarget(self, action: #selector(self.actionMoreButtonTapped), for: UIControl.Event.touchUpInside)

        footer.addSubview(moreButton)

        // line
        let line = UIView(frame: CGRect(x: margin, y: 3, width: footer.bounds.width - margin, height: 0.5))
        line.backgroundColor = UIColor.gray

        footer.addSubview(line)

        self.tableView.tableFooterView = footer
    }

    @objc func actionMoreButtonTapped() {
        if isFromMoreButton || self.delegate == nil {
            return
        }

        self.isFromMoreButton = true
        if self.delegate!.responds(to: #selector(PlaceAroundTableViewDeleagate.didLoadMorePOIButtonTapped)) {
            self.delegate!.didLoadMorePOIButtonTapped()
        }
    }

    //MARK:- AMapSearchDelegate

    func aMapSearchRequest(_ request: Any!, didFailWithError error: Error!) {
        print("error :\(String(describing: error))")
    }

    /* POI 搜索回调. */
    func onPOISearchDone(_ request: AMapPOISearchBaseRequest!, response: AMapPOISearchResponse!) {

        if isFromMoreButton {
            isFromMoreButton = false
        }
        else {
            self.searchPoiArray.removeAll()
            self.moreButton.setTitle(kMoreButtonTitle, for: UIControl.State.normal)
            self.moreButton.isEnabled = true
            self.moreButton.backgroundColor = UIColor.white
        }

        if response.count == 0 {
            self.moreButton.setTitle("没有数据了...", for: UIControl.State.normal)
            self.moreButton.isEnabled = false
            self.moreButton.backgroundColor = UIColor.white
            self.selectedIndexPath = nil
            self.tableView.reloadData()
            return
        }

        self.searchPoiArray.append(contentsOf: response.pois)
        self.selectedIndexPath = nil
        self.tableView.reloadData()
    }

    func onReGeocodeSearchDone(_ request: AMapReGeocodeSearchRequest!, response: AMapReGeocodeSearchResponse!) {

        if response.regeocode != nil {
            self.currentAddress = response.regeocode.formattedAddress
            print(response.regeocode.addressComponent.province ?? "没有省")
            print(response.regeocode.addressComponent.city  ?? "没有市")
            print(response.regeocode.addressComponent.district ?? "没有区")
            selectPoi.province = response.regeocode.addressComponent.province
            selectPoi.city = response.regeocode.addressComponent.city
            selectPoi.district = response.regeocode.addressComponent.district
        }
    }

    //MARK:- TableViewDelegate

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell: UITableViewCell? = tableView.cellForRow(at: indexPath)

        if cell != nil {
            cell!.accessoryType = UITableViewCell.AccessoryType.none
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let cell: UITableViewCell? = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = UITableViewCell.AccessoryType.checkmark

        self.selectedIndexPath = indexPath

        if self.delegate == nil {
            return
        }

        if self.delegate!.responds(to: #selector(PlaceAroundTableViewDeleagate.didTableViewSelectedChanged(selectedPOI:))) {
            let seletedPOI = self.searchPoiArray[indexPath.row]
            seletedPOI.province = selectPoi.province
            seletedPOI.city = selectPoi.city
            seletedPOI.district = selectPoi.district
            self.delegate!.didTableViewSelectedChanged(selectedPOI: seletedPOI)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchPoiArray.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //MARK:- TableViewDataSource

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cellIdentifier = "demoCellIdentifier"

        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)

        if cell == nil {

            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: cellIdentifier)
        }

        let poi: AMapPOI = self.searchPoiArray[indexPath.row]
        cell!.textLabel?.text = poi.name
        cell!.detailTextLabel?.text = poi.city + poi.address

        if self.selectedIndexPath != nil && self.selectedIndexPath?.section == indexPath.section && self.selectedIndexPath?.row == indexPath.row {
            cell!.accessoryType = .checkmark
        }
        else {
            cell!.accessoryType = .none
        }
        return cell!
    }


}
