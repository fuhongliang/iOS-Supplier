//
//  UDepostPostController.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/7/11.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import Photos
import TLPhotoPicker

class UDepostPostController: UBaseViewController,TLPhotosPickerViewControllerDelegate{
    var selectedAssets = [TLPHAsset]()
    let mUDepostView = UDepost()
    var picPath = String()
    var userService: APIUserServices = APIUserServices()
    var storeService: APIStoreServices = APIStoreServices()
    
    override func configUI() {
        mUDepostView.delegate = self
        mUDepostView.setView()
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        scrollView.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        scrollView.addSubview(mUDepostView)
        scrollView.showsVerticalScrollIndicator = false
        mUDepostView.snp.updateConstraints { (make) -> Void in
            make.width.equalTo(screenWidth)
            make.height.equalTo(1000)
            make.top.equalTo(scrollView)
            make.leading.equalTo(scrollView)
            make.trailing.equalTo(scrollView)
            make.bottom.equalTo(scrollView)
        }
        scrollView.contentSize = CGSize(width: screenWidth, height: 1200)
        view.addSubview(scrollView)
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
                self.mUDepostView.uploadPicBtn.setBackgroundImage(image, for: UIControl.State.normal)
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
                                self!.mUDepostView.uploadPicBtn.setBackgroundImage(image, for: UIControl.State.normal)
                                self!.uploadPic()
                            }
                        }
                })
            }
        }
    }


    func uploadPic(){
        // 获取图片
        let image = ImagePressHelper.init().resizeImage(originalImg: self.mUDepostView.uploadPicBtn.backgroundImage(for: UIControl.State.normal)!)
        // 将图片转化成Data
        let imageData = ImagePressHelper.init().compressImageSize(image: image)
        // 将Data转化成 base64的字符串
        let imageBase64String = imageData.base64EncodedString()
        userService.uploadPic(ext: "jpg", type: "image", size:imageData.count , image: imageBase64String , { (UploadFileResponeModel) in
            self.picPath =  UploadFileResponeModel.data?.url ?? ""
        }) { (APIErrorModel) in
            showHUDInView(text: APIErrorModel.msg!, inView: self.view)
        }
    }
}


extension UDepostPostController: UDepostViewDelegate,TLPhotosPickerLogDelegate {
    func choosePicAction() {
        self.tapChoosePicAction()
    }

    func tapPush(money: String) {
        guard money.count > 0 else {
            showHUDInView(text: "请输入金额", inView: view)
            return
        }

        guard picPath.count > 0 else {
            showHUDInView(text: "请选择转账凭证", inView: view)
            return
        }

        storeService.pushDepost(image_url: picPath, price: money, { (StoreDepostReponseModel) in
            let vc = UMyDepostController()
            vc.title = "我的保证金"
            self.navigationController?.pushViewController(vc, animated: true)
        }, { (APIErrorModel) in
            showHUDInView(text: APIErrorModel.msg ?? "提交失败", inView: self.view)
        })
    }



    func selectedCameraCell(picker: TLPhotosPickerViewController) {

    }

    func deselectedPhoto(picker: TLPhotosPickerViewController, at: Int) {

    }

    func selectedPhoto(picker: TLPhotosPickerViewController, at: Int) {

    }

    func selectedAlbum(picker: TLPhotosPickerViewController, title: String, at: Int) {

    }


}
