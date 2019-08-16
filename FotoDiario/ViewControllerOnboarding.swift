//
//  ViewControllerOnboarding.swift
//  FotoDiario_v2
//
//  Created by Laboratorio UNAM-Apple 10 on 29/03/19.
//  Copyright © 2019 Sergio Morales. All rights reserved.
//

import UIKit

class ViewControllerOnboarding: UIViewController {

    @IBOutlet weak var textFieldNombre: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func botonContinuar(_ sender: Any) {
        
        guard let nombre = textFieldNombre.text, nombre != "" else {
            let alert = UIAlertController(title: "No deje campos vacíos", message: "Por favor introduzca su nombre.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert, animated: true)
            return
        }
        
        saveUsuario(nombre: textFieldNombre.text!)
        UserDefaults.standard.set(textFieldNombre.text, forKey: "name")
        performSegue(withIdentifier: "segueAPrincipal", sender: self)
    }

}
