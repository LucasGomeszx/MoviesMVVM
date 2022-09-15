//
//  HomeViewModel.swift
//  MoviesMVVM
//
//  Created by Lucas Gomesx on 17/08/22.
//

import Foundation

protocol HomeViewModelProtocol:AnyObject {
    func successService()
    func failureService(error: String)
}

class HomeViewModel {
    
//MARK: - Propriedades
    
    private var service:Service = Service()
    private var delegate: HomeViewModelProtocol?
    
    private var listaFilmes:[Result] = []
    private var page: Int = 1
    private var totalPage: Int = 0
    

//MARK: - Init
    init(delegate: HomeViewModelProtocol){
        self.delegate = delegate
    }
    
//MARK: - Metodos
    
    public func buscarFilmes() {
        service.buscarFilmes(url: self.montarUrl()) { result, failure in
            if failure != nil {
                DispatchQueue.main.async {
                    guard let error = failure else {
                        return
                    }
                    self.delegate?.failureService(error: error.localizedDescription)
                }
            }else {
                DispatchQueue.main.async {
                    if let filmes = result {
                        self.listaFilmes = self.listaFilmes + filmes.results
                        self.page = filmes.page + 1
                        self.totalPage = filmes.totalPage
                        self.delegate?.successService()
                    }
                }
            }
        }
    }
    
    public func buscarMaisFilmes(index: IndexPath){
        if index.row + 1 == getMoviesCount() && page <= totalPage {
            self.buscarFilmes()
        }
    }
    
    public func getMoviesCount() -> Int {
        return self.listaFilmes.count
    }
    
    public func getMovie(index: IndexPath) -> Result {
        return self.listaFilmes[index.row]
    }
    
    
//MARK: - Metodos Privados
    
    private func montarUrl() -> String{
        let url = Constantes.baseUrl + "\(self.page)"
        return url
    }
    
}
