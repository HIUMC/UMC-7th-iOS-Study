//
//  SearchModel.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.20.
//

import Foundation

struct SearchEntity: Codable {
    let products: [Product]?
    struct Product: Codable {
        let id: Int?
        let title: String?
        let description: String?
        let category: String?
        let price: Double?
        let discountPercentage: Double?
        let rating: Double?
        let stock: Int?
        let tags: [String]?
        let brand: String?
        let sku: String?
        let weight: Int?
        let dimensions: Dimension?
        struct Dimension: Codable {
            let width: Double?
            let height: Double?
            let depth: Double?
        }
        let warrantyInformation: String?
        let shippingInformation: String?
        let availablityStatus: String?
        let reviews: [Review]?
        struct Review: Codable {
            let rating: Int?
            let comment: String?
            let date: String?
            let reviewerName: String?
            let reviewerEmail: String?
        }
        let returnPolicy: String?
        let minimumOrderQuantity: Int?
        let meta: Meta?
        struct Meta: Codable {
            let createdAt: String?
            let updatedAt: String?
            let barcode: String?
            let qrCode: String?
        }
        let images: [String]?
        let thumbnail: String?
    }
    let total: Int?
    let skip: Int?
    let limit: Int?
}
