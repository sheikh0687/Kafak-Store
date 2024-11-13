//
//  MyCategoriesVC.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 21/09/24.
//

import UIKit

class MyCategoriesVC: UIViewController {

    @IBOutlet weak var category_CollectionVw: UICollectionView!
    
    let viewModel = CategoryViewModel(isComingFrom: k.emptyString)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.category_CollectionVw.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = true
        setNavigationBarItem(LeftTitle: "", LeftImage: "black_back", CenterTitle: "My Categories", CenterImage: "", RightTitle: "", RightImage: "Add", BackgroundColor: "#001845", BackgroundImage: "", TextColor: "#ffffff", TintColor: "#ffffff", Menu: "")
        setUpBinding()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func rightClick() {
        let vC = R.storyboard.main().instantiateViewController(withIdentifier: "EditProfileVC") as! EditProfileVC
        vC.viewModelProtocol = EditProfileViewModel(isComingFrom: "Add")
        vC.viewModelCategory = CategoryViewModel(isComingFrom: "Add")
        self.navigationController?.pushViewController(vC, animated: true)
    }
    
    func setUpBinding()
    {
        viewModel.requestToGetProviderCategory(vC: self)
        viewModel.successProviderCat = {
            DispatchQueue.main.async {
                self.category_CollectionVw.reloadData()
            }
        }
    }
}

extension MyCategoriesVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.arrayOfProviderCat.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        let obj = self.viewModel.arrayOfProviderCat[indexPath.row]
        cell.lbl_CatName.text = obj.category_name ?? ""
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.frame.width
        return CGSize(width: collectionWidth / 2, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vC = R.storyboard.main().instantiateViewController(withIdentifier: "EditProfileVC") as! EditProfileVC
        let obj = self.viewModel.arrayOfProviderCat[indexPath.item]
        vC.viewModelProtocol = EditProfileViewModel(isComingFrom: "Category")
        vC.viewModelCategory = CategoryViewModel(isComingFrom: "Update")
        vC.catName = obj.category_name ?? ""
        vC.catNameArabic = obj.category_name_ar ?? ""
        vC.valDescription = obj.description ?? ""
        vC.descriptionArabic = obj.description_ar ?? ""
        self.navigationController?.pushViewController(vC, animated: true)
    }
}
