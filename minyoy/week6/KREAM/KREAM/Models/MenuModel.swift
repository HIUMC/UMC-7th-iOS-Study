import UIKit

struct MenuModel {
    let image: UIImage
    let title: String
    let color: UIColor
}

extension MenuModel {
    static func dummy() -> [MenuModel] {
        return [
            MenuModel(image: .collectionImage1, title: "크림 드로우", color: .systemGray6),
            MenuModel(image: .collectionImage2, title: "실시간 차트", color: .systemGray6),
            MenuModel(image: .collectionImage3, title: "남성 추천", color: .systemGray6),
            MenuModel(image: .collectionImage4, title: "여성 추천", color: .systemGray6),
            MenuModel(image: .collectionImage5, title: "색다른 추천", color: .systemGray6),
            MenuModel(image: .collectionImage6, title: "정가 아래", color: UIColor(red: 231/255, green: 238/255, blue: 254/255, alpha: 1)),
            MenuModel(image: .collectionImage7, title: "윤세 24AW", color: UIColor(red: 237/255, green: 243/255, blue: 236/255, alpha: 1)),
            MenuModel(image: .collectionImage8, title: "올해의 베스트", color: UIColor(red: 226/255, green: 235/255, blue: 237/255, alpha: 1)),
            MenuModel(image: .collectionImage9, title: "10월 베네핏", color: UIColor(red: 250/255, green: 210/255, blue: 213/255, alpha: 1)),
            MenuModel(image: .collectionImage10, title: "아크네 선물", color: UIColor(red: 254/255, green: 239/255, blue: 216/255, alpha: 1))
        ]
    }
}
