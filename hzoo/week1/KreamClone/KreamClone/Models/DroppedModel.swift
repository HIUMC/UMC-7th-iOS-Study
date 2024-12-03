//
//  DroppedModel.swift
//  KreamClone
//
//  Created by 이현주 on 11/4/24.
//

import UIKit

struct DroppedModel {
    let trade: String
    let image: String
    let brand: String
    let name: String
    let price: String
}

extension DroppedModel {
    static func list() ->  [DroppedModel] {
        return [
            DroppedModel(trade: "12.8만", image: "https://static-resource.mlb-korea.com/cdn-cgi/image/q=100,w=3840,format=auto,fit=scale-down,onerror=redirect/images/goods/ec/M23N3ASXCLB3N50BKS/thnail/78E582B850DC480D9FDC4CB51B6A734D.png", brand: "MLB", name: "청키라이너 뉴욕양키스", price: "139,000"),
            DroppedModel(trade: "15.6만", image: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/24750e81-85ed-4b0e-8cd8-becf0cd97b2f/WMNS+AIR+JORDAN+1+MID.png", brand: "Jordan", name: "Jordan 1 Retro High OG", price: "228,000"),
            DroppedModel(trade: "7.8만", image: "https://kream-phinf.pstatic.net/MjAyMzAzMThfMTM3/MDAxNjc5MTIxMzYxODc0.UPukCUQZo-0U9x0-FTTw3R4IFhqZpb9GA50KdvVyDhAg.NanE6Sx1h5uJzEu_FBFHZPpm7tOfOFwN_DgJTF_aeWEg.PNG/a_97cd79ec167f499ab0253356957a1deb.png?type=l_webp", brand: "Human Made", name: "Human Made Graphic T-Shirt #05 White", price: "556,000"),
            DroppedModel(trade: "15.6만", image: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/9275d342-c34f-4d25-8641-17357e19d6f8/AIR+JORDAN+1+RETRO+HIGH+OG.png", brand: "Jordan", name: "Jordan 1 Retro High OG", price: "228,000"),
            DroppedModel(trade: "12.8만", image: "https://static-resource.mlb-korea.com/cdn-cgi/image/q=75,w=876,format=auto,fit=scale-down,onerror=redirect/images/goods/ec/M23N3ASXCLB3N50GNS/thnail/4BE1094A4A3E440792FE71B08A419C8E.png", brand: "MLB", name: "청키라이너 뉴욕양키스", price: "139,000"),
            DroppedModel(trade: "1.2만", image: "https://product-image.wconcept.co.kr/productimg/image/img0/00/301492000_DW33175.jpg", brand: "Matin Kim", name: "Matin Kim Logo Coating Jumper", price: "228,000"),
            DroppedModel(trade: "12.8만", image: "https://static-resource.mlb-korea.com/cdn-cgi/image/q=75,w=876,format=auto,fit=scale-down,onerror=redirect/images/goods/ec/M23N3ASXCLB3N50BKL/thnail/C17CB5261CC848B482B9ED39A046FAE2.png", brand: "MLB", name: "청키라이너 뉴욕양키스", price: "139,000"),
            DroppedModel(trade: "15.6만", image: "https://static.shoeprize.com/open_raffle/main_carousel/14932/555088-134-shoeprize-AIR-JORDAN-1-RETRO-HIGH-OG-UNIVERSITY-BLUE-388-1640530179634.jpeg?w=1000&f=webp", brand: "Jordan", name: "Jordan 1 Retro High OG", price: "228,000"),
            DroppedModel(trade: "7.8만", image: "https://kream-phinf.pstatic.net/MjAyMjEwMjVfMTgw/MDAxNjY2NjgzMzg5NjYz.Edne0MkyiDSL2rmIJQzo-F6enHu82yyzVGgICcq9KhIg.vuVQP---0ooV2Ucu_Va0t-sDsAtTw5vI27XwoROcdykg.JPEG/a_abd8084ba1e04dd99f3625a8b618aa8b.jpg?type=l_webp", brand: "Human Made", name: "Human Made MA-1 Olive Drab", price: "556,000"),
            DroppedModel(trade: "15.6만", image: "https://static.nike.com/a/images/w_1280,q_auto,f_auto/b987fdb1-e2a6-4727-8295-98fd0e6d4144/%EC%9A%B0%EB%A8%BC%EC%8A%A4-%EC%97%90%EC%96%B4-%EC%A1%B0%EB%8D%98-1-%ED%95%98%EC%9D%B4-cacao-wow-and-sand-drift-fq2941-200-%EC%B6%9C%EC%8B%9C%EC%9D%BC.jpg", brand: "Jordan", name: "Jordan 1 Retro High OG", price: "228,000")
        ]
    }
}
