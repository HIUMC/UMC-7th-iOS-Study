//
//  ReleasedModel.swift
//  KREAM
//
//  Created by 이태림 on 11/4/24.
//

import UIKit

struct ReleasedModel {
    let image: String
    let volumename: String
    let savedimage: String
    let brandname: String
    let productname: String
    let pricename: String
    let rightbuyname: String
}

extension ReleasedModel {
    static func releaseddummy() -> [ReleasedModel] {
        return [
            ReleasedModel(image: "https://s3-alpha-sig.figma.com/img/3888/3485/40338332862dec62a2a1370c053f1e3d?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=keSrlZ4MTCiheZbY~A8jVjzZKKmH43n1mGW7aSZ54l0Y1qEKFSo-a5bv~NKMUZ9x3u9yaOLhQnuldMN-KnKZC5PM0v8hOcptra07z40Zkq8CjOt-5ju9aNoG2IjFShuZFSfWevo2AOKCHoblBNhvK6Zp5LPn34EykTbehIhm342Y4fPxceqX5QqNCAqZEr58C9Um6F0TkkbFu8eb33vvLF8FL7SgRpu1J6jG9~BraFjomNO6cz7NII4~T~bRWTLFGMQaB6cm46T8JdjQ0jXPP2gA3z0ntghVAnw9RfrPo-ZxY5z8w6hCYEJ9k96h3ukINrQC2ofLLrWAZVvMd7Mmiw__", volumename: "거래 12.8만", savedimage: "_icon_saved_none.png", brandname: "MLB", productname: "청키라이너 뉴욕양키스", pricename: "139,000원", rightbuyname: "즉시 구매가"),
            ReleasedModel(image: "https://s3-alpha-sig.figma.com/img/44e5/158d/85a822e2d9940249bee1e726f0fa4df1?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ePyG2YWpTiTYEdS05WEarX~XT-1Wyc8jz7VSQBmfWkzECS~f-914ZiCVL2a7vaFt8aH52HR-7bbud2q532hMnnCgT8GSl-FQ5IW~t7zx3iLcIq3CUeBU6~q9H4hTVZCgfkPwalmg-2xgSG5ttwlRlCjPNWIPadTpj9A0wwRgELLK4JMdbv3HY5r65GSY9d4fSd2204NFvS06L06xxdCcCOT2q8qrCWbyL59TwlaBlyFcPHi2xSkRKK2CVvq5LXBx--jKwCe4g6tW~DNKKZhGaWi4TSMDkgNUxGK7H~nUltZvrKKArhMTW1MIKmmINpdXD~QaobJckmQ-uwx7LnkJZQ__", volumename: "거래 15.6만", savedimage: "_icon_saved_filled.png", brandname: "Jordan", productname: "Jordan 1 Retro High OG Yellow Ochre", pricename: "228,000원", rightbuyname: "즉시 구매가"),
            ReleasedModel(image: "https://s3-alpha-sig.figma.com/img/6405/60ad/f845a3a967992652b95e739c468ce356?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Wje1MmGH4yCjvFOZHFjT097qG-cVibjD4rrzwX6Vjb0SH4h81NG0oG2o8SXJV2vbpLO6khh4EiVoP4V6pCaUN9re4l-gLg2DwsMg4Vp03mamC~3pCbEaXBdo1elZ50IDBgpQRg5YbgEKHHiIP8CshdcN2onp61-HK~OxWCqF50CWKym2yTmxx8xMOptLcDkiIEmVAPpVcFsA8opE7VPxmov~9syh5Hu2gId1lGNb91YCXDMMUG38cGa9W3njPqrPat1ETXi7WRFedtmcvELcwmwSLZcLV0eaO81XDACvQw15v~ibEUDkb-N-VbgS1ZurEj7p2yFMpr8z6865QckAog__", volumename: "거래 12.8만", savedimage: "_icon_saved_none.png", brandname: "Human Made", productname: "Human Made x Kaws Varsity Jacket #1 Black", pricename: "2,000,000원", rightbuyname: "즉시 구매가"),
            ReleasedModel(image: "https://s3-alpha-sig.figma.com/img/619b/ce54/04740c20958b83448efc55e88f0fc54c?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=I-B0JNTekFwut0ArdHadTNLZrSkUMoj7xOkwBhVXULYNZPuQC-w6y5j80HONBvxphxyRT~I19l6uH-OXtPzuvzQ~fCzNNo1Tcn~2KJVnLB7H1s-8EuthzpLMKMcW5WKquc5WN-fJn~lkyqJe~v~QOoghY5vhcbsJycx2L1k~yQjEWvf6N82zwOWNnqJMLRD64qsyR27pzzt5Owng13ysxMfLNrXUXz-gUv6EMl1r1kkfU7euX335NO5DpmZXh4~Cpf6h3YjPIAuPqRn0mPq8V5eMBY5hN8A2-hCU0fRYLux4GJ8KeNJGIJywfQJE3y~65knpCyf2TKKT2GR-Wy8pMw__", volumename: "거래 12.8만", savedimage: "_icon_saved_filled.png", brandname: "Matin Kim", productname: "Matin Kim Logo Coating Jumper", pricename: "228,000원", rightbuyname: "즉시 구매가"),
            ReleasedModel(image: "https://i.namu.wiki/i/okqEOIDKE7lDzBPPteuKRkufJnX8i4ybHYtPwCin7AjUWPRCgN6SgB9W8JjVccq2Htl2l2TyfKkGHk0Fx93hLMMCL2M_2crWCgkykbaJYTTZeRyACQG-NiyXUklsjG6V2O4Ekyg3qxTPkUF6hE1Bhw.webp", volumename: "거래 12.8만", savedimage: "_icon_saved_filled.png", brandname: "Nike", productname: "Nike Air Max 97", pricename: "228,000원", rightbuyname: "즉시 구매가"),
            ReleasedModel(image: "https://i.namu.wiki/i/ryrs8wUuSqfWS_PFZPpDjy54_gUjUgv6shF4vLdSTbJxpdlZh1hcSuUZi_yWg4YqP3PM7QWRuJI5oQ0BUHvjGYJ0sDz9171zE0st3glY2JdPKOjHA9I-T8DpzsII_b-k9hls8gdXA7njjocRc67ZRQ.webp", volumename: "거래 12.8만", savedimage: "_icon_saved_filled.png", brandname: "Nike", productname: "Nike Air Max 98", pricename: "228,000원", rightbuyname: "즉시 구매가"),
            ReleasedModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCYVz3EE589zwzBOTGLBHa-AwXyZtmg6xV2w&s", volumename: "거래 12.8만", savedimage: "_icon_saved_filled.png", brandname: "IAB Studio", productname: "IAB Studio Hoody", pricename: "228,000원", rightbuyname: "즉시 구매가"),
            ReleasedModel(image: "https://i.namu.wiki/i/XsvawYoZaUrYCUnRLOrUnPyCrd3JkMqGIL_-CKrSmWLKHw5Ehg7uTKFe5BQp1LmeDZ8lQcUClvF8cTJXeIDoPgjkuRrikRXW5lEPJSiXcHdX8H9-J4Sp7I5BWBxVCBhRIr-zGWfO9bbbDkjTPkpYpQ.webp", volumename: "거래 12.8만", savedimage: "_icon_saved_filled.png", brandname: "Barcelona", productname: "Barcelona Uniform 10/11", pricename: "228,000원", rightbuyname: "즉시 구매가"),
            ReleasedModel(image: "https://i.namu.wiki/i/9g4lYY972EWoXpB0dXDQkNBKJCQ3Eh5YS6zsmSjvXErEGOKZb89_UmAVbwN7YP-OqrsIlNnL6XjDM6LTv1h9a9d89Bggwj44GFFT52_Oo-tdfjy6JvTGU3O9yBIz2F8QTWLj5iiXlJV6BEL3Q7pjCA.webp", volumename: "거래 12.8만", savedimage: "_icon_saved_filled.png", brandname: "Nike", productname: "Nike Air Max 96", pricename: "228,000원", rightbuyname: "즉시 구매가"),
            ReleasedModel(image: "https://i.namu.wiki/i/wC0gc9QhE25jdJGBFl8nisCMRzAFUVoZW1PDfH1xUF20BjB-bb0kqUqpELEFU0-Zvs2PayaDh72gmKHQqAGzEM_H8NLl68zG4QqM85cqqZwU7URmXs_i-k353u5kIppGRg37rSwNsYC7fwRXFe1UUw.webp", volumename: "거래 12.8만", savedimage: "_icon_saved_filled.png", brandname: "Barcelona", productname: "Barcelona Uniform 24/25", pricename: "228,000원", rightbuyname: "즉시 구매가"),
        ]
    }
}
