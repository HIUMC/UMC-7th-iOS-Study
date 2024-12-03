//
//  ChallengeModel.swift
//  KreamClone
//
//  Created by 이현주 on 11/4/24.
//

import UIKit

struct ChallengeModel {
    let image: String
    let id: String
}

extension ChallengeModel {
    static func list() ->  [ChallengeModel] {
        return [
            ChallengeModel(image: "https://img.sportsworldi.com/content/image/2024/09/05/20240905504396.jpg", id: "katarinabluu"),
            ChallengeModel(image: "https://www.kstarfashion.com/news/photo/202405/215172_130433_1314.jpg", id: "imwinter"),
            ChallengeModel(image: "https://thumbnews.nateimg.co.kr/view610///news.nateimg.co.kr/orgImg/hm/2021/09/18/202109180609281130937_20210918061648_01.jpg", id: "thousand_wooo"),
            ChallengeModel(image: "https://cdn.newsculture.press/news/photo/202310/534270_665658_1442.jpg", id: "katarinabluu"),
            ChallengeModel(image: "https://thumb.mtstarnews.com/06/2024/05/2024052300370256898_1.jpg", id: "imwinter"),
            ChallengeModel(image: "https://www.chosun.com/resizer/v2/J2ZMIXIAEZJS6DMTP3VFXGHDKM.jpg?auth=0628f12e4a62489cbe0d947a612118aed781a41aa9d804288a7cf2b1e1d892e0&width=616", id: "thousand_wooo"),
            ChallengeModel(image: "https://www.kstarfashion.com/news/photo/202409/219201_139884_1651.jpg", id: "katarinabluu"),
            ChallengeModel(image: "https://contents-cdn.viewus.co.kr/image/2024/01/CP-2023-0019/image-accf44c1-014b-4f68-b4b5-45e9b0c5015e.jpeg", id: "imwinter"),
            ChallengeModel(image: "https://img1.newsis.com/2021/06/01/NISI20210601_0000757872_web.jpg?rnd=20210601143641", id: "thousand_wooo"),
            ChallengeModel(image: "https://cdn.hansbiz.co.kr/news/photo/202401/678277_637756_2521.jpg", id: "katarinabluu")
        ]
    }
}
