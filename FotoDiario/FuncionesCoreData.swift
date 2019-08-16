//
//  Funciones.swift
//  FotoDiario
//
//  Created by Laboratorio UNAM-Apple 10 on 5/24/19.
//  Copyright © 2019 Sergio Morales. All rights reserved.
//

import Foundation
import UIKit
import CoreData

func connection() -> NSManagedObjectContext {
    let delegate = UIApplication.shared.delegate as! AppDelegate
    return delegate.persistentContainer.viewContext
}

func recoverData(){
    let context = connection()
    let fetchRequest : NSFetchRequest<Entrada> = Entrada.fetchRequest()
    
    do {
        var totalEntradas = try context.fetch(fetchRequest)
    } catch let error as NSError {
        print("No se pudo recuperar los datos.", error)
    }
}

func saveEntrada(titulo: String, entradaDiario: String, foto: NSData, fecha: Date, ubicacionLatitud: String, ubicacionLongitud: String) {
    let context = connection()
    let entrada = NSEntityDescription.insertNewObject(forEntityName: "Entrada", into: context)
    
    entrada.setValue(titulo, forKeyPath: "titulo")
    entrada.setValue(entradaDiario, forKey: "entradaDiario")
    entrada.setValue(foto, forKey: "foto")
    entrada.setValue(fecha, forKey: "fecha")
    entrada.setValue(ubicacionLatitud, forKey: "ubicacionLatitud")
    entrada.setValue(ubicacionLongitud, forKey: "ubicacionLongitud")
    
    do {
        try context.save()
    } catch let error as NSError {
        print("No lo pude salvar. \(error), \(error.userInfo)")
    }
}

func saveUsuario(nombre: String) {
    let context = connection()
    let usuario = NSEntityDescription.insertNewObject(forEntityName: "Usuario", into: context)
    
    usuario.setValue(nombre, forKeyPath: "nombre")
    
    do {
        try context.save()
    } catch let error as NSError {
        print("No lo pude salvar. \(error), \(error.userInfo)")
    }
}
