//
//  Alert.swift
//  FireTeste
//
//  Created by Lucas Gomesx on 09/08/22.
//

import UIKit

class Alert:NSObject {
    
    var controller: UIViewController
    
    init(controller:UIViewController) {
        self.controller = controller
    }
    
    func getAlert(titulo:String, mensagem:String, compleion:(()->Void)? = nil) {
        
        let alertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let cancelar = UIAlertAction(title: "Ok", style: .cancel) { acao in
            compleion?()
        }
        alertController.addAction(cancelar)
        self.controller.present(alertController, animated: true, completion: nil)
        
    }
}
