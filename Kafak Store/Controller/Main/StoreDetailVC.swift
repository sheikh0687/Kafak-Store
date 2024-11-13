//
//  StoreDetailVC.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 23/09/24.
//

import UIKit

class StoreDetailVC: UIViewController {

    @IBOutlet weak var txt_StoreName: UITextField!
    @IBOutlet weak var txt_Address: UITextView!
    @IBOutlet weak var txt_OpeningTime: UITextField!
    @IBOutlet weak var txt_CLosingTime: UITextField!
    @IBOutlet weak var txt_UsingBrand: UITextField!
    @IBOutlet weak var txt_AboutStore: UITextView!
    
    let viewModel = EditStoreViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = true
        setNavigationBarItem(LeftTitle: "", LeftImage: "black_back", CenterTitle: "Create Profile", CenterImage: "", RightTitle: "", RightImage: "", BackgroundColor: "#001845", BackgroundImage: "", TextColor: "#ffffff", TintColor: "#ffffff", Menu: "")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func btn_StoreLogo(_ sender: UIButton) {
        CameraHandler.shared.showActionSheet(vc: self)
        CameraHandler.shared.imagePickedBlock = { image in
            self.viewModel.image = image
            sender.contentMode = .scaleToFill
            sender.setImage(image, for: .normal)
        }
    }
    
    @IBAction func btn_Submit(_ sender: UIButton) {
        
    }
    
    func setUpBinding()
    {
        viewModel.requestToGetProviderDetail(vC: self)
        viewModel.successfulMessage = {
            let obj = self.viewModel.arrayOfProviderDetails
            self.txt_StoreName.text = obj?.first_name ?? ""
            self.txt_Address.text = obj?.address ?? ""
            self.txt_AboutStore.text = obj?.description ?? ""
        }
    }
}
