//
//  AllProductVC.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 13/08/24.
//

import UIKit

class AllProductVC: UIViewController {

    @IBOutlet weak var product_Collection: UICollectionView!
    
    let viewModel = ProviderProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.product_Collection.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
        self.setUpBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
        setNavigationBarItem(LeftTitle: "", LeftImage: "black_back", CenterTitle: "My Products", CenterImage: "", RightTitle: "", RightImage: "", BackgroundColor: "#001845", BackgroundImage: "", TextColor: "#ffffff", TintColor: "#ffffff", Menu: "")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setUpBinding()
    {
        viewModel.reqeustToGetProviderProducts(vC: self)
        viewModel.successfulMessage = {
            DispatchQueue.main.async {
                self.product_Collection.reloadData()
            }
        }
    }
}

extension AllProductVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.arrayOfProviderProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        
        let obj = self.viewModel.arrayOfProviderProduct[indexPath.row]
        cell.lbl_Name.text = obj.item_name ?? ""
        
        if let obj_ProductImgs = obj.product_images {
            if obj_ProductImgs.count > 0 {
                if Router.BASE_IMAGE_URL != obj_ProductImgs.first?.image {
                    Utility.setImageWithSDWebImage(obj_ProductImgs.first?.image ?? "", cell.img)
                } else {
                    cell.img.image = R.image.no_Image_Available()
                }
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.width
        return CGSize(width: size/2, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = R.storyboard.main().instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailVC
        vc.viewModel.product_Id = self.viewModel.arrayOfProviderProduct[indexPath.item].id ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

