//
//  DetailViewController.swift
//  MoviesMVVM
//
//  Created by Lucas Gomesx on 24/08/22.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    //MARK: - Propriedades

    var viewModel:DetailViewModel!
    var screen: DetailScreen?
    
    //MARK: - Init
    init(with filme: Result){
        self.viewModel = DetailViewModel(movie: filme)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    override func loadView() {
        self.screen = DetailScreen()
        self.view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen?.detailDelegate(delegate: self)
        self.screen?.setUpView(filme: self.viewModel.getMovie)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
}

//MARK: - DetailViewControllerProtocol
extension DetailViewController: DetailScreenProtocol {
    func tappedBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
