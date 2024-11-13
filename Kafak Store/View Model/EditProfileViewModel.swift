//
//  EditProfileViewModel.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 23/09/24.
//

import Foundation

protocol EditProfileProtocol {
    var nameLabelText: String { get }
    var lastNameLabelText: String { get }
    var mobileLabelText: String { get }
    var emailLabelText: String { get }
    var userNameText: String { get }
    var isButtonHidden: Bool { get }
    var headingText: String { get }
    
    var namePlaceholder : String { get }
    var lastNamePlaceholder: String { get }
    var mobilePlaceholder: String { get }
    var emailPlaceholder: String { get }
    
    func requestToGetProfile(vC: UIViewController) 
    
    var responseSuccess:(() -> Void)? { get set }
    var arrayDataOfProfle: Res_Login! { get }
    
//    var isDeleteButtonHidden: Bool { get }
    var updateButtonTitle: String { get }
    
}

class EditProfileViewModel: EditProfileProtocol {
    
    var responseSuccess: (() -> Void)?
    
    var arrayDataOfProfle: Res_Login!
    
    var valCatName: String = ""
    var valCatNameArabic: String = ""
    var valDescription: String = ""
    var valDescriptionArabic: String = ""
    
    var isComingFrom: String
    var userName: String!

    init(isComingFrom: String) {
        self.isComingFrom = isComingFrom
    }
    
    var nameLabelText: String {
        print(self.isComingFrom)
        return isComingFrom == "EditProfile" ? "Name" : "Category Name"
    }
    
    var lastNameLabelText: String {
        return isComingFrom == "EditProfile" ? "Last Name" : "Category Name(Arabic)"
    }
    
    var mobileLabelText: String {
        return isComingFrom == "EditProfile" ? "Mobile Number" : "Description"
    }
    
    var emailLabelText: String {
        return isComingFrom == "EditProfile" ? "Email Address" : "Description(Arabic)"
    }
    
    var userNameText: String {
        return isComingFrom == "EditProfile" ? "Arbaz Sheikh" : "Upload Image"
    }
    
    var headingText: String {
        return isComingFrom == "EditProfile" ? "Edit Profile" : "Add Category"
    }
    
    var isButtonHidden: Bool {
        return isComingFrom != "Category"
    }
    
    var namePlaceholder: String {
        return isComingFrom == "EditProfile" ? "Enter your first name" : "Enter category name"
    }
    
    var lastNamePlaceholder: String {
        return isComingFrom == "EditProfile" ? "Enter your last name" : "Enter category name (Arabic)"
    }
    
    var mobilePlaceholder: String {
        return isComingFrom == "EditProfile" ? "Enter your mobile number" : "Enter description"
    }
    
    var emailPlaceholder: String {
        return isComingFrom == "EditProfile" ? "Enter your email address" : "Enter description (Arabic)"
    }
    
    var updateButtonTitle: String {
        return isComingFrom == "Add" ? "Add" : "Update"
    }
    
    func requestToGetProfile(vC: UIViewController)
    {
        if isComingFrom == "EditProfile" {
            Api.shared.requestToGetProfileDetail(vC) { responseData in
                self.arrayDataOfProfle = responseData
                self.userName = "\(responseData.first_name ?? "") \(responseData.last_name ?? "")"
                self.responseSuccess?()
            }
        } else {
    
        }
    }
}


