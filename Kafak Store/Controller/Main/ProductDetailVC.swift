//
//  ProductDetailVC.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 13/08/24.
//

import UIKit

class ProductDetailVC: UIViewController {

    @IBOutlet weak var item_Img: UIImageView!
    
    @IBOutlet weak var product_Collection: UICollectionView!
    @IBOutlet weak var collection_Height: NSLayoutConstraint!
    @IBOutlet weak var all_InfoVw: UIStackView!
    @IBOutlet weak var btn_InfoOt: UIButton!
    @IBOutlet weak var btn_Photos: UIButton!
    
    @IBOutlet weak var lbl_ProductName: UILabel!
    @IBOutlet weak var lbl_Description: UILabel!
    @IBOutlet weak var lbl_Brand: UILabel!
    @IBOutlet weak var lbl_Color: UILabel!
    @IBOutlet weak var lbl_UOM: UILabel!
    @IBOutlet weak var lbl_ConstructionUse: UILabel!
    @IBOutlet weak var lbl_PieceOfPrice: UILabel!
   
    let viewModel = ProviderProductDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.all_InfoVw.isHidden = false
        self.product_Collection.isHidden = true
        self.product_Collection.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
        setUpBinding()
    }
    
    func setUpBinding()
    {
        viewModel.requestToGetProductDetail(vC: self)
        viewModel.successfulMessage = {
            DispatchQueue.main.async {
                self.product_Collection.reloadData()
                
                let obj = self.viewModel.arrayOfProductDetails
                self.lbl_ProductName.text = obj?.item_name ?? ""
                self.lbl_Description.text = obj?.item_description ?? ""
                self.lbl_Brand.text = obj?.brand ?? ""
                self.lbl_Color.text = "Available Color: \(obj?.colour ?? "")"
                self.lbl_UOM.text = obj?.unit_measurement ?? ""
                self.lbl_PieceOfPrice.text = "Price per piece: \(obj?.item_price ?? "") Riyals"
                
                if let obj_ProductImg = obj?.product_images  {
                    if obj_ProductImg.count > 0 {
                        if Router.BASE_IMAGE_URL != obj_ProductImg.first?.image {
                            Utility.setImageWithSDWebImage(obj_ProductImg.first?.image ?? "", self.item_Img)
                        } else {
                            self.item_Img.image = R.image.no_Image_Available()
                        }
                    } else {
                        self.item_Img.image = R.image.no_Image_Available()
                    }
                }
            }
        }
    }
    
    @IBAction func btn_ProductsAllInfo(_ sender: UIButton) {
        
        if sender.tag == 0 {
            self.all_InfoVw.isHidden = false
            self.product_Collection.isHidden = true
            self.btn_InfoOt.backgroundColor = R.color.darkBlue()
            self.btn_Photos.backgroundColor = .white
            self.btn_InfoOt.setTitleColor(.white, for: .normal)
            self.btn_Photos.setTitleColor(R.color.darkBlue(), for: .normal)
            self.btn_Photos.borderWidth = 0.5
            self.btn_Photos.borderColor = .separator
        } else {
            self.all_InfoVw.isHidden = true
            self.product_Collection.isHidden = false
            self.btn_InfoOt.backgroundColor = .white
            self.btn_Photos.backgroundColor = R.color.darkBlue()
            self.btn_Photos.setTitleColor(.white, for: .normal)
            self.btn_InfoOt.setTitleColor(R.color.darkBlue(), for: .normal)
            self.btn_InfoOt.borderWidth = 0.5
            self.btn_InfoOt.borderColor = .separator
        }
    }
    
    @IBAction func btn_Back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ProductDetailVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.arrayOfProductImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        
        let obj = self.viewModel.arrayOfProductImages[indexPath.row]
        cell.lbl_Name.isHidden = true
        
        if Router.BASE_IMAGE_URL != obj.image {
            Utility.setImageWithSDWebImage(obj.image ?? "", cell.img)
        } else {
            cell.img.image = R.image.no_Image_Available()
        }
        
        cell.img.roundCorners(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 10)
        let numberOfItemsInRow = 3 // You can adjust this based on your layout
        let numberOfRows = (self.viewModel.arrayOfProductImages.count + numberOfItemsInRow - 1) / numberOfItemsInRow
        let cellHeight: CGFloat = 150
        self.collection_Height.constant = CGFloat(numberOfRows) * cellHeight
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.width
        return CGSize(width: size/3, height: 150)
    }
}
