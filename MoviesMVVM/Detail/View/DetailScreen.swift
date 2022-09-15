//
//  DetailScreen.swift
//  MoviesMVVM
//
//  Created by Lucas Gomesx on 24/08/22.
//

import UIKit

protocol DetailScreenProtocol: AnyObject {
    func tappedBackButton()
}

class DetailScreen: UIView {
    //MARK: - Propriedades
    
    weak var delegate: DetailScreenProtocol?
    
    //MARK: - Elementos
    lazy var scroolView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.autoresizingMask = .flexibleHeight
        view.bounces = false
        view.clipsToBounds = true
        return view
    }()
    
    lazy var imageFilme:UIImageView = {
        let l = UIImageView()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.contentMode = .scaleAspectFill
        l.clipsToBounds = true
        return l
    }()
    
    lazy var backButton:UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setBackgroundImage(UIImage(systemName: "arrow.backward.circle"), for: .normal)
        b.tintColor = .white
        b.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        return b
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
        l.textColor = .white
        return l
    }()
    
    lazy var descFilme:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 18)
        l.textColor = .lightGray
        l.numberOfLines = 0
        return l
    }()
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Metodos
    
    @objc private func tappedBackButton(){
        self.delegate?.tappedBackButton()
    }
    
    public func setUpView(filme: Result){
        self.imageFilme.dowloadImage(from: filme.posterPath)
        self.notaFilme.text = String(filme.voteAverage)
        self.descFilme.text = filme.overview
    }
    
    public func detailDelegate(delegate: DetailScreenProtocol){
        self.delegate = delegate
    }
    
}

//MARK: - Configurando ViewCode
extension DetailScreen: ViewCode {
    func addView() {
        self.addSubview(scroolView)
        self.scroolView.addSubview(imageFilme)
        self.scroolView.addSubview(backButton)
        self.scroolView.addSubview(starFilme)
        self.scroolView.addSubview(notaFilme)
        self.scroolView.addSubview(descFilme)
    }
    
    func addConstraints() {
        let window = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows.filter({$0.isKeyWindow}).first
        
        let topPadding = window?.safeAreaInsets.top
        
        NSLayoutConstraint.activate([
            self.scroolView.topAnchor.constraint(equalTo: self.topAnchor),
            self.scroolView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.scroolView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.scroolView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.imageFilme.topAnchor.constraint(equalTo: self.scroolView.topAnchor,constant: -(topPadding ?? 0)),
            self.imageFilme.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.imageFilme.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.imageFilme.heightAnchor.constraint(equalToConstant: 500),
            
            self.backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.backButton.heightAnchor.constraint(equalToConstant: 30),
            self.backButton.widthAnchor.constraint(equalToConstant: 30),
            
            self.starFilme.topAnchor.constraint(equalTo: self.imageFilme.bottomAnchor,constant: 10),
            self.starFilme.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15),
            self.starFilme.heightAnchor.constraint(equalToConstant: 30),
            self.starFilme.widthAnchor.constraint(equalToConstant: 30),
            
            self.notaFilme.centerYAnchor.constraint(equalTo: self.starFilme.centerYAnchor),
            self.notaFilme.leadingAnchor.constraint(equalTo: self.starFilme.trailingAnchor, constant: 10),
            
            self.descFilme.topAnchor.constraint(equalTo: self.starFilme.bottomAnchor,constant: 15),
            self.descFilme.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15),
            self.descFilme.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15),
        ])
    }
    
    func additionalConfig() {
        self.backgroundColor = .black
    }
    
    func setUpViewCode() {
        addView()
        addConstraints()
        additionalConfig()
    }
    
}
