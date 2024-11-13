//
//  SettingVC.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 13/08/24.
//

import UIKit

class SettingVC: UIViewController {

    @IBOutlet weak var profile_Img: UIImageView!
    @IBOutlet weak var lbl_ProfileName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func btn_EditProfile(_ sender: UIButton) {
        let vc = R.storyboard.main().instantiateViewController(withIdentifier: "EditProfileVC") as! EditProfileVC
        vc.viewModelProtocol = EditProfileViewModel(isComingFrom: "EditProfile")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_EditStore(_ sender: UIButton) {
        let vc = R.storyboard.main().instantiateViewController(withIdentifier: "StoreDetailVC") as! StoreDetailVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_MyCatgories(_ sender: UIButton) {
        let vc = R.storyboard.main().instantiateViewController(withIdentifier: "MyCategoriesVC") as! MyCategoriesVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_MyProduct(_ sender: UIButton) {
        let vc = R.storyboard.main().instantiateViewController(withIdentifier: "AllProductVC") as! AllProductVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_Review(_ sender: UIButton) {
        let vc = R.storyboard.main().instantiateViewController(withIdentifier: "RatingReviewVC") as! RatingReviewVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_Wallet(_ sender: UIButton) {
        let vc = R.storyboard.main().instantiateViewController(withIdentifier: "TransactionVC") as! TransactionVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_ChangePassword(_ sender: UIButton) {
        let vc = R.storyboard.main().instantiateViewController(withIdentifier: "ChangePasswordVC") as! ChangePasswordVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_ShareApp(_ sender: UIButton) {
      print("Call Url")
    }
    
    @IBAction func btn_HelpCenter(_ sender: UIButton) {
        let vc = R.storyboard.main().instantiateViewController(withIdentifier: "HelpVC") as! HelpVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_DeleteAccount(_ sender: UIButton) {
     print("Call Delete Api")
    }
    
    @IBAction func btn_Logout(_ sender: UIButton) {
       print("Remove Session")
    }
}
