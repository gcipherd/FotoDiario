//
//  CollectionViewControllerFotos.swift
//  FotoDiario_v2
//
//  Created by Sergio Morales on 3/17/19.
//  Copyright © 2019 Sergio Morales. All rights reserved.
//

import UIKit
import CoreData

private let reuseIdentifier = "CellFotos"

class CollectionViewControllerFotos: UICollectionViewController {

    var entradas: [Entrada] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recoverData()
    }

    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return entradas.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCellFoto
    
        
        let entrada = entradas[indexPath.item]
        cell.foto.image = UIImage(data: entrada.foto!)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let sender = sender as? UICollectionViewCell {
            let indexPath = self.collectionView.indexPath(for: sender)
            let viewFoto = segue.destination as! ViewControllerFoto
            viewFoto.entrada = self.entradas[(indexPath?.item)!]
        }
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
}
