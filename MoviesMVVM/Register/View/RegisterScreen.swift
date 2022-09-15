//
//  RegisterScreen.swift
//  MoviesMVVM
//
//  Created by Lucas Gomesx on 17/08/22.
//

import UIKit

protocol RegisterScreenProtocol:AnyObject {
    func tappedRegisterButton()
}

class RegisterScreen: UIView {
    
//MARK: - Propriedades
    
    weak var delegate: RegisterScreenProtocol?
    
//MARK: - Elementos
    lazy var tituloLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Cadastro"
        l.font = UIFont.boldSystemFont(ofSize: 40)
        l.textColor = .black
        return l
    }()
    
    lazy var imageRegistro: UIImageView = {
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        i.image = UIImage(systemName: "pencil.and.outline")
        i.tintColor = .black
        i.contentMode = .scaleAspectFit
        return i
    }()
    
    lazy var emailLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .black
        l.font = UIFont.boldSystemFont(ofSize: 20)
        l.text = "Email:"
        return l
    }()
    
    lazy var emailTextField: UITextField = {
        let l = UITextField()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.autocorrectionType = .no
        l.backgroundColor = .white
        l.borderStyle = .roundedRect
        l.keyboardType = .emailAddress
        l.placeholder = "Digite seu email"
        l.textColor = .gray
        l.autocapitalizationType = .none
        return l
    }()
    
    lazy var senhaLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .black
        l.font = UIFont.boldSystemFont(ofSize: 20)
        l.text = "Senha:"
        return l
    }()
    
    lazy var senhaTextField: UITextField = {
        let l = UITextField()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.autocorrectionType = .no
        l.backgroundColor = .white
        l.borderStyle = .roundedRect
        l.isSecureTextEntry = true
        l.placeholder = "Digite sua senha"
        l.textColor = .darkGray
        l.autocapitalizationType = .none
        return l
    }()
    
    lazy var registerButton:UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Cadastrar", for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        b.setTitleColor(.white, for: .normal)
        b.clipsToBounds = true
        b.layer.cornerRadius = 7.5
        b.backgroundColor = .blue
        b.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return b
    }()
    
//MARK: - Metodos
    
    public func delegate(delegate: RegisterScreenProtocol){
        self.delegate = delegate
    }
    
    public func configureTextFieldDelegare(delegate: UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.senhaTextField.delegate = delegate
    }
    
    public func getEmail() -> String {
        return self.emailTextField.text ?? ""
    }
    
    public func getSenha() -> String {
        return self.senhaTextField.text ?? ""
    }
    
    public func validaTextField(){
        
        let email: String = self.emailTextField.text ?? ""
        let senha: String = self.senhaTextField.text ?? ""
        
        if email.isEmpty || senha.isEmpty || senha.count < 5 {
            self.registerButton.setTitleColor(.lightGray, for: .normal)
            self.registerButton.isEnabled = false
        }else {
            self.registerButton.setTitleColor(.white, for: .normal)
            self.registerButton.isEnabled = true
        }
        
    }
    
    @objc private func tappedRegisterButton(){
        self.delegate?.tappedRegisterButton()
    }
    

//MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViewCode()
        self.validaTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Configurando ViewCode
extension RegisterScreen: ViewCode {
    func addView() {
        self.addSubview(tituloLabel)
        self.addSubview(imageRegistro)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(senhaLabel)
        self.addSubview(senhaTextField)
        self.addSubview(registerButton)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            self.tituloLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.tituloLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.imageRegistro.topAnchor.constraint(equalTo: self.tituloLabel.bottomAnchor, constant: 15),
            self.imageRegistro.leadingAnchor.constraint(equalTo: self.leadingAnchor ,constant: 60),
            self.imageRegistro.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            self.imageRegistro.heightAnchor.constraint(equalToConstant: 150),
            
            self.emailLabel.topAnchor.constraint(equalTo: self.imageRegistro.bottomAnchor, constant: 20),
            self.emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 10),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.emailLabel.leadingAnchor),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.emailLabel.trailingAnchor),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 55),
            
            self.senhaLabel.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 10),
            self.senhaLabel.leadingAnchor.constraint(equalTo: self.emailLabel.leadingAnchor),
            self.senhaLabel.trailingAnchor.constraint(equalTo: self.emailLabel.trailingAnchor),
            
            self.senhaTextField.topAnchor.constraint(equalTo: self.senhaLabel.bottomAnchor, constant: 10),
            self.senhaTextField.leadingAnchor.constraint(equalTo: self.emailLabel.leadingAnchor),
            self.senhaTextField.trailingAnchor.constraint(equalTo: self.emailLabel.trailingAnchor),
            self.senhaTextField.heightAnchor.constraint(equalToConstant: 55),
            
            self.registerButton.topAnchor.constraint(equalTo: self.senhaTextField.bottomAnchor, constant: 25),
            self.registerButton.leadingAnchor.constraint(equalTo: self.emailLabel.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.emailLabel.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalToConstant: 55),
        ])
    }
    
    func additionalConfig() {
        self.backgroundColor = .white
    }
    
    func setUpViewCode() {
        addView()
        addConstraints()
        additionalConfig()
    }
    
}
