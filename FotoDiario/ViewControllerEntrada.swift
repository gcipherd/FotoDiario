//
//  ViewControllerEntrada.swift
//  FotoDiario_v2
//
//  Created by Sergio Morales on 3/17/19.
//  Copyright © 2019 Sergio Morales. All rights reserved.
//

import UIKit
import CoreData

class ViewControllerEntrada: UIViewController {
    
    var entrada: Entrada = Entrada()
    
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelFecha: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var labelEntrada: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func formatearFecha() -> String {
            let formateador = DateFormatter()
            formateador.dateFormat = "dd-MM-yyyy HH:mm"
            let fechaConFormato = formateador.string(from: entrada.fecha!)
            
            return fechaConFormato
        }
        
        recoverData()
        
        labelTitulo.text = entrada.titulo
        labelFecha.text = formatearFecha()
        imagen.image = UIImage(data: entrada.foto!)
        labelEntrada.text = entrada.entradaDiario
    }

}
