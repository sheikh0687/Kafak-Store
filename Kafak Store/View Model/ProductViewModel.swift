//
//  ProductViewModel.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 20/09/24.
//

import Foundation
import DropDown

class ProductViewModel {
    
    var arrayOfProviderCat: [Res_ProviderCat] = []
    var successProviderCat:(() -> Void)?
    
    var dropDown = DropDown()
    
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
    
    func configureDropDown(sender: UIButton)
    {
        var arrCategoryId:[String] = []
        var arrCategoryName:[String] = []
        for val in self.arrayOfProviderCat {
            arrCategoryId.append(val.id ?? "")
            arrCategoryName.append(val.category_name ?? "")
        }
        dropDown.show()
        dropDown.anchorView = sender
        dropDown.dataSource = arrCategoryName
        dropDown.bottomOffset = CGPoint(x: -5, y: 40)
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            sender.setTitle(item, for: .normal)
        }
    }
    
}
