//
//  Untitled.swift
//  KREAM
//
//  Created by 이태림 on 11/4/24.
//

import UIKit
import Kingfisher

struct MustItemModel {
    let image: String
    let name: String
}


extension MustItemModel {
    static func mustitemdummy() -> [MustItemModel] {
        return [
            MustItemModel(image: "https://s3-alpha-sig.figma.com/img/999a/ac4f/8290511532eeec15c78ddcf3dec05b24?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=WrFla2kkUbUAK3FAS1YJe3RUUSV~MKPLEil0pYo6SHemVZ6tO2nCW9c60qN~ODQdBdEVf2jaIYUJttq1Sq7f282WdX8qRuLA98O9I-oPI06uIN7DxE9ET49NFkpk2XykZrowpx1MrBYCi2dCzUP6-98oUrinHzltwvoqI0QyrRmxFiSY41oosFPqChqZmB0~TtyNKVSwfQAY-IdR0uNwYY9fFK0RQxb1RIf8Za0Hbcmyx85ADIylllLnxkFJqOx7xaiHOvME~XDTC7ubqE-6NYWohLzVrjMVcGXo~kQZ0C2L0OFQTPwdxL4s18Cls9fnJtKM0Hczkdn9ig8UTHaPNg__", name: "@katarinabluu"),
            MustItemModel(image: "https://s3-alpha-sig.figma.com/img/ca87/468e/5d814c960a1a06130e85528296c08042?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Oc04XAlC9EIhsu90BhObc0CKQJ22uYk1-G-j5a-unx01776u2oTTC4GDaQF9fyp1xo6cNXo7EkpiTTMtt0R-Y6BUacZnuhDIhtIYKD3Kd72EVHUQ5F8OqZWI1walu40pPTXtJHCNdR6aiG2WrmqioXpSslQt1PmccFLbyvdykA0YCBT5rFnYGnBfxuuxPzxKmrd-3EsPaEkAKJEqPvdrrIegSZ8x~sjuupfLLA0UZtKIdlPPfoaz6iDDW9kmYNZ3IkOvgPthcXtbVNzkeqGgq38YEBjDFogJk14L-npbqsp~Ev1Xi7Xgv3ZSDYtMu5ujFJl5CJl0O5bb9hTyw-XqZQ__", name: "@imwinter"),
            MustItemModel(image: "https://s3-alpha-sig.figma.com/img/e6d3/d6d7/e302cef496c775bbc7ee11b1a49f53fa?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=qnrjr-DxavyZvpFRl0Qr091hiNC7URX29yJisXLlb3a8qR836A~UnrMDi3NILZA~wwxh1E5jt98qe0EOtvlwyXSNbzsQgfkmgjyfEbauKC3ZTuVAQSgoRpIkdLexPs5x-tCA70CjWkweEjZ3uRLMBJKnaqA3vaeGeaUSluM7msLSqGjvo9-gKlS4JfDgLIcRywWs28NQTIZKCEVTkoAiPQaH0cnGMFqVcV4E-730ruj67iw6tIzlbvWrBwf4SMvgx7ylr-ZeylJ9nVX3JAXpIjSFVS2XQNe3R-hBJRb6KQQkiBv4~qftpemcKzsGYjUVt0CuDrJm4MAfpF47pV6KHQ__", name: "@thousand_wooo"),
            MustItemModel(image: "https://i.namu.wiki/i/p_eE80Ub_fWrOY6pzUTdU5-Oxt4QDwjt9WlGhMOaXJaZcf9pYWdqCjpqVqu_AUWwH_NrIEk4z61WV3j8IpC9eksKtq8Svvijg7ZgrWnjKZVc9H1ZOd7FPBIn_LSRG5nULK_ALSrrZYCBV79F-AjuJg.webp", name: "@차은우"),
            MustItemModel(image: "https://i.namu.wiki/i/HyxjREphqWUyNZxAOupp3T3sMUCqkytjkmDemo1S3XrrBZNQ_VgdkhHbHHvViTz6ufUCjAqAvQ2j54cicL0gkgDouMmSQpThn_fUSqNM8XrDS-CEK2f3jeXUkB2FhMq4nVj5su93wKBZdcB2cSVrzQ.webp", name: "@하니"),
            MustItemModel(image: "https://i.namu.wiki/i/P4dXXG7bRx7X-CZk1-_5kCowOHKkhayeeTZ72jvUaKaXfTyHZqeyXx5k9mEL9pOqMoDqLqZA_SQPAHq3FajWAKRyA84DxUNIy4XSnWHTszDyrwT6viDxuI_d_cDUUxwn7EdlPZOYeXKyNEy5mLeeEw.webp", name: "@노윤서"),
            MustItemModel(image: "https://i.namu.wiki/i/HyB9Ije_SXqk6rS1DfwcgFopTaqMUt_fvX20GWIFVgjnmChhwbbYDEuNejVWWuZLlYe6bCcAS9NY_62jH_C2Qj3CpOeAvw5puiPvPZ1RbLbulE89Lu7nr-ZVQclrVPUOykWkTfBocP4Kk9sNuNcfow.webp", name: "@오해원"),
            MustItemModel(image: "https://i.namu.wiki/i/NBJyPRO1ehYmSOg_GgHD-AT6nzU1yOFClVjxeht9fIOfYSE0Bp-xA9x-pYFGffXgYMkHrtNLrHznlRCTGeKqm1pZDBFEE97GmWab822X2pBZDTeugMkLUHJk24MHiLUIDqq_h0Snl-3P3pv_S3U2Ig.webp", name: "@지드래곤"),
            MustItemModel(image: "https://i.namu.wiki/i/-uobojS0J7wNOKrxSfo5dvsBlJnYFOwHP4onz6BxjPio-UqcMOO-Nzn4mMCkyi1Z3IHa_WKd26505Dv-5jIx4PMBl7ExR0PabRxi_3TGl4EjOscLN1XMVIyokZQ-Ci8hLGpkMp6FwGS8XOa0uAJcjA.webp", name: "@자이언티"),
            MustItemModel(image: "https://i.namu.wiki/i/WkciSEebfJNQEzbz2puXbkqgSYntkRWKAc50k3Uo9bhLSZtK0qS6psztJ7DoBMGalLVasENJPJCrjmKjq6PZ2aZbv_6q0F64rhZC6Oc9zVuf37ZmsQjh0DT7lX3P5sYaENT1s_kkVao366kAZUR2dw.webp", name: "@messi")
        ]
    }
}
