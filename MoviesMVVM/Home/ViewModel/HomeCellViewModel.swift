//
//  HomeCellViewModel.swift
//  MoviesMVVM
//
//  Created by Lucas Gomesx on 24/08/22.
//

import Foundation

class HomeCellViewModel {
    
    //MARK: - Propriedades
    private var movie: Result
    
    //MARK: - Init
    init(movie: Result){
        self.movie = movie
    }
    
    //MARK: - Metodos
    
    public var formatarData:String{
        let dataRecebida: String = self.movie.releaseDate
        let getDateFormatter = DateFormatter()
        getDateFormatter.dateFormat = "yyyy-MM-dd"
        let setDateFormatter = DateFormatter()
        setDateFormatter.dateFormat = "dd/MM/yyyy"
        
        if let date = getDateFormatter.date(from: dataRecebida) {
            let novaData = setDateFormatter.string(from: date)
            return novaData
        }
        return ""
    }
    
    //MARK: - Getter/Setter
    
    public var getName:String {
        return self.movie.title
    }
    
    public var getPoster:String {
        return self.movie.posterPath
    }
    
    public var getVoteAvarage:String {
         return String(movie.voteAverage)
    }
    
}
