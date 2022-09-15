//
//  LoginScreen.swift
//  MoviesMVVM
//
//  Created by Lucas Gomesx on 16/08/22.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func tappedLoginButton()
    func tappedRegisterButton()
}

class LoginScreen: UIView {
    
//MARK: - Propriedades
    
    weak var delegate: LoginScreenProtocol?

//MARK: - Elementos
    lazy var nameLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .black
        l.font = UIFont.boldSystemFont(ofSize: 40)
        l.text = "Login"
        return l
    }()
    
    lazy var imageLogin: UIImageView = {
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        i.image = UIImage(systemName: "moon.stars")
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
        l.textColor = .darkGray
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
    
    lazy var loginButton:UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Logar", for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        b.setTitleColor(.white, for: .normal)
        b.clipsToBounds = true
        b.layer.cornerRadius = 7.5
        b.backgroundColor = .blue
        b.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        return b
    }()
    
    lazy var registerButton:UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Não tem conta? Cadastre-se", for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        b.setTitleColor(.black, for: .normal)
        b.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return b
    }()
    
//MARK: - Metodos
    
    public func configureTextFieldDelegate(delegate: UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.senhaTextField.delegate = delegate
    }
    
    public func screenDelegate(delegate: LoginScreenProtocol){
        self.delegate = delegate
    }
    
    public func getEmail() -> String {
        return emailTextField.text ?? ""
    }
    
    public func getSenha() -> String {
        return senhaTextField.text ?? ""
    }
    
    public func validaTextField(){
        
        let email: String = self.emailTextField.text ?? ""
        let senha: String = self.senhaTextField.text ?? ""
        
        if email.isEmpty || senha.isEmpty || senha.count < 5{
            self.loginButton.setTitleColor(.lightGray, for: .normal)
            self.loginButton.isEnabled = false
        }else {
            self.loginButton.setTitleColor(.white, for: .normal)
            self.loginButton.isEnabled = true
        }
        
    }
    
    @objc private func tappedLoginButton(){
        self.delegate?.tappedLoginButton()
    }
    
    @objc private func tappedRegisterButton(){
        self.delegate?.tappedRegisterButton()
    }
    
    
//MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.setUpViewCode()
        self.validaTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Configurando ViewCode
extension LoginScreen: ViewCode {
    func addView() {
        self.addSubview(self.nameLabel)
        self.addSubview(self.imageLogin)
        self.addSubview(self.emailLabel)
        self.addSubview(self.emailTextField)
        self.addSubview(self.senhaLabel)
        self.addSubview(self.senhaTextField)
        self.addSubview(self.loginButton)
        self.addSubview(self.registerButton)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            self.nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.imageLogin.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 15),
            self.imageLogin.leadingAnchor.constraint(equalTo: self.leadingAnchor ,constant: 60),
            self.imageLogin.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            self.imageLogin.heightAnchor.constraint(equalToConstant: 150),
            
            self.emailLabel.topAnchor.constraint(equalTo: self.imageLogin.bottomAnchor, constant: 20),
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
            
            self.loginButton.topAnchor.constraint(equalTo: self.senhaTextField.bottomAnchor, constant: 25),
            self.loginButton.leadingAnchor.constraint(equalTo: self.emailLabel.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.emailLabel.trailingAnchor),
            self.loginButton.heightAnchor.constraint(equalToConstant: 55),
            
            self.registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 20),
            self.registerButton.leadingAnchor.constraint(equalTo: self.emailLabel.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.emailLabel.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalToConstant: 55)
            
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
