//
//  MessageDisplayable.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 21/11/22.
//

import UIKit

protocol MessageDisplayProtocol { }

extension MessageDisplayProtocol where Self: UIViewController {
    func presentAlert(message: String, title: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
}
