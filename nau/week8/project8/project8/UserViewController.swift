//
//  UserViewController.swift
//  project8
//
//  Created by KoNangYeon on 11/20/24.
//

import UIKit
import Moya


class UserViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserInfr()
        postFile()
    }
    
    //네트워크 요청을 수행할 객체
    private let provider = MoyaProvider<UserTargetType>()
    
    private func getUserInfr() {
        provider.request(.getAllUsers) { result in
            switch result {
            case .success(let response):
                do {
                    let userResponse = try response.map([UserResponseModel].self)
                    print("Successfully mapped response: \(userResponse)")
                } catch {
                    print("Mapping error: \(error.localizedDescription)")
                }
            case .failure(let error):
                print("Network request error: \(error.localizedDescription)")
            }
        }
    }
    
    private func postFile() {
        guard let image = UIImage(named: "nau")?.pngData() else {
            fatalError("Error")
        }
        
        provider.request(.postFile(image: image)) { result in
            switch result {
            case .success(let response):
                do {
                    let fileResponse = try response.map(FileResponseModel.self)
                    print("File Response: \(fileResponse)")
                } catch {
                    print("Mapping Error")
                }
            case .failure(_):
                print("Network request error")
            }
        }
    }
}
