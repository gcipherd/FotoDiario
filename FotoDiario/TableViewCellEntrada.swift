//
//  TableViewCellEntrada.swift
//  FotoDiario_v2
//
//  Created by Sergio Morales on 3/12/19.
//  Copyright © 2019 Sergio Morales. All rights reserved.
//

import UIKit

class TableViewCellEntrada: UITableViewCell {

    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelFecha: UILabel!
    @IBOutlet weak var labelEntrada: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
