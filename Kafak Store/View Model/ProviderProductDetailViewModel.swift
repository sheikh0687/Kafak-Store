//
//  ProviderProductDetailViewModel.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 24/09/24.
//

import Foundation

class ProviderProductDetailViewModel {
    
    var arrayOfProductDetails: Res_ProviderProductDetails!
    var arrayOfProductImages: [Product_images] = []
    var successfulMessage:(() -> Void)?
    var product_Id: String = ""
    
    func requestToGetProductDetail(vC: UIViewController) {
        
        var paramDict: [String : AnyObject] = [:]
        paramDict["product_id"] = product_Id as AnyObject
        
        print(paramDict)
        
        Api.shared.requestToGetProviderProductDetails(vC, paramDict) { responseData in
            self.arrayOfProductDetails = responseData
            self.arrayOfProductImages = responseData.product_images ?? []
            self.successfulMessage?()
        }
    }
}
