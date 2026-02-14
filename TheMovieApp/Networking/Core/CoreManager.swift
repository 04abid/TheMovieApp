//
//  CoreManager.swift
//  TheMovieApp
//
//  Created by Abid Kerimli on 31.01.26.
//

import Foundation
import Alamofire

class CoreManager {
    func request<T:Codable>(model: T.Type,
                            method:HTTPMethod = .get,
                            parameters: Parameters? = nil,
                            endpoint: String,
                            compleation: @escaping((T?,String?) -> Void)) {
        let url = CoreHelper.shared.configureURL(endpoint: endpoint)
        let header = CoreHelper.shared.headers
        AF.request(url,
                   method: method,
                   parameters: parameters,
                   encoding: method == .get ? URLEncoding.default : JSONEncoding.default,
                   headers:header, ).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
//                    let result = try JSONDecoder().decode(CoreModel<T>.self, from: data)
                    compleation(result,nil)
                } catch {
                    compleation(nil,error.localizedDescription)
                }
            case .failure(let error):
                compleation(nil,error.localizedDescription)
            }
        }
    }
}
