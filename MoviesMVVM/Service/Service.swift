//
//  Service.swift
//  MoviesMVVM
//
//  Created by Lucas Gomesx on 17/08/22.
//

import Foundation
import Alamofire

protocol ServiceDelegate:ServiceGeneric {
    func buscarFilmes(url:String ,completion: @escaping completion<MovieModel>)
}

class Service: ServiceDelegate {
    
    func buscarFilmes(url: String ,completion: @escaping completion<MovieModel>) {
        
        AF.request(url, method: .get).validate().responseDecodable(of: MovieModel.self) { response in
            switch response.result {
            case .success(let success):
                print("")
                completion(success, nil)
            case .failure(let error):
                print("Error")
                completion(nil, error)
            }
        }
        
    }
    
}
