//
//  TableViewControllerEntradas.swift
//  FotoDiario_v2
//
//  Created by Sergio Morales on 3/12/19.
//  Copyright © 2019 Sergio Morales. All rights reserved.
//

import UIKit
import CoreData

class TableViewControllerEntradas: UITableViewController {
    
    var entradas: [Entrada] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recoverData()
        print(entradas)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entradas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellEntrada", for: indexPath) as! TableViewCellEntrada
        
        let entradaUnica = entradas[indexPath.row]
        
        func formatearFecha() -> String {
            let formateador = DateFormatter()
            formateador.dateFormat = "dd-MM-yyyy HH:mm"
            let fechaConFormato = formateador.string(from: entradaUnica.fecha!)
            
            return fechaConFormato
        }
        
        cell.imagen.image = UIImage(data: entradaUnica.foto!)
        cell.labelTitulo.text = entradaUnica.titulo
        cell.labelFecha.text = formatearFecha()
        cell.labelEntrada.text = entradaUnica.entradaDiario
        
        return cell
    }
    
    func connection() -> NSManagedObjectContext {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    
    func recoverData(){
        let context = connection()
        let fetchRequest : NSFetchRequest<Entrada> = Entrada.fetchRequest()
        
        do {
           entradas = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("No se pudo recuperar los datos.", error)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewEntrada = segue.destination as! ViewControllerEntrada
        viewEntrada.entrada = self.entradas[(tableView.indexPathForSelectedRow?.row)!]
    }


}
