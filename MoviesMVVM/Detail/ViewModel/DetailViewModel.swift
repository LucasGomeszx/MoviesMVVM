//
//  DetailViewModel.swift
//  MoviesMVVM
//
//  Created by Lucas Gomesx on 24/08/22.
//

import Foundation

class DetailViewModel {
    
    //MARK: - Propriedades
    private var movie:Result
    
    //MARK: - Init
    init(movie:Result) {
        self.movie = movie
    }
    
    
    
    //MARK: - Getter/Setter
    public var getMovie:Result {
        return self.movie
    }
    
    public var getName:String {
        return self.movie.title
    }
    
    public var getSinope:String {
        return self.movie.overview
    }
    
    public var getDate:String {
        return self.movie.releaseDate
    }
    
    public var getMediaVotos:String {
        return String(self.movie.voteAverage)
    }
    
    public var getImage:String {
        return self.movie.posterPath
    }
    
}
