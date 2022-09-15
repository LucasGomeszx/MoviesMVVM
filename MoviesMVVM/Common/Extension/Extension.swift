//
//  Extension.swift
//  MoviesMVVM
//
//  Created by Lucas Gomesx on 23/08/22.
//

import Foundation
import UIKit

extension UIImageView {
    
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?)->()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func dowloadImage(from url: String) {
        let baseUrl = "https://image.tmdb.org/t/p/w500"
        guard let _url = URL(string: baseUrl+url)else {
            return
        }
        
        getData(from: _url) { data, response, error in
            guard let data = data,error == nil else {return}
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.image = UIImage(data: data)
            }
        }
    }
    
}
