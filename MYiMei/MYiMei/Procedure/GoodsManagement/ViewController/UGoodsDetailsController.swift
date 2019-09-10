//
//  UGoodsDetailsController.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/27.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import Photos
import TLPhotoPicker

class UGoodsDetailsController: UBaseViewController ,TLPhotosPickerViewControllerDelegate{
    
    //MARK:是否是添加商品
    var isAddGoods:Bool = true
    
    fileprivate var goodsService: APIGoodsServices = APIGoodsServices()
    var service: APIUserServices = APIUserServices()
    
    var cateList = [PlatCateModel]()
    
    var goodscateList = [CategoryModel]()
    
    var curCatIndex = 0
    
    var curGoodsCatIndex = 0
    
    var choosePicType = Int()
    var selectedAssets = [TLPHAsset]()
    
    var goodsDetail = GoodsDetailModel()
    
    let goodsDetailView = UGoodsDetailView()
    
    var tagBtnSet = [UIButton:String]()
    
    var serviceTag = String()
    
    var coverPic = String()
    
    var goodsPic = String()
    
    var goodsPicArray = [String]()
    
    var serviceArray = [String]()
    
    var plat_cat_id = 0
    
    var goods_cat_id = 0
    
    var goods_id = 0
    
    var goodsDetailModel = GoodsDetail()
    
    var attrData = AttrArray()//规格数据
    var attrGroup = SetAttrDataModel()//规格组数据
    
    //初始化
    convenience init(goodscateList:[CategoryModel]?,goodsId:Int) {
        self.init()
        self.goodscateList = goodscateList!
        self.goods_id = goodsId
    }
    
