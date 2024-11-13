//
//  EditStoreViewModel.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 24/09/24.
//

import Foundation

class EditStoreViewModel {
    
    var image: UIImage!
    
    var successfulMessage:(() -> Void)?
    var showErrorMessage:(() -> Void)?
    
    var arrayOfProviderDetails: Res_ProviderDt!
    
//    var errorMessage: String? {
//        didSet {
//            showErrorMessage?()
//        }
//    }
    
    func requestToGetProviderDetail(vC: UIViewController)
    {
        var paramDict: [String : AnyObject] = [:]
        paramDict["provider_id"] = k.userDefault.value(forKey: k.session.userId) as AnyObject?
        
        print(paramDict)
        
        Api.shared.requestToGetProviderDetails(vC, paramDict) { responseData in
            self.arrayOfProviderDetails = responseData
            self.successfulMessage?()
        }
    }

}
