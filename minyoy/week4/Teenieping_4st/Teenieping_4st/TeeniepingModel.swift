
import UIKit

struct TeeniepingModel {
    let image: UIImage
    let name: String
}

extension TeeniepingModel {
    static func dummy() -> [TeeniepingModel] {
        return [
            TeeniepingModel(image: .hachuping, name: "하츄핑"),
            TeeniepingModel(image: .lalaping, name: "라라핑"),
            TeeniepingModel(image: .baroping, name: "바로핑"),
            TeeniepingModel(image: .azaping, name: "아자핑"),
            TeeniepingModel(image: .chachaping, name: "차차핑"),
            TeeniepingModel(image: .haeping, name: "해핑"),
            TeeniepingModel(image: .mugoping, name: "무거핑"),
            TeeniepingModel(image: .siroping, name: "시러핑")
        ]
    }
}
