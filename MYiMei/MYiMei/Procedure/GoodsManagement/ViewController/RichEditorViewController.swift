//
//  RichEditorViewController.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/7/24.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import RichEditorView
import Photos
import TLPhotoPicker

let htmlhead =  "<!DOCTYPE html>" +
    "<html>" +
    "<head>" +
    "<meta charset=\"UTF-8\">" +
    "<style type=\"text/css\">" +
    "html{margin:0;padding:0;}" +
    "body {" +
    "margin: 0;" +
    "padding: 0;" +
    "}" +
    "img{" +
    "width: 100%;" +
    "height: auto;" +
    "display: block;" +
    "margin-left: auto;" +
    "margin-right: auto;" +
    "}" +
    "</style>" +
"</head>"


class RichEditorViewController: UBaseViewController ,TLPhotosPickerViewControllerDelegate{
    var service: APIUserServices = APIUserServices()

    var selectedAssets = [TLPHAsset]()

    var goodsDescrView = UGoodsDescrView()

    var image = UIImage()

    //var htmlTextView: UITextView!
    var htmlText = String()

    lazy var toolbar: RichEditorToolbar = {
        let toolbar = RichEditorToolbar(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 44))
        let all: [RichEditorDefaultOption] = [
            .bold,.header(1), .header(2), .header(3),
            .unorderedList,
            .alignLeft, .alignCenter, .alignRight,.image
        ]
        toolbar.options = all

        return toolbar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        goodsDescrView.configUI()
        
        self.view.addSubview(goodsDescrView)

        goodsDescrView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.bottom.equalToSuperview().offset(screenHeight/2)
        }

        goodsDescrView.editorView.delegate = self
        goodsDescrView.editorView.inputAccessoryView = toolbar
        goodsDescrView.editorView.placeholder = "请输入商品描述"
        if(!getGoodsDescr().isEmpty){
            htmlText = getGoodsDescr()
            goodsDescrView.editorView.html = htmlhead + htmlText
        }
        toolbar.delegate = self
        toolbar.editor = goodsDescrView.editorView
        let btnItem = UIBarButtonItem.init(title: "保存", style: .plain, target: self, action: #selector(tapAddDescrAction))
        btnItem.tintColor = UIColor.white
        btnItem.width = 60
        navigationItem.rightBarButtonItem = btnItem
    }

    //MARK:保存商品描述
    @objc func tapAddDescrAction() {
        saveGoodsDescr(goodsDescr: htmlText)
        pressBack()
    }


    func choosePicAction() {
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
            if let imageView = asset.fullResolutionImage {
//                self.goodsDetailView.addGoodsCoverPic.setBackgroundImage(image, for: UIControl.State.normal)
                self.image = imageView
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
//                                self!.goodsDetailView.addGoodsCoverPic.setBackgroundImage(image, for: UIControl.State.normal)
                                self!.image = image
                                self!.uploadPic()
                            }
                        }
                })
            }
        }
    }

    func uploadPic(){
        // 获取图片
//        let image = ImagePressHelper.init().resizeImage(originalImg:self.goodsDetailView.addGoodsCoverPic.backgroundImage(for: UIControl.State.normal)!)

        // 将图片转化成Data
        let imageData = ImagePressHelper.init().compressImageSize(image: self.image)
        // 将Data转化成 base64的字符串
        let imageBase64String = imageData.base64EncodedString()
        service.uploadPic(ext: "jpg", type: "image", size:imageData.count , image: imageBase64String , { (UploadFileResponeModel) in

            self.toolbar.editor?.insertImage(UploadFileResponeModel.data?.url ?? "", alt: "")

        }) { (APIErrorModel) in
            showHUDInView(text: APIErrorModel.msg!, inView: self.view)
        }
    }

}

extension RichEditorViewController: RichEditorDelegate {

    func richEditor(_ editor: RichEditorView, contentDidChange content: String) {
        if content.isEmpty {
           htmlText = ""
        } else {
           htmlText = content
        }
    }

}

extension RichEditorViewController: RichEditorToolbarDelegate ,TLPhotosPickerLogDelegate{

    fileprivate func randomColor() -> UIColor {
        let colors: [UIColor] = [
            .red,
            .orange,
            .yellow,
            .green,
            .blue,
            .purple
        ]

        let color = colors[Int(arc4random_uniform(UInt32(colors.count)))]
        return color
    }

    func richEditorToolbarChangeTextColor(_ toolbar: RichEditorToolbar) {
        let color = randomColor()
        toolbar.editor?.setTextColor(color)
    }

    func richEditorToolbarChangeBackgroundColor(_ toolbar: RichEditorToolbar) {
        let color = randomColor()
        toolbar.editor?.setTextBackgroundColor(color)
    }

    func richEditorToolbarInsertImage(_ toolbar: RichEditorToolbar) {
        choosePicAction()
    }

    func richEditorToolbarInsertLink(_ toolbar: RichEditorToolbar) {
        // Can only add links to selected text, so make sure there is a range selection first
        if toolbar.editor?.hasRangeSelection == true {
            toolbar.editor?.insertLink("http://github.com/cjwirth/RichEditorView", title: "Github Link")
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
}
