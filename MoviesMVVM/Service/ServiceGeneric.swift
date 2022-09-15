//
//  ServiceGeneric.swift
//  MoviesMVVM
//
//  Created by Lucas Gomesx on 17/08/22.
//

import Foundation
import Alamofire

protocol ServiceGeneric {
    typealias completion<T> = (_ result: T?, _ failure: AFError? ) -> Void
}

