//
//  ProductModel.swift
//  MyKream
//
//  Created by 김호성 on 2024.11.03.
//

import Foundation
import UIKit

struct ProductModel {
    let image: URL
    let trading: String
    let title: String
    let subtitle: String
    let price: String
    var bookmark: Bool
}

extension ProductModel {
    static func dummy() -> [ProductModel] {
        return [
            ProductModel(image: URL(string: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/2f4868b5-71dd-4a22-a9bb-11fc9f9c79ed/AIR+ZOOM+PEGASUS+41+EK.png")!, trading: "12.8만", title: "MLB", subtitle: "청키라이너 뉴욕양키스", price: "139,000원", bookmark: false),
            ProductModel(image: URL(string: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/9fe4fa37-ad48-4a15-be8b-51d19970758a/AIR+ZOOM+PEGASUS+41+EK.png")!, trading: "15.6만", title: "Jordan", subtitle: "Jordan 1 Retro High OG Yellow Ochre", price: "228,000원", bookmark: true),
            ProductModel(image: URL(string: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/8d74a9dc-6570-4897-9bbb-f88fac896572/AIR+ZOOM+PEGASUS+41+EK.png")!, trading: "12.8만", title: "Human Made", subtitle: "Human Made x Kaws Varsity Jacket #1 Black", price: "2,000,000원", bookmark: false),
            ProductModel(image: URL(string: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b696b6a3-4bfb-420a-be9e-21a1ffef125c/AIR+ZOOM+PEGASUS+41.png")!, trading: "2.1천", title: "Matin Kim Logo Coating Jumper", subtitle: "마뗑킴 로고 코팅 점퍼 블랙", price: "228,000원", bookmark: false),
            ProductModel(image: URL(string: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/9f676d92-a38b-43b1-8a19-0ba6eea81d73/NIKE+C1TY+%28GS%29.png")!, trading: "2.1천", title: "Nike Air Force 1", subtitle: "마뗑킴 로고 코팅 점퍼 블랙", price: "228,000원", bookmark: false),
            ProductModel(image: URL(string: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/a895a595-a93c-49e4-8ddb-93ce3eebf6cd/AIR+ZOOM+PEGASUS+41.png")!, trading: "2.1천", title: "나이키 페가수스 41", subtitle: "마뗑킴 로고 코팅 점퍼 블랙", price: "228,000원", bookmark: false),
            ProductModel(image: URL(string: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/5fdb1586-7439-46ee-8aaf-7d654beb0f5c/W+NIKE+CORTEZ+VNTG.png")!, trading: "2.1천", title: "나이키 페가수스 41", subtitle: "마뗑킴 로고 코팅 점퍼 블랙", price: "228,000원", bookmark: false),
            ProductModel(image: URL(string: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/0643580b-ff63-45e5-9039-0c3282b5bb81/W+NIKE+CORTEZ+TXT.png")!, trading: "2.1천", title: "나이키 페가수스 41", subtitle: "마뗑킴 로고 코팅 점퍼 블랙", price: "228,000원", bookmark: false),
            ProductModel(image: URL(string: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/e2cc301c-d8e8-45fe-987d-1233909fa4a6/NIKE+CORTEZ.png")!, trading: "2.1천", title: "나이키 페가수스 41", subtitle: "마뗑킴 로고 코팅 점퍼 블랙", price: "228,000원", bookmark: false),
            ProductModel(image: URL(string: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/46133c80-23a6-4f7b-b049-ffe37dbee228/W+NIKE+CORTEZ.png")!, trading: "2.1천", title: "나이키 페가수스 41", subtitle: "마뗑킴 로고 코팅 점퍼 블랙", price: "228,000원", bookmark: false),
        ]
    }
}
