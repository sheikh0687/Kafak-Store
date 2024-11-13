//
//  EditProfileVC.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 13/08/24.
//

import UIKit

class EditProfileVC: UIViewController {

    @IBOutlet weak var lbl_Name: UILabel!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var txt_Name: UITextField!
    @IBOutlet weak var lastNameText: UILabel!
    @IBOutlet weak var txt_LastName: UITextField!
    @IBOutlet weak var mobileText: UILabel!
    @IBOutlet weak var txt_MobileText: UITextField!
    @IBOutlet weak var emailAddressText: UILabel!
    @IBOutlet weak var txt_Email: UITextField!
    @IBOutlet weak var btn_DeleteOt: UIButton!
    
    @IBOutlet weak var btn_AddUpdateOt: UIButton!
    
    var viewModelProtocol: EditProfileProtocol!
    var viewModelCategory: CategoryViewModel!
    
    var catName:String = ""
    var catNameArabic:String = ""
    var valDescription:String = ""
    var descriptionArabic: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameText.text = viewModelProtocol.nameLabelText
        print(self.nameText.text ?? "")
        self.lastNameText.text = viewModelProtocol.lastNameLabelText
        self.mobileText.text = viewModelProtocol.mobileLabelText
        self.emailAddressText.text = viewModelProtocol.emailLabelText
        self.lbl_Name.text = viewModelProtocol.userNameText
     
        btn_DeleteOt.isHidden = viewModelProtocol.isButtonHidden
        
        self.txt_Name.placeholder = viewModelProtocol.namePlaceholder
        self.txt_LastName.placeholder = viewModelProtocol.lastNamePlaceholder
        self.txt_Email.placeholder = viewModelProtocol.emailPlaceholder
        self.txt_MobileText.placeholder = viewModelProtocol.mobilePlaceholder
        
        btn_AddUpdateOt.setTitle(viewModelProtocol.updateButtonTitle, for: .normal)
        
        if let viewModelData = viewModelCategory {
            if viewModelData.isComingFrom == "Add" {
                setUpAddCategory()
            } else if viewModelData.isComingFrom == "Update" {
                self.txt_Name.text = catName
                self.txt_LastName.text = catNameArabic
                self.txt_MobileText.text = valDescription
                self.txt_Email.text = descriptionArabic
                setUpAddCategory()
            }
        } else {
            setUpBinding()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = true
        setNavigationBarItem(LeftTitle: "", LeftImage: "black_back", CenterTitle: viewModelProtocol.headingText, CenterImage: "", RightTitle: "", RightImage: "", BackgroundColor: "#001845", BackgroundImage: "", TextColor: "#ffffff", TintColor: "#ffffff", Menu: "")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setUpBinding()
    {
        viewModelProtocol.requestToGetProfile(vC: self)
        viewModelProtocol.responseSuccess = {
            DispatchQueue.main.async {
                let obj = self.viewModelProtocol.arrayDataOfProfle
                self.txt_Name.text = obj?.first_name ?? ""
                self.txt_LastName.text = obj?.last_name ?? ""
                self.txt_Email.text = obj?.email ?? ""
                self.txt_MobileText.text = obj?.mobile ?? ""
            }
        }
    }
    
    @IBAction func btn_UploadImg(_ sender: UIButton) {
        CameraHandler.shared.showActionSheet(vc: self)
        CameraHandler.shared.imagePickedBlock = { image in
            self.viewModelCategory.image = image
            sender.contentMode = .scaleToFill
            sender.setImage(image, for: .normal)
        }
    }
    
    @IBAction func btn_Update(_ sender: UIButton) {
        viewModelCategory.categoryName = self.txt_Name.text
        viewModelCategory.categoryNameAr = self.txt_LastName.text
        viewModelCategory.description = self.txt_MobileText.text
        viewModelCategory.descriptionAr = self.txt_Email.text
        viewModelCategory.requestAddOrUpdateCategory(vC: self)
    }
    
    private func setUpAddCategory()
    {
        viewModelCategory.showErrorMessage = { [weak self] in
            if let errorMessage = self?.viewModelCategory.errorMessage {
                Utility.showAlertMessage(withTitle: k.appName, message: errorMessage, delegate: nil, parentViewController: self!)
            }
        }
        
        viewModelCategory.successProviderCat = {
            DispatchQueue.main.async {
                Utility.showAlertWithAction(withTitle: k.appName, message: "Category added successfully", delegate: nil, parentViewController: self) { bool in
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
    @IBAction func btn_Delete(_ sender: UIButton) {
        
    }
}
