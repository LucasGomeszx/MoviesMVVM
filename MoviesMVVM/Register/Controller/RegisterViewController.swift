//
//  RegisterViewController.swift
//  MoviesMVVM
//
//  Created by Lucas Gomesx on 17/08/22.
//

import UIKit

class RegisterViewController: UIViewController {
    //MARK: - Propriedades
    var screen: RegisterScreen?
    var viewModel: RegisterViewModel?
    private var alert: Alert?
    
    //MARK: - LifeCycle
    override func loadView() {
        self.screen = RegisterScreen()
        self.viewModel = RegisterViewModel(delegate: self)
        self.alert = Alert(controller: self)
        self.view = self.screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen?.delegate(delegate: self)
        self.screen?.configureTextFieldDelegare(delegate: self)
    }

}

//MARK: - UITextFieldDelegate
extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.screen?.validaTextField()
    }
    
}

//MARK: - RegisterScreenDelegate
extension RegisterViewController: RegisterScreenProtocol {
    
    func tappedRegisterButton() {
        guard let registerScreen = self.screen else {return}
        self.viewModel?.cadastrarUsuario(email: registerScreen.getEmail(), senha: registerScreen.getSenha())
    }
    
}

//MARK: - RegisterViewModelDelegate
extension RegisterViewController: RegisterViewModelProtocol {
    func succesRegister() {
        self.alert?.getAlert(titulo: "Succes", mensagem: "Usuario Cadastrado", compleion: {
            self.navigationController?.popViewController(animated: true)
        })
    }
    
    func failureRegister(error: String) {
        self.alert?.getAlert(titulo: "Error", mensagem: error)
    }
    
}
