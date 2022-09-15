//
//  HomeViewController.swift
//  MoviesMVVM
//
//  Created by Lucas Gomesx on 17/08/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Propriedades
    private var viewModel: HomeViewModel!
    private var screen: HomeScreen?
    private var alert: Alert?
    
    //MARK: - LifeCycle
    override func loadView() {
        self.screen = HomeScreen()
        self.view = self.screen
        self.viewModel = HomeViewModel(delegate: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigation()
        self.viewModel?.buscarFilmes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.alert = Alert(controller: self)
    }
    
    //MARK: - Metodos
    private func configureNavigation(){
        self.title = "Filmes Populares"
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.clear //Cor da barra
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black] //Cor do texto
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
    }

}

//MARK: - HomeViewModelProtocol
extension HomeViewController: HomeViewModelProtocol {
    
    func successService() {
        self.screen?.configurandoTableView(delegate: self, dataSource: self)
        self.screen?.filmesTableView.reloadData()
    }
    
    func failureService(error: String) {
        self.alert?.getAlert(titulo: "Error", mensagem: error)
    }
    
}

//MARK: - TableViewDelegate e DataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getMoviesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell
        cell?.configurarCell(filme: self.viewModel.getMovie(index: indexPath))
        self.viewModel.buscarMaisFilmes(index: indexPath)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController(with: self.viewModel.getMovie(index: indexPath))
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
}
