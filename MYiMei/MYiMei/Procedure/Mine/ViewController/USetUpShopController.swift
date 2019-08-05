//
//  USetUpShopController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/5.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import Photos
import TLPhotoPicker

class USetUpShopController: UBaseViewController ,TLPhotosPickerViewControllerDelegate{
    var selectedAssets = [TLPHAsset]()
    fileprivate var services = APIUserServices()
    private lazy var myArray: Array = {
        return [
            [
                ["instructions":"店铺名字","content":mchModel.name],
                ["instructions":"店铺分类","content":mchModel.cat_name]
            ],
            [
                ["instructions":"店铺头像","content":mchModel.logo],
                ["instructions":"联系人","content":mchModel.realname],
                ["instructions":"联系电话","content":mchModel.tel],
                ["instructions":"客服电话","content":mchModel.service_tel],
                ["instructions":"所在地区","content":mchModel.region],
                ["instructions":"详细地址","content":mchModel.address]
            ],
            [
                ["instructions":"店铺背景（顶部）","content":mchModel.header_bg]
            ]
        ]
    }()
    
    var mchModel = MchModel()
    var logoPath = String()
    var storeBgPath = String()
    var chooseLogoPic = true
    
    lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .grouped)
        tw.backgroundColor = UIColor.background
        tw.separatorInset = UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 0)
        tw.delegate = self
        tw.dataSource = self
        tw.register(cellType: UShopLabelCell.self)
        tw.register(cellType: UShopLabelImgCell.self)
        tw.register(cellType: UShopLabelNotArrowCell.self)
        return tw
    }()
    
    var title：String = "店铺设置"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.configNavigationBar()
        getStoreInfo()
    }
    
    func getStoreInfo() {
        services.storeInfo({ (StoreInfoModel) in
            self.mchModel = StoreInfoModel.data.mch!
            self.myArray = self.getArrayData(mchModel: StoreInfoModel.data.mch!)
            self.tableView.reloadData()
        }) { (APIErrorModel) in
            showHUDInView(text: APIErrorModel.msg!, inView: self.view)
        }
    }
    
    
    func getArrayData(mchModel: MchModel) -> Array<Array<Dictionary<String, String>>>{
        
        return [
            [
                ["instructions":"店铺名字","content":mchModel.name ?? ""],
                ["instructions":"店铺分类","content":mchModel.cat_name ?? ""]
            ],
            [
                ["instructions":"店铺头像","content":mchModel.logo],
                ["instructions":"联系人","content":mchModel.realname ?? ""],
                ["instructions":"联系电话","content":mchModel.tel ?? ""],
                ["instructions":"客服电话","content":mchModel.service_tel ?? ""],
                ["instructions":"所在地区","content":mchModel.region ?? ""],
                ["instructions":"详细地址","content":mchModel.address ?? ""]
            ],
            [
                ["instructions":"店铺背景（顶部）","content":mchModel.header_bg]
            ]
        ]
    }
    
    func tapChoosePicAction() {
        let viewController = CustomPhotoPickerViewController()
        viewController.delegate = self
        viewController.didExceedMaximumNumberOfSelection = { [weak self] (picker) in
            self?.showExceededMaximumAlert(vc: picker)
        }
        var configure = TLPhotosPickerConfigure()
        configure.numberOfColumn = 3
        configure.allowedVideo = false
        configure.singleSelectedMode = true
        viewController.configure = configure
        viewController.selectedAssets = self.selectedAssets
        viewController.logDelegate = self
        self.present(viewController, animated: true, completion: nil)
    }
    
    
    func showExceededMaximumAlert(vc: UIViewController) {
        let alert = UIAlertController(title: "", message: "Exceed Maximum Number Of Selection", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    
    func dismissPhotoPicker(withTLPHAssets: [TLPHAsset]) {
        self.selectedAssets = withTLPHAssets
        getFirstSelectedImage()
        //iCloud or video
        //getAsyncCopyTemporaryFile()
    }
    
    func getAsyncCopyTemporaryFile() {
        if let asset = self.selectedAssets.first {
            asset.tempCopyMediaFile(convertLivePhotosToJPG: false, progressBlock: { (progress) in
                print(progress)
            }, completionBlock: { (url, mimeType) in
                print("completion\(url)")
                print(mimeType)
            })
        }
    }
    
    func getFirstSelectedImage() {
        if let asset = self.selectedAssets.first {
            if let image = asset.fullResolutionImage {
                self.uploadPic(originalImg: image)
            }else {
                print("Can't get image at local storage, try download image")
                asset.cloudImageDownload(progressBlock: { [weak self] (progress) in
                    DispatchQueue.main.async {
                        print(progress)
                    }
                    }, completionBlock: { [weak self] (image) in
                        if let image = image {
                            //use image
                            DispatchQueue.main.async {
                                self!.uploadPic(originalImg:image)
                            }
                        }
                })
            }
        }
    }
        
        func uploadPic(originalImg:UIImage){
            // 获取图片
            let image = ImagePressHelper.init().resizeImage(originalImg: originalImg)
            // 将图片转化成Data
            let imageData = ImagePressHelper.init().compressImageSize(image: image)
            // 将Data转化成 base64的字符串
            let imageBase64String = imageData.base64EncodedString()
            services.uploadPic(ext: "jpg", type: "image", size:imageData.count , image: imageBase64String , { (UploadFileResponeModel) in
                if(self.chooseLogoPic){
                    self.logoPath =  UploadFileResponeModel.data?.url ?? ""
                    self.updataStorePic(param: "logo",mContent: self.logoPath)
                }else{
                    self.storeBgPath =  UploadFileResponeModel.data?.url ?? ""
                    self.updataStorePic(param: "header_bg",mContent: self.storeBgPath)
                }
               
            }) { (APIErrorModel) in
                showHUDInView(text: APIErrorModel.msg!, inView: self.view)
            }
        }
    
    func updataStorePic(param:String,mContent:String) {
        services.modifyStoreInfo(param: param, paramValue: mContent, {
            showHUDInView(text: "修改成功", inView: self.view)
            
            if(self.chooseLogoPic){
                self.mchModel.logo = mContent
            }else{
               self.mchModel.header_bg = mContent
            }
            
            self.getArrayData(mchModel: self.mchModel)
            
            self.tableView.reloadData()
        }, { (APIErrorModel) in
            showHUDInView(text: APIErrorModel.msg!, inView: self.view)
        })
    }
    
}


extension USetUpShopController: UITableViewDelegate, UITableViewDataSource,TLPhotosPickerLogDelegate{
    func selectedCameraCell(picker: TLPhotosPickerViewController) {
        
    }
    
    func deselectedPhoto(picker: TLPhotosPickerViewController, at: Int) {
        
    }
    
    func selectedPhoto(picker: TLPhotosPickerViewController, at: Int) {
        
    }
    
    func selectedAlbum(picker: TLPhotosPickerViewController, title: String, at: Int) {
        
    }
    
    //MARK:cell组数
    func numberOfSections(in tableView: UITableView) -> Int {
        return myArray.count
    }
    
    //MARK:cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0){
            if(indexPath.section == 1 || indexPath.section == 2){
                return 55
            }else{
                 return 44
            }
        }else{
             return 44
        }
    }
    
    //MARK:每组cell的数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionArray = myArray[section]
        return sectionArray.count
    }
    
    //MARK:cell数量
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    //MARK:返回每个cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 1){
            if(indexPath.row == 0){
                let cell = getImgCell(cellForRowAt: indexPath)
                
                return cell
            } else if(indexPath.row == 4) {
                let cell = getLabelNotArrowCell(cellForRowAt: indexPath)
                cell.selectionStyle = .none
                return cell
            } else{
                let cell = getLabelCell(cellForRowAt: indexPath)
                return cell
            }
          
        } else if (indexPath.section == 2){
            let cell = getImgCell(cellForRowAt: indexPath)
            //图片数据对应没写
            return cell
        } else {
            if (indexPath.row == 1) {
                let cell = getLabelNotArrowCell(cellForRowAt: indexPath)
                cell.selectionStyle = .none
                //店铺信息没写
                return cell
            } else {
                let cell = getLabelCell(cellForRowAt: indexPath)
                //店铺信息没写
                return cell
            }
        }
        
    }
    
    //MARK:点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if(indexPath.row == 0){
            if(indexPath.section != 0){
                //跳转去选择图片
                if(indexPath.section == 1){
                    chooseLogoPic = true
                     self.tapChoosePicAction()
                }else{
                    chooseLogoPic = false
                     self.tapChoosePicAction()
                }
            }else{
                //跳转去修改店铺名字
                let sectionArray = myArray[indexPath.section]
                let dict: [String: String] = sectionArray[indexPath.row] as! [String : String]
                let vc = UModifySetUpShopController(paramIndex: indexPath.row, paramValue:  dict["content"] ?? "")
                vc.title = dict["instructions"]
                navigationController?.pushViewController(vc, animated: true)
            }
        }else {
            if(indexPath.section == 0 && indexPath.row == 1){
                //不做处理
            }else if(indexPath.section == 1 && indexPath.row == 4){
                //不作处理
            }else{
                let sectionArray = myArray[indexPath.section]
                let dict: [String: String] = sectionArray[indexPath.row] as! [String : String]
                let vc = UModifySetUpShopController(paramIndex: indexPath.row, paramValue:  dict["content"] ?? "")
                vc.title = dict["instructions"]
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section==1 ? 44 : 20
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if (section == 1) {
            let tipView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: tableView.frame.size.height))
            let tipLabel = UILabel()
            tipView.addSubview(tipLabel)
            tipLabel.text = "店铺背景建议尺寸750*300px"
            tipLabel.textColor = UIColor.hex(hexString: "#808080")
            tipLabel.font = UIFont.systemFont(ofSize: 14)
            tipLabel.snp.makeConstraints { (ConstraintMaker) in
                ConstraintMaker.top.equalToSuperview().offset(20)
                ConstraintMaker.left.equalToSuperview().offset(15)
            }
            return tipView
        }
        return nil
    }
    
    //MARK:获取带箭头的文本cell
    func getLabelCell(cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UShopLabelCell.self)
        cell.selectionStyle = .default
        let sectionArray = myArray[indexPath.section]
        let dict = sectionArray[indexPath.row]
        cell.instructionsLabel.text = dict["instructions"] ?? ""
        cell.contentLabel.text = dict["content"] ?? ""
        return cell
    }
    
    //MARK:获取不带箭头的文本cell
    func getLabelNotArrowCell(cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UShopLabelNotArrowCell.self)
        cell.selectionStyle = .default
        let sectionArray = myArray[indexPath.section]
        let dict = sectionArray[indexPath.row]
        cell.instructionsLabel.text = dict["instructions"] ?? ""
        cell.contentLabel.text = dict["content"] ?? ""
        return cell
    }
    
    //MARK:获取带图片和箭头的文本cell
    func getImgCell(cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UShopLabelImgCell.self)
        cell.selectionStyle = .default
        let sectionArray = myArray[indexPath.section]
        let dict = sectionArray[indexPath.row]
        cell.instructionsLabel.text = dict["instructions"] ?? ""
        if let uul = dict["content"] {
            let url = URL(string: uul ?? "")
            cell.shopImg.kf.setImage(with: url)
        }
        return cell
    }
}
