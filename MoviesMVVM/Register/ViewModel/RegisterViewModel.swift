//
//  RegisterViewModel.swift
//  MoviesMVVM
//
//  Created by Lucas Gomesx on 17/08/22.
//

import Foundation
import Firebase

protocol RegisterViewModelProtocol: AnyObject{
    func succesRegister()
    func failureRegister(error: Error?)
}

class RegisterViewModel {
    //MARK: - Propriedades
    var auth: Auth = Auth.auth()
    weak var delegate: RegisterViewModelProtocol?
    
    //MARK: - Init
    init(delegate: RegisterViewModelProtocol){
        self.delegate = delegate
    }
    
    //MARK: - Metodos
    public func cadastrarUsuario(email: String, senha: String){
        self.auth.createUser(withEmail: email, password: senha) { result, error in
            if error != nil {
                self.delegate?.failureRegister(error: error)
            }else {
                self.delegate?.succesRegister()
            }
        }
    }
    
}
