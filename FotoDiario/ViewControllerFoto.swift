//
//  ViewControllerFoto.swift
//  FotoDiario
//
//  Created by Sergio Morales on 5/28/19.
//  Copyright © 2019 Sergio Morales. All rights reserved.
//

import UIKit

class ViewControllerFoto: UIViewController {

    var entrada: Entrada = Entrada()
    @IBOutlet weak var foto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        foto.image = UIImage(data: entrada.foto!)
    }

}
