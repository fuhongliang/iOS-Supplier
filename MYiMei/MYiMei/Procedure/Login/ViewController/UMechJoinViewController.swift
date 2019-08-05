//
//  UMechJoinViewController.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/1.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import Photos
import TLPhotoPicker

class UMechJoinViewController: UBaseViewController,TLPhotosPickerViewControllerDelegate{
    var selectedAssets = [TLPHAsset]()
    let mMchJoinView = UMchJoinView()
    var choosePicType = Int()
    var logoPath = String()
    var storeBgPath = String()
    var storeLicensePath = String()
    var service: APIUserServices = APIUserServices()
    var curLocation = LocationInfo()
    var categoryList = [CatModel]()
    var curCatIndex = 0

    override func configUI() {
        mMchJoinView.delegate = self
        mMchJoinView.setView()
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        scrollView.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        scrollView.addSubview(mMchJoinView)
        scrollView.showsVerticalScrollIndicator = false
        mMchJoinView.snp.updateConstraints { (make) -> Void in
            make.width.equalTo(screenWidth)
            make.height.equalTo(1000)
            make.top.equalTo(scrollView)
            make.leading.equalTo(scrollView)
            make.trailing.equalTo(scrollView)
            make.bottom.equalTo(scrollView)
        }
        scrollView.contentSize = CGSize(width: screenWidth, height: 1200)
        view.addSubview(scrollView)
        self.getApplyCat()
    }

    override func viewWillAppear(_ animated: Bool) {
        LocationHelper.shared.loadLocationFromCache()
        if(LocationHelper.shared.location != nil){
            curLocation = LocationHelper.shared.location!
            let mStringAddress = curLocation.province! + curLocation.city! + curLocation.district!
            self.mMchJoinView.storeAddressBtn.setTitle(mStringAddress, for: UIControl.State.normal)
            self.mMchJoinView.storeAddressEdit.text = curLocation.addresss
        }
        configNavigationBar()
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

                switch choosePicType {
                case 0:
                    self.mMchJoinView.storeLogoBtn.setBackgroundImage(image, for: UIControl.State.normal)
                case 1:
                    self.mMchJoinView.storeBgBtn.setBackgroundImage(image, for: UIControl.State.normal)
                default:
                    self.mMchJoinView.storeLicenseBtn.setBackgroundImage(image, for: UIControl.State.normal)
                }

                self.uploadPic()
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
                                switch self!.choosePicType {
                                case 0:
                                    self!.mMchJoinView.storeLogoBtn.setBackgroundImage(image, for: UIControl.State.normal)
                                case 1:
                                    self!.mMchJoinView.storeBgBtn.setBackgroundImage(image, for: UIControl.State.normal)
                                default:
                                    self!.mMchJoinView.storeLicenseBtn.setBackgroundImage(image, for: UIControl.State.normal)
                                }

                                self!.uploadPic()
                            }
                        }
                })
            }
        }
    }

    func getApplyCat(){
        service.getApplyCat({ (ApplyCatModel) in
            self.categoryList = ApplyCatModel.data!
        }, { (APIErrorModel) in
            showHUDInView(text: APIErrorModel.msg!, inView: self.view)
        })
    }

    func uploadPic(){
        switch choosePicType {
        case 0:
            // 获取图片
            let image = ImagePressHelper.init().resizeImage(originalImg: self.mMchJoinView.storeLogoBtn.backgroundImage(for: UIControl.State.normal)!)
            // 将图片转化成Data
            let imageData = ImagePressHelper.init().compressImageSize(image: image)
            // 将Data转化成 base64的字符串
            let imageBase64String = imageData.base64EncodedString()
            service.uploadPic(ext: "jpg", type: "image", size:imageData.count , image: imageBase64String , { (UploadFileResponeModel) in
                self.logoPath =  UploadFileResponeModel.data?.url ?? ""
            }) { (APIErrorModel) in
                showHUDInView(text: APIErrorModel.msg!, inView: self.view)
            }
        case 1:
            // 获取图片
            let image = ImagePressHelper.init().resizeImage(originalImg: self.mMchJoinView.storeBgBtn.backgroundImage(for: UIControl.State.normal)!)
            // 将图片转化成Data
            let imageData = ImagePressHelper.init().compressImageSize(image: image)
            // 将Data转化成 base64的字符串s
            let imageBase64String = imageData.base64EncodedString()
            service.uploadPic(ext: "jpg", type: "image", size:imageData.count , image: imageBase64String , { (UploadFileResponeModel) in
                self.storeBgPath =  UploadFileResponeModel.data?.url ?? ""
            }) { (APIErrorModel) in
                showHUDInView(text: APIErrorModel.msg!, inView: self.view)
            }
        default:
            // 获取图片
            let image = ImagePressHelper.init().resizeImage(originalImg: self.mMchJoinView.storeLicenseBtn.backgroundImage(for: UIControl.State.normal)!)
            // 将图片转化成Data
            let imageData = ImagePressHelper.init().compressImageSize(image: image)
            // 将Data转化成 base64的字符串s
            let imageBase64String = imageData.base64EncodedString()
            service.uploadPic(ext: "jpg", type: "image", size:imageData.count , image: imageBase64String , { (UploadFileResponeModel) in
                self.storeLicensePath =  UploadFileResponeModel.data?.url ?? ""
            }) { (APIErrorModel) in
                showHUDInView(text: APIErrorModel.msg!, inView: self.view)
            }
        }
    }
}


