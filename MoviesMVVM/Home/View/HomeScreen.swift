//
//  HomeScreen.swift
//  MoviesMVVM
//
//  Created by Lucas Gomesx on 17/08/22.
//

import UIKit

class HomeScreen: UIView {
    
//MARK: - Elementos
    lazy var filmesTableView: UITableView = {
        let t = UITableView()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        t.backgroundColor = .clear
        t.separatorStyle = .none
        return t
    }()

//MARK: - Metodos
    
    public func configurandoTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        self.filmesTableView.delegate = delegate
        self.filmesTableView.dataSource = dataSource
    }
    
//MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Configurando ViewCode
extension HomeScreen: ViewCode {
    func addView() {
        self.addSubview(filmesTableView)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            self.filmesTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.filmesTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.filmesTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.filmesTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func additionalConfig() {
        self.backgroundColor = .lightGray
    }
    
    func setUpViewCode() {
        addView()
        addConstraints()
        additionalConfig()
    }
    
}