    override func configUI() {
        goodsDetailView.configUI()
        goodsDetailView.delegate = self
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        scrollView.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        scrollView.addSubview(goodsDetailView)
        scrollView.showsVerticalScrollIndicator = false
        goodsDetailView.snp.updateConstraints { (make) -> Void in
            make.width.equalTo(screenWidth)
            make.height.equalTo(1300)
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        scrollView.contentSize = CGSize(width: screenWidth, height: 1300)
        view.addSubview(scrollView)
        self.goodsDetailView.choosegoodsClassBtn.setTitle(goodscateList[curGoodsCatIndex].name!, for: UIControl.State.normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .top
        getPlatCat()
        if(goods_id != 0){
            loadGoodsDetailData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.configNavigationBar()
        if(getGoodsDescr().isEmpty){
            self.goodsDetailView.goodsDescrBtn.setTitle("请添加商品描述", for: UIControl.State.normal)
        }else{
            self.goodsDetailView.goodsDescrBtn.setTitle("已添加", for: UIControl.State.normal)
        }
        self.goodsDetailView.picData = self.goodsPicArray
    }
    
    //MARK:获取商品详情
    @objc private func loadGoodsDetailData() {
        let mch_id: Int = APIUser.shared.user!.mch_id ?? 0
        let access_token: String = getToken()
        goodsService.getGoodsDetail(mch_id: mch_id, goods_id: goods_id, access_token: access_token, { (GoodsDetailResponeModel) in
            self.goodsDetailModel = GoodsDetailResponeModel.data!.goods!
            saveGoodsDescr(goodsDescr: self.goodsDetailModel.detail ?? "")
            self.setViewData()
        }, { (APIErrorModel) in
            showHUDInView(text: APIErrorModel.msg ?? "获取商品详情失败", inView: self.view)
        })
    }
    
    //MARK:设置商品数据
    func setViewData(){
        //MARK:商品名称
        self.goodsDetailView.goodsNameTF.text = goodsDetailModel.goods_name
        
        if(getGoodsDescr().isEmpty){
            self.goodsDetailView.goodsDescrBtn.setTitle("请添加商品描述", for: UIControl.State.normal)
        } else {
            self.goodsDetailView.goodsDescrBtn.setTitle("已添加", for: UIControl.State.normal)
        }
        
        //MARK:商品缩略图
        let image = UIImageView()
        image.kf.setImage(with: URL(string: goodsDetailModel.cover_pic!))
        self.goodsDetailView.addGoodsCoverPic.setBackgroundImage(image.image, for: UIControl.State.normal)
        self.coverPic = goodsDetailModel.cover_pic!
        
        //MARK:商品图片
        refreshPicList(list:goodsDetailModel.goods_pic!)
        
        
        self.goodsDetailView.choosegoodsClassBtn.setTitle(getGoodsCat(cat_id: goodsDetailModel.goods_cat_id ?? 0), for: UIControl.State.normal)
        self.goodsDetailView.choosePlatformClassBtn.setTitle(getPaltCat(cat_id: goodsDetailModel.goods_cat_id ?? 0), for: UIControl.State.normal)
        
        self.goodsDetailView.unitClassTF.text = goodsDetailModel.unit
        self.goodsDetailView.weightTF.text = String(goodsDetailModel.weight)
        self.goodsDetailView.originalPriceTF.text = goodsDetailModel.original_price
        self.goodsDetailView.goodsPriceTF.text = goodsDetailModel.price
        self.goodsDetailView.amountTF.text = String(goodsDetailModel.goods_num)
        
        self.goodsDetailView.piecesDesrcTF.text = goodsDetailModel.full_cut?.pieces
        self.goodsDetailView.foreDesrcTF.text = goodsDetailModel.full_cut?.forehead
        
        self.serviceArray = goodsDetailModel.service!.components(separatedBy: ",")
        self.serviceTag = goodsDetailModel.service!
        if(self.serviceArray.count>0){
            for service in self.serviceArray{
                if(service == self.goodsDetailView.doorDeliveryTagBtn.titleLabel?.text!){
                    tagBtnSet.updateValue(service + ",", forKey: self.goodsDetailView.doorDeliveryTagBtn)
                    self.goodsDetailView.doorDeliveryTagBtn.isSelected = true
                }
                if(service == self.goodsDetailView.professionalInstallationTagBtn.titleLabel?.text!){
                    tagBtnSet.updateValue(service + ",", forKey: self.goodsDetailView.professionalInstallationTagBtn)
                    self.goodsDetailView.professionalInstallationTagBtn.isSelected = true
                }
                if(service == self.goodsDetailView.doorReturnTagBtn.titleLabel?.text!){
                    tagBtnSet.updateValue(service + ",", forKey: self.goodsDetailView.doorReturnTagBtn)
                    self.goodsDetailView.doorReturnTagBtn.isSelected = true
                }
                
                if(service == self.goodsDetailView.qualityAssuranceCommitmentTagBtn.titleLabel?.text!){
                    tagBtnSet.updateValue(service + ",", forKey: self.goodsDetailView.qualityAssuranceCommitmentTagBtn)
                    self.goodsDetailView.qualityAssuranceCommitmentTagBtn.isSelected = true
                }
                
                if(service == self.goodsDetailView.realThingReleasedTagBtn.titleLabel?.text!){
                    tagBtnSet.updateValue(service + ",", forKey: self.goodsDetailView.realThingReleasedTagBtn)
                    self.goodsDetailView.realThingReleasedTagBtn.isSelected = true
                }
                
                if(service == self.goodsDetailView.newPreferentialTagBtn.titleLabel?.text!){
                    tagBtnSet.updateValue(service + ",", forKey: self.goodsDetailView.newPreferentialTagBtn)
                    self.goodsDetailView.newPreferentialTagBtn.isSelected = true
                }
                if(service == self.goodsDetailView.restAssuredBuyTagBtn.titleLabel?.text!){
                    tagBtnSet.updateValue(service + ",", forKey: self.goodsDetailView.restAssuredBuyTagBtn)
                    self.goodsDetailView.restAssuredBuyTagBtn.isSelected = true
                }
            }
        }
        
    }
    
    //MARK:获取商品分类
    func getGoodsCat(cat_id:Int) -> String {
        for categoryModel in goodscateList{
            if(categoryModel.id == cat_id){
                return categoryModel.name ?? ""
            }
        }
        return ""
    }
    
    //MARK:获取平台分类
    func getPaltCat(cat_id:Int) -> String {
        for platCateModel in cateList{
            if(platCateModel.id == cat_id){
                return platCateModel.name ?? ""
            }
        }
        return ""
    }
    
    //MARK:选择图片
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
    
    //MARK:显示超过最大警告
    func showExceededMaximumAlert(vc: UIViewController) {
        let alert = UIAlertController(title: "", message: "Exceed Maximum Number Of Selection", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    
    //MARK:隐藏照片选择
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
                    self.goodsDetailView.addGoodsCoverPic.setBackgroundImage(image, for: UIControl.State.normal)
                    break
                case 1:
                    self.goodsDetailView.addGoodsPic.setBackgroundImage(image, for: UIControl.State.normal)
                    break
                default:
                    break
                }
                
                self.uploadPic()
            }else {
                print("Can't get image at local storage, try download image")
                asset.cloudImageDownload(progressBlock: {/* [weak self]*/ (progress) in
                    DispatchQueue.main.async {
                        print(progress)
                    }
                }, completionBlock: { [weak self] (image) in
                    if let image = image {
                        //use image
                        DispatchQueue.main.async {
                            switch self!.choosePicType {
                            case 0:
                                self!.goodsDetailView.addGoodsCoverPic.setBackgroundImage(image, for: UIControl.State.normal)
                                break
                            case 1:
                                self!.goodsDetailView.addGoodsPic.setBackgroundImage(image, for: UIControl.State.normal)
                                break
                            default:
                                break
                            }
                            
                            self!.uploadPic()
                        }
                    }
                })
            }
        }
    }
    
    func getPlatCat(){
        goodsService.getMchPtCats({ (PlatCateResponeModel) in
            self.cateList = PlatCateResponeModel.data!.pt_cats!
            self.goodsDetailView.choosePlatformClassBtn.setTitle(self.cateList[self.curCatIndex].name!, for: UIControl.State.normal)
        }, { (APIErrorModel) in
            showHUDInView(text: APIErrorModel.msg!, inView: self.view)
        })
    }
    
    //MARK:上传图片
    func uploadPic(){
        switch choosePicType {
        case 0:
            // 获取图片
            let image = ImagePressHelper.init().resizeImage(originalImg:self.goodsDetailView.addGoodsCoverPic.backgroundImage(for: UIControl.State.normal)!)
            // 将图片转化成Data
            let imageData = ImagePressHelper.init().compressImageSize(image: image)
            // 将Data转化成 base64的字符串
            let imageBase64String = imageData.base64EncodedString()
            service.uploadPic(ext: "jpg", type: "image", size:imageData.count , image: imageBase64String , { (UploadFileResponeModel) in
                self.coverPic =  UploadFileResponeModel.data?.url ?? ""
            }) { (APIErrorModel) in
                showHUDInView(text: APIErrorModel.msg!, inView: self.view)
            }
            break
        case 1:
            // 获取图片
            let image = ImagePressHelper.init().resizeImage(originalImg: self.goodsDetailView.addGoodsPic.backgroundImage(for: UIControl.State.normal)!)
            // 将图片转化成Data
            let imageData = ImagePressHelper.init().compressImageSize(image: image)
            // 将Data转化成 base64的字符串
            let imageBase64String = imageData.base64EncodedString()
            service.uploadPic(ext: "jpg", type: "image", size:imageData.count , image: imageBase64String , { (UploadFileResponeModel) in
                //                self.goodsPic = UploadFileResponeModel.data?.url ?? ""
                if let url = UploadFileResponeModel.data?.url {
                    self.refreshPicList(addOrdel: -1,url: url)
                }
            }) { (APIErrorModel) in
                showHUDInView(text: APIErrorModel.msg!, inView: self.view)
            }
            break
        default:
            
            break
        }
    }
    
    func refreshPicList(addOrdel:Int = -1, url:String = "",list:Array<String>? = nil){
        //如果传进来一个列表 替换整个列表
        guard list == nil else {
            self.goodsPicArray = list!
            goodsDetailView.picData = self.goodsPicArray
            return
        }
        if addOrdel == -1 {
            goodsPicArray.append(url)
        } else  {
            goodsPicArray.remove(at: addOrdel)
        }
        goodsDetailView.picData = self.goodsPicArray
    }
    
}

extension UGoodsDetailsController: UGoodsDetailViewDelegate,TLPhotosPickerLogDelegate,UChooseAttrControllerProtocol {
    func deletePic(_ index: Int) {
        refreshPicList(addOrdel: index)
    }
    
