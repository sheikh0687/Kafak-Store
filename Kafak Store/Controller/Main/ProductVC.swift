//
//  ProductVC.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 13/08/24.
//

import UIKit
import DropDown

class ProductVC: UIViewController {

    @IBOutlet weak var btn_DropOt: UIButton!
    
    let viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDropDown()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func btn_SelectCat(_ sender: UIButton) {
        viewModel.dropDown.show()
    }
    
    func setUpDropDown()
    {
        viewModel.requestToGetProviderCategory(vC: self)
        viewModel.successProviderCat = {
            self.viewModel.configureDropDown(sender: self.btn_DropOt)
        }
    }
}
