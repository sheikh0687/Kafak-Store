//
//  ProviderCatProduct.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 24/09/24.
//

import Foundation

struct Api_ProviderProducts : Codable {
    let result : [Res_ProviderProducts]?
    let message : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case result = "result"
        case message = "message"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent([Res_ProviderProducts].self, forKey: .result)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }
}

struct Res_ProviderProducts : Codable {
    let id : String?
    let provider_id : String?
    let cat_id : String?
    let cat_name : String?
    let item_name : String?
    let item_price : String?
    let offer_item_price : String?
    let item_description : String?
    let item_quantity : String?
    let colour : String?
    let brand : String?
    let unit_measurement : String?
    let product_size : String?
    let type : String?
    let description : String?
    let available_status : String?
    let date_time : String?
    let remove_status : String?
//    let product_additional : [String]?
    let product_images : [Product_images]?
    let avg_rating : Int?
    let total_rating_count : String?
//    let product_size_price : [String]?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case provider_id = "provider_id"
        case cat_id = "cat_id"
        case cat_name = "cat_name"
        case item_name = "item_name"
        case item_price = "item_price"
        case offer_item_price = "offer_item_price"
        case item_description = "item_description"
        case item_quantity = "item_quantity"
        case colour = "colour"
        case brand = "brand"
        case unit_measurement = "unit_measurement"
        case product_size = "product_size"
        case type = "type"
        case description = "description"
        case available_status = "available_status"
        case date_time = "date_time"
        case remove_status = "remove_status"
//        case product_additional = "product_additional"
        case product_images = "product_images"
        case avg_rating = "avg_rating"
        case total_rating_count = "total_rating_count"
//        case product_size_price = "product_size_price"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        provider_id = try values.decodeIfPresent(String.self, forKey: .provider_id)
        cat_id = try values.decodeIfPresent(String.self, forKey: .cat_id)
        cat_name = try values.decodeIfPresent(String.self, forKey: .cat_name)
        item_name = try values.decodeIfPresent(String.self, forKey: .item_name)
        item_price = try values.decodeIfPresent(String.self, forKey: .item_price)
        offer_item_price = try values.decodeIfPresent(String.self, forKey: .offer_item_price)
        item_description = try values.decodeIfPresent(String.self, forKey: .item_description)
        item_quantity = try values.decodeIfPresent(String.self, forKey: .item_quantity)
        colour = try values.decodeIfPresent(String.self, forKey: .colour)
        brand = try values.decodeIfPresent(String.self, forKey: .brand)
        unit_measurement = try values.decodeIfPresent(String.self, forKey: .unit_measurement)
        product_size = try values.decodeIfPresent(String.self, forKey: .product_size)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        available_status = try values.decodeIfPresent(String.self, forKey: .available_status)
        date_time = try values.decodeIfPresent(String.self, forKey: .date_time)
        remove_status = try values.decodeIfPresent(String.self, forKey: .remove_status)
//        product_additional = try values.decodeIfPresent([String].self, forKey: .product_additional)
        product_images = try values.decodeIfPresent([Product_images].self, forKey: .product_images)
        avg_rating = try values.decodeIfPresent(Int.self, forKey: .avg_rating)
        total_rating_count = try values.decodeIfPresent(String.self, forKey: .total_rating_count)
//        product_size_price = try values.decodeIfPresent([String].self, forKey: .product_size_price)
    }

}
