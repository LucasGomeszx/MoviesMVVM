//
//  FilmesCardView.swift
//  MoviesMVVM
//
//  Created by Lucas Gomesx on 17/08/22.
//

import UIKit

class FilmesCardView: UIView {
    
    //MARK: - Elementos
    
    lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        return blurView
    }()
    
    lazy var imageFilme: UIImageView = {
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        i.contentMode = .scaleAspectFill
        return i
    }()
    
    lazy var nameFilme: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.boldSystemFont(ofSize: 16)
        l.textColor = .black
        l.numberOfLines = 2
        return l
    }()
    
    lazy var starFilme: UIImageView = {
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        i.contentMode = .scaleAspectFill
        i.image = UIImage(systemName: "star")
        i.tintColor = .yellow
        return i
    }()
    
    lazy var notaFilme: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.boldSystemFont(ofSize: 16)
        l.textColor = .black
        return l
    }()

    lazy var lancamentoFilme: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 12)
        l.textColor = .black
        l.text = "Lançamento:"
        return l
    }()
    
    lazy var dataFilme: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 12)
        l.textColor = .black
        return l
    }()
    
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
extension FilmesCardView: ViewCode {
    func addView() {
        self.addSubview(blurView)
        self.addSubview(imageFilme)
        self.addSubview(nameFilme)
        self.addSubview(starFilme)
        self.addSubview(notaFilme)
        self.addSubview(lancamentoFilme)
        self.addSubview(dataFilme)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            self.blurView.topAnchor.constraint(equalTo: self.topAnchor),
            self.blurView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.blurView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.blurView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.imageFilme.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageFilme.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.imageFilme.heightAnchor.constraint(equalToConstant: 150),
            self.imageFilme.widthAnchor.constraint(equalToConstant: 100),
            
            self.nameFilme.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            self.nameFilme.leadingAnchor.constraint(equalTo: self.imageFilme.trailingAnchor, constant: 10),
            self.nameFilme.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            self.starFilme.topAnchor.constraint(equalTo: self.nameFilme.bottomAnchor,constant: 15),
            self.starFilme.leadingAnchor.constraint(equalTo: self.imageFilme.trailingAnchor, constant: 10),
            self.starFilme.heightAnchor.constraint(equalToConstant: 30),
            self.starFilme.widthAnchor.constraint(equalToConstant: 30),
            
            self.notaFilme.leadingAnchor.constraint(equalTo: self.starFilme.trailingAnchor, constant: 10),
            self.notaFilme.centerYAnchor.constraint(equalTo: self.starFilme.centerYAnchor),
            
            self.lancamentoFilme.topAnchor.constraint(equalTo: self.starFilme.bottomAnchor, constant: 10),
            self.lancamentoFilme.leadingAnchor.constraint(equalTo: self.imageFilme.trailingAnchor, constant: 10),

            self.dataFilme.topAnchor.constraint(equalTo: self.lancamentoFilme.bottomAnchor, constant: 5),
            self.dataFilme.leadingAnchor.constraint(equalTo: self.lancamentoFilme.leadingAnchor),
        ])
    }
    
    func additionalConfig() {
        
    }
    
    func setUpViewCode() {
        addView()
        addConstraints()
        additionalConfig()
    }
    
}