extension UMechJoinViewController: UMchJoinViewDelegate,TLPhotosPickerLogDelegate {

    func tapChooseStoreClassAction() {
        // Simple Option Picker
        var dummyList = [String]()
        for item in categoryList{
            dummyList.append(item.name!)
        }
        // Simple Option Picker with selected index

        RPicker.selectOption(title: "", hideCancel: true, dataArray: dummyList, selectedIndex: 0) { (selctedText, atIndex) in
            self.curCatIndex = atIndex
            self.mMchJoinView.storeCategoryBtn.setTitle(selctedText, for: UIControl.State.normal)
        }
    }

    func tapChooseStoreAddressAction() {
        let vc = UChooseAddressFromMap()
        vc.title = "店铺地址"
        navigationController?.pushViewController(vc, animated: true)
    }

    func tapPushApply(contactName: String, phoneNumber: String, storeName: String, storeClass: String, storeAddress: String, serviceTel: String) {
        guard contactName.count > 0 else {
            showHUDInView(text: "请输入联系人", inView: view)
            return
        }

        guard phoneNumber.count == 11 else {
            showHUDInView(text: "请输入有效手机号码", inView: view)
            return
        }

        guard storeName.count > 0 else {
            showHUDInView(text: "请输入店铺名称", inView: view)
            return
        }

        guard storeClass.count > 0 else {
            showHUDInView(text: "请选择店铺分类", inView: view)
            return
        }

//        guard self.mMchJoinView.storeAddressBtn.currentTitle!.count > 0 else {
//            showHUDInView(text: "请选择店铺地址", inView: view)
//            return
//        }

        guard storeAddress.count > 0 else {
            showHUDInView(text: "请选择填写店铺详细地址", inView: view)
            return
        }

        guard serviceTel.count > 0 else {
            showHUDInView(text: "请输入客服电话", inView: view)
            return
        }

        guard logoPath.count > 0 else {
            showHUDInView(text: "请选择店铺Logo", inView: view)
            return
        }

        guard storeBgPath.count > 0 else {
            showHUDInView(text: "请选择店铺背景图", inView: view)
            return
        }

        guard storeLicensePath.count > 0 else {
            showHUDInView(text: "请选择营业执照", inView: view)
            return
        }

        let mchApply = MchApplyModel()
        mchApply.username = phoneNumber
        mchApply.password = String(phoneNumber.suffix(6))
        mchApply.tel = phoneNumber
        mchApply.realname = contactName
        mchApply.name = storeName

        mchApply.province = curLocation.province ?? "广东省"
        mchApply.city = curLocation.city ?? "深圳市"
        mchApply.district = curLocation.district ?? "宝安区"
        mchApply.longitude = curLocation.longitude
        mchApply.latitude = curLocation.latitude
        mchApply.mch_common_cat_id = String(categoryList[curCatIndex].id)
        mchApply.address = storeAddress
        mchApply.service_tel = serviceTel
        mchApply.logo = logoPath
        mchApply.header_bg = storeBgPath
        mchApply.business_license = storeLicensePath

        service.applyJoin(mchApplyModel: mchApply, { (MchApplyResponeModel) in
            let vc = UReviewControiller()
            vc.title = "资料审核"
            self.navigationController?.pushViewController(vc, animated: true)
        }) { (APIErrorModel) in
            showHUDInView(text: APIErrorModel.msg ?? "提交失败", inView: self.view)
        }

    }


    func selectedCameraCell(picker: TLPhotosPickerViewController) {

    }

    func deselectedPhoto(picker: TLPhotosPickerViewController, at: Int) {

    }

    func selectedPhoto(picker: TLPhotosPickerViewController, at: Int) {

    }

    func selectedAlbum(picker: TLPhotosPickerViewController, title: String, at: Int) {

    }

    func tapChooseStoreLogoPicAction() {
        choosePicType = 0
        self.tapChoosePicAction()
    }

    func tapChooseStoreBgPicAction() {
        choosePicType = 1
        self.tapChoosePicAction()
    }

    func tapChooseLicensePicAction() {
        choosePicType = 2
        self.tapChoosePicAction()
    }
}
