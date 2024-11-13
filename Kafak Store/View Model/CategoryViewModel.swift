//
//  CategoryViewModel.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 23/09/24.
//

import Foundation

class CategoryViewModel {
    
    var isComingFrom: String!
    
    var categoryName: String!
    var categoryNameAr: String!
    var description: String!
    var descriptionAr: String!
    
    var image: UIImage!
    
    var arrayOfProviderCat: [Res_ProviderCat] = []
    var successProviderCat:(() -> Void)?
    
    var showErrorMessage:(() -> Void)?
    
    var errorMessage: String? {
        didSet {
            showErrorMessage?()
        }
    }
    
    init(isComingFrom: String) {
        self.isComingFrom = isComingFrom
    }
    
    func requestToGetProviderCategory(vC: UIViewController)
    {
        var paramDict: [String : AnyObject] = [:]
        paramDict["provider_id"] = k.userDefault.value(forKey: k.session.userId) as AnyObject?
        
        print(paramDict)
        
        Api.shared.requestToGetProviderCat(vC, paramDict) { responseData in
            if responseData.count > 0 {
                self.arrayOfProviderCat = responseData
            } else {
                self.arrayOfProviderCat = []
            }
            self.successProviderCat?()
        }
    }
    
    func requestAddOrUpdateCategory(vC: UIViewController) {
        if isComingFrom == "Add" {
            
            guard isAllInputs() else { return }
            
            var paramDict: [String : String] = [:]
            paramDict["store_id"] = k.userDefault.value(forKey: k.session.userId) as! String?
            paramDict["category_name"] = categoryName
            paramDict["category_name_ar"] = categoryNameAr
            paramDict["description"] = description
            paramDict["description_ar"] = descriptionAr
            
            print(paramDict)
            
            var paramImageDict: [String : UIImage] = [:]
            paramImageDict["image"] = self.image
            
            print(paramImageDict)
            
            Api.shared.requestToAddCategory(vC, paramDict, images: paramImageDict, videos: [:]) { responseData in
                self.successProviderCat?()
            }
        } else {
            guard isAllInputs() else { return }
            
            var paramDict: [String : String] = [:]
            paramDict["store_id"] = k.userDefault.value(forKey: k.session.userId) as! String?
            paramDict["category_name"] = categoryName
            paramDict["category_name_ar"] = categoryNameAr
            paramDict["description"] = description
            paramDict["description_ar"] = descriptionAr
            
            print(paramDict)
            
            var paramImageDict: [String : UIImage] = [:]
            paramImageDict["image"] = self.image
            
            print(paramImageDict)
                
            Api.shared.requestToUpdateCategory(vC, paramDict, images: paramImageDict, videos: [:]) { responseData in
                self.successProviderCat?()
            }
        }
    }
    
    func isAllInputs() -> Bool {
        if categoryName.isEmpty || categoryNameAr.isEmpty || description.isEmpty || descriptionAr.isEmpty {
            errorMessage = "Please enter the required details"
            return false
        }
        return true
    }
}
