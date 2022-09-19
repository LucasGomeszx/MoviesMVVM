//
//  HomeViewController.swift
//  MoviesMVVM
//
//  Created by Lucas Gomesx on 16/08/22.
//

import UIKit

class LoginViewController: UIViewController {
    //MARK: - Propriedades
    
    var screen: LoginScreen?
    var viewModel: LoginViewModel?
    private var alert: Alert?
    
    //MARK: - LifeCycle
    override func loadView() {
        self.screen = LoginScreen()
        self.viewModel = LoginViewModel(delegate: self)
        self.alert = Alert(controller: self)
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen?.screenDelegate(delegate: self)
        self.screen?.configureTextFieldDelegate(delegate: self)
    }

}

//MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.screen?.validaTextField()
    }
    
}

//MARK: - ScreenDelegate
extension LoginViewController: LoginScreenProtocol {
    func tappedLoginButton() {
        guard let loginScreen = self.screen else {return}
        self.viewModel?.login(email: loginScreen.getEmail(), senha: loginScreen.getSenha())
    }
    
    func tappedRegisterButton() {
        let vc = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

//MARK: - LoginViewModelDelegate
extension LoginViewController: LoginViewModelProtocol {
    func successLogin() {
        let vc = HomeViewController()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true, completion: nil)
    }
    
    func failureLogin(error: String) {
        self.alert?.getAlert(titulo: "Error", mensagem: error)
    }
    
}
