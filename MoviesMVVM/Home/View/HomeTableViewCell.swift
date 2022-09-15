//
//  HomeTableViewCell.swift
//  MoviesMVVM
//
//  Created by Lucas Gomesx on 17/08/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    //MARK: - Propriedades
    static let identifier: String = "HomeTableViewCell"
    
    private var viewModel:HomeCellViewModel?
    
    //MARK: - Elementos
    lazy var filmeCard: FilmesCardView = {
        let f = FilmesCardView()
        f.translatesAutoresizingMaskIntoConstraints = false
        f.layer.cornerRadius = 20
        f.clipsToBounds = true
        return f
    }()
    
    //MARK: - Metodos
    
    public func configurarCell(filme: Result){
        
        self.viewModel = HomeCellViewModel(movie: filme)
        
        self.filmeCard.nameFilme.text = self.viewModel?.getName
        self.filmeCard.imageFilme.dowloadImage(from: self.viewModel?.getPoster ?? "")
        self.filmeCard.notaFilme.text = self.viewModel?.getVoteAvarage
        self.filmeCard.dataFilme.text = self.viewModel?.formatarData
        
    }
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Configurando ViewCode
extension HomeTableViewCell: ViewCode {
    
    func addView() {
        self.contentView.addSubview(filmeCard)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            self.filmeCard.topAnchor.constraint(equalTo: self.topAnchor),
            self.filmeCard.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            self.filmeCard.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            self.filmeCard.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -24)
        ])
    }
    
    func additionalConfig() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    
    func setUpViewCode() {
        addView()
        addConstraints()
        additionalConfig()
    }
    
}
