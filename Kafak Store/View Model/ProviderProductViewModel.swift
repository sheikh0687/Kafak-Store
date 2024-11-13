//
//  AllCategoryProductViewModel.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 24/09/24.
//

import Foundation

class ProviderProductViewModel {
    
    var arrayOfProviderProduct: [Res_ProviderProducts] = []
    
    var successfulMessage:(() -> Void)?
    
    func reqeustToGetProviderProducts(vC: UIViewController)
    {
        var paramDict: [String : AnyObject] = [:]
        paramDict["provider_id"] = k.userDefault.value(forKey: k.session.userId) as AnyObject?
        
        print(paramDict)
        
        Api.shared.requestToGetProviderProducts(vC, paramDict) { responseData in
            if responseData.count > 0 {
                self.arrayOfProviderProduct = responseData
            } else {
                self.arrayOfProviderProduct = []
            }
            self.successfulMessage?()
        }
    }
}
