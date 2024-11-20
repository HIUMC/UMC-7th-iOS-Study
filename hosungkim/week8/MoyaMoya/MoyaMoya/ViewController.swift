//
//  ViewController.swift
//  MoyaMoya
//
//  Created by 김호성 on 2024.11.20.
//

import UIKit
import Moya

class ViewController: UIViewController {
    
    private let provider = MoyaProvider<UserTargetType>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserInfo()
        postFile()
    }
    
    private func getUserInfo() {
        provider.request(.getAllUsers, completion: { result in
            switch result {
            case .success(let response):
                if let userResponse = try? response.map([UserResponseModel].self) {
                    print("Successfully mapped response: \(userResponse)")
                }
            case .failure(let error):
                print("Network request error: \(error)")
            }
        })
    }
    
    private func postFile() {
        guard let image = Image(resource: .hongik).pngData() else { fatalError("Error: Invalid image!") }
        
        provider.request(.postFile(image: image), completion: { result in
            switch result {
            case .success(let response):
                if let fileResponse = try? response.map(FileResponseModel.self) {
                    print("Successfully mapped response: \(fileResponse)")
                }
            case .failure(let error):
                print("Network request error: \(error)")
            }
        })
    }
}

