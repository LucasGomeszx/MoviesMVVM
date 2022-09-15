//
//  MovieModel.swift
//  MoviesMVVM
//
//  Created by Lucas Gomesx on 17/08/22.
//

import Foundation

struct MovieModel: Decodable {
    
    let page: Int
    let results: [Result]
    let totalPage: Int
    let totalResult: Int
    
    enum CodingKeys:String, CodingKey{
        case page
        case results
        case totalPage = "total_pages"
        case totalResult = "total_results"
    }

}

struct Result: Decodable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys:String, CodingKey{
        case id
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
}