    //MARK:规格组和规格数据回传
    func attrDataBack(attrGroupData:SetAttrDataModel, attrArray: AttrArray) {
        attrGroup = attrGroupData
        attrData = attrArray
    }
    
    func tapAddGoodsDescrAction() {
        let vc = RichEditorViewController()
        vc.title = "编辑商品描述"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tapChooseAttrAction() {
        let vc = UChooseAttrController()
        vc.title = "商品规格"
        vc.attrDelegate = self
        
        if let attr_group_list = goodsDetailModel.attr_group_list {
            attrGroup.group.removeAll()
            for (_, item) in attr_group_list.enumerated() {
                var group = Group()
                group.groupName = item.attr_group_name
                for (_, j) in item.attr_list!.enumerated() {
                    var attr = AttrData()
                    attr.attrName = j.attr_name
                    group.attr.append(attr)
                }
                attrGroup.group.append(group)
            }
        }
        if let attr = goodsDetailModel.attr {
            attrData.attrValueArray.removeAll()
            for (_, item) in attr.enumerated() {
                var attrValueInfo = AttrValue()
                var attrName = ""
                for (i,j) in item.attr_list!.enumerated() {
                    if i == item.attr_list!.count-1{
                        attrName += j.attr_name
                    } else {
                        attrName += "\(j.attr_name)-"
                    }
                }
                attrValueInfo.attrName = attrName
                attrValueInfo.inventory = String(item.num)
                attrValueInfo.price = item.price
                attrValueInfo.goodsNumber = item.no
                attrData.attrValueArray.append(attrValueInfo)
            }
        }
        
        vc.attrData = attrGroup
        vc.attrValue = attrData
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tapChooseCateAction() {
        
        var dummyList = [String]()
        for item in cateList{
            dummyList.append(item.name!)
        }
        let dataPicker = BPicker(onePickerList: dummyList) { [weak self] (selectText, selectIndex) in
            /// 回调显示方法
            print(selectText[0])
            self?.curCatIndex = selectIndex[0]
            self?.goodsDetailView.choosePlatformClassBtn.setTitle(selectText[0], for: UIControl.State.normal)
        }
        self.definesPresentationContext = true
        
        dataPicker.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        dataPicker.picker.reloadAllComponents()
        /// 弹出时滚动到当前已选中的内容
        self.present(dataPicker, animated: true) {
            dataPicker.picker.selectRow(self.curCatIndex, inComponent: 0, animated: true)
            print("选中了")
        }
    }
    
    func tapChooseGoodsCateAction() {
        var dummyList = [String]()
        for item in goodscateList{
            dummyList.append(item.name!)
        }
        
        let dataPicker = BPicker(onePickerList: dummyList) { [weak self] (selectText, selectIndex) in
            /// 回调显示方法
            print(selectText[0])
            self?.curGoodsCatIndex = selectIndex[0]
            self?.goodsDetailView.choosegoodsClassBtn.setTitle(selectText[0], for: UIControl.State.normal)
        }
        self.definesPresentationContext = true
        
        dataPicker.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        dataPicker.picker.reloadAllComponents()
        /// 弹出时滚动到当前已选中的内容
        self.present(dataPicker, animated: true) {
            dataPicker.picker.selectRow(self.curGoodsCatIndex, inComponent: 0, animated: true)
            print("选中了")
        }
        
    }
    
    func tapChooseGoodsTagAction(tag: UIButton) {
        
        if(tag.isSelected){
            tag.backgroundColor = UIColor.white
            tagBtnSet.updateValue("", forKey: tag)
        }else{
            if(serviceTag.split(separator: ",").count > 3){
                showHUDInView(text: "最多可选择四个标签", inView: view)
                return
            }else{
                tag.backgroundColor = UIColor.theme
                tagBtnSet.updateValue((tag.titleLabel?.text!)! + ",", forKey: tag)
            }
        }
        self.getServiceTags()
        tag.isSelected = !tag.isSelected
    }
    
    func getServiceTags () {
        serviceTag = ""
        for tags in tagBtnSet{
            serviceTag = serviceTag + tags.value
        }
    }
    
    func tapSaveAction(name: String, unit: String, weight: String, original_price: String, price: String, pieces: String, forehead: String, goods_num: String) {
        
        guard name.count > 0 else {
            showHUDInView(text: "请输入商品名", inView: view)
            return
        }
        
        guard getGoodsDescr().count > 0 else {
            showHUDInView(text: "请添加商品描述", inView: view)
            return
        }
        
        guard coverPic.count > 0 else {
            showHUDInView(text: "请选择缩略图", inView: view)
            return
        }
        
        guard goodsPicArray.count > 0 else {
            showHUDInView(text: "请选择商品主图", inView: view)
            return
        }
        plat_cat_id = cateList[curCatIndex].id ?? 0
        guard plat_cat_id > 0 else {
            showHUDInView(text: "请选择平台分类", inView: view)
            return
        }
        
        goods_cat_id = goodscateList[curGoodsCatIndex].id ?? 0
        guard goods_cat_id > 0 else {
            showHUDInView(text: "请选择商品分类", inView: view)
            return
        }
        
        guard weight.count > 0 else {
            showHUDInView(text: "请输入商品重量", inView: view)
            return
        }
        
        guard original_price.count > 0 else {
            showHUDInView(text: "请输入商品原件", inView: view)
            return
        }
        
        guard price.count > 0 else {
            showHUDInView(text: "请输入商品售价", inView: view)
            return
        }
        guard goods_num.count > 0 else {
            showHUDInView(text: "请输入商品库存", inView: view)
            return
        }
        
        //        goodsPicArray.append(goodsPic)//拼接图片
        
        //MARK:上传时对规格数据进行处理
        let useAttr = attrGroup.group.isEmpty ? 0 : 1
        var attrUp = [AttrInfo]()
        if useAttr == 1 {
            for (_, item) in attrData.attrValueArray.enumerated() {
                let components = item.attrName.split{ $0 == "-" }
                let attrInfo = AttrInfo()
                attrInfo.attr_list = [AttrList]()
                for (i, j) in components.enumerated() {
                    let attrlist = AttrList()
                    attrlist.attr_name = String(j)
                    attrlist.attr_group_name = attrGroup.group[i].groupName
                    attrInfo.attr_list!.append(attrlist)
                }
                attrInfo.num = Int(item.inventory) ?? 0
                attrInfo.price = item.price
                attrInfo.no = item.goodsNumber
                attrUp.append(attrInfo)
            }
        }
        
        goodsService.addGoods(isAdd:isAddGoods,goods_id: goods_id, name: name, detail: getGoodsDescr(), cover_pic: coverPic, goods_pic: goodsPicArray, pt_cat_id: plat_cat_id, goods_cat_id: goods_cat_id, unit: unit, weight: weight, original_price: original_price, price: price, pieces: pieces, forehead: forehead, service: serviceTag, goods_num: goods_num, use_attr: useAttr, attr: attrUp, {
            showHUDInView(text: "发布成功", inView: self.view)
            cleanGoodsDescr()
            self.pressBack()
        }) { (APIErrorModel) in
            showHUDInView(text: APIErrorModel.msg ?? "发布失败" , inView: self.view)
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
    
    //MARK:缩略图
    func tapChooseGoodsSLTAction() {
        choosePicType = 0
        self.tapChoosePicAction()
    }
    
    //商品主图
    func tapChooseGoodsPicAction() {
        choosePicType = 1
        self.tapChoosePicAction()
    }
    
}
