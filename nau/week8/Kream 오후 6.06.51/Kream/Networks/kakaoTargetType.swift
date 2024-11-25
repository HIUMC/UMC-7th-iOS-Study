//
//  kakaoTargetType.swift
//  Kream
//
//  Created by KoNangYeon on 11/23/24.
//

import Foundation
import Moya
import KakaoSDKTemplate
import KakaoSDKUser

enum kakaoTargetType {
    case profileImage
}

extension kakaoTargetType : TargetType {
    var baseURL: URL {
        guard let baseURL = URL(string: Image)) else {
            fatalError("Error: Invalid URL")
        }
        
        return baseURL
    }
    
    var path: String {
        <#code#>
    }
    
    var method: Moya.Method {
        <#code#>
    }
    
    var task: Moya.Task {
        <#code#>
    }
    
    var headers: [String : String]? {
        <#code#>
    }
    
    
}
