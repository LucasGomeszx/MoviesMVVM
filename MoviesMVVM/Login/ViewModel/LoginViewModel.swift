//
//  HomeViewModel.swift
//  MoviesMVVM
//
//  Created by Lucas Gomesx on 16/08/22.
//

import Foundation
import Firebase

protocol LoginViewModelProtocol:AnyObject {
    func successLogin()
    func failureLogin(error: String)
}

class LoginViewModel {
    
    //MARK: - Propriedades
    
    var auth: Auth = Auth.auth()
    weak var delegate: LoginViewModelProtocol?
    
    //MARK: - Init
    init(delegate: LoginViewModelProtocol){
        self.delegate = delegate
    }
    
    //MARK: - Metodos
    public func login(email: String, senha: String){
        self.auth.signIn(withEmail: email, password: senha) { result, error in
            if error != nil {
                self.delegate?.failureLogin(error: "Usuario invalido")
            }else {
                self.delegate?.successLogin()
            }
        }
    }
    
}
