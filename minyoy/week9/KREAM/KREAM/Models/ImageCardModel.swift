//
//  ImageCardModel.swift
//  KREAM
//
//  Created by 주민영 on 11/4/24.
//

import Foundation

struct ImageCardModel {
    let imageURL: String
    let username: String
}

extension ImageCardModel {
    static func dummy() -> [ImageCardModel] {
        return [
            ImageCardModel(imageURL: "https://s3-alpha-sig.figma.com/img/999a/ac4f/8290511532eeec15c78ddcf3dec05b24?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=WrFla2kkUbUAK3FAS1YJe3RUUSV~MKPLEil0pYo6SHemVZ6tO2nCW9c60qN~ODQdBdEVf2jaIYUJttq1Sq7f282WdX8qRuLA98O9I-oPI06uIN7DxE9ET49NFkpk2XykZrowpx1MrBYCi2dCzUP6-98oUrinHzltwvoqI0QyrRmxFiSY41oosFPqChqZmB0~TtyNKVSwfQAY-IdR0uNwYY9fFK0RQxb1RIf8Za0Hbcmyx85ADIylllLnxkFJqOx7xaiHOvME~XDTC7ubqE-6NYWohLzVrjMVcGXo~kQZ0C2L0OFQTPwdxL4s18Cls9fnJtKM0Hczkdn9ig8UTHaPNg__", username: "katarinabluu"),
            ImageCardModel(imageURL: "https://s3-alpha-sig.figma.com/img/ca87/468e/5d814c960a1a06130e85528296c08042?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Oc04XAlC9EIhsu90BhObc0CKQJ22uYk1-G-j5a-unx01776u2oTTC4GDaQF9fyp1xo6cNXo7EkpiTTMtt0R-Y6BUacZnuhDIhtIYKD3Kd72EVHUQ5F8OqZWI1walu40pPTXtJHCNdR6aiG2WrmqioXpSslQt1PmccFLbyvdykA0YCBT5rFnYGnBfxuuxPzxKmrd-3EsPaEkAKJEqPvdrrIegSZ8x~sjuupfLLA0UZtKIdlPPfoaz6iDDW9kmYNZ3IkOvgPthcXtbVNzkeqGgq38YEBjDFogJk14L-npbqsp~Ev1Xi7Xgv3ZSDYtMu5ujFJl5CJl0O5bb9hTyw-XqZQ__", username: "imwinter"),
            ImageCardModel(imageURL: "https://s3-alpha-sig.figma.com/img/e6d3/d6d7/e302cef496c775bbc7ee11b1a49f53fa?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=qnrjr-DxavyZvpFRl0Qr091hiNC7URX29yJisXLlb3a8qR836A~UnrMDi3NILZA~wwxh1E5jt98qe0EOtvlwyXSNbzsQgfkmgjyfEbauKC3ZTuVAQSgoRpIkdLexPs5x-tCA70CjWkweEjZ3uRLMBJKnaqA3vaeGeaUSluM7msLSqGjvo9-gKlS4JfDgLIcRywWs28NQTIZKCEVTkoAiPQaH0cnGMFqVcV4E-730ruj67iw6tIzlbvWrBwf4SMvgx7ylr-ZeylJ9nVX3JAXpIjSFVS2XQNe3R-hBJRb6KQQkiBv4~qftpemcKzsGYjUVt0CuDrJm4MAfpF47pV6KHQ__", username: "thousand_wooo"),
            ImageCardModel(imageURL: "https://news.nateimg.co.kr/orgImg/sw/2024/10/17/20241017510571.jpg", username: "aerichandesu"),
            ImageCardModel(imageURL: "https://alphabiz.co.kr/news/data/20230705/p1065578012081839_511_thum.jpg", username: "imnotningning"),
            ImageCardModel(imageURL: "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1pJDEW.img?w=426&h=662&m=6&x=107&y=174&s=94&d=94", username: "for_everyoung10"),
            ImageCardModel(imageURL: "https://www.hansbiz.co.kr/news/photo/202405/692551_659354_4633.jpg", username: "_yujin_an"),
            ImageCardModel(imageURL: "https://image.blip.kr/v1/file/af26164f356c4e4842e1cfc80bbc1575", username: "liz.yeyo"),
            ImageCardModel(imageURL: "https://static-cdn.sporki.com/news/mhn/202411/2361738/c_347409_398154_532.jpg", username: "chaerrry0"),
            ImageCardModel(imageURL: "https://cdn.9oodnews.com/news/photo/202208/18292_27051_2611.jpg", username: "sullyoon"),
        ]
    }
}
