//
//  ViewController.swift
//  FotoDiario_v2
//
//  Created by Sergio Morales on 3/12/19.
//  Copyright © 2019 Sergio Morales. All rights reserved.
//

import UIKit
import CoreData

class ViewControllerPrincipal: UIViewController {
    
    
    @IBOutlet weak var labelBienvenida: UILabel!
    
    @IBAction func unwindAPrincipal(segue: UIStoryboardSegue) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var name = UserDefaults.standard.value(forKey: "name")!
        labelBienvenida.text = "Bienvenido, \(name)."
        
    }
    
    func connection() -> NSManagedObjectContext {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    
    func recoverData(){
        let context = connection()
        let fetchRequest : NSFetchRequest<Usuario> = Usuario.fetchRequest()
        
        do {
            var usuarios = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("No se pudo recuperar los datos.", error)
        }
    }
    
    
    
}

