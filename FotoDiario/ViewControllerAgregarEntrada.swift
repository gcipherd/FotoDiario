//
//  ViewControllerAgregarEntrada.swift
//  FotoDiario_v2
//
//  Created by Sergio Morales on 3/12/19.
//  Copyright © 2019 Sergio Morales. All rights reserved.
//

import UIKit
import CoreLocation
import CoreData

class ViewControllerAgregarEntrada: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var textFieldTitulo: UITextField!
    @IBOutlet weak var textViewEntrada: UITextView!
    @IBOutlet weak var imageViewImagen: UIImageView!
    
    var entradas : [Entrada] = []
    var entry : Entrada = Entrada()
    
    let locationManager = CLLocationManager()
    var latitud: String = ""
    var longitud: String = ""
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLocation: CLLocation = locations[locations.count - 1]
        
        latitud = String(lastLocation.coordinate.latitude)
        longitud = String(lastLocation.coordinate.longitude)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        recoverData()
        
    }
    
    @IBAction func elegirImagen(_ sender: UIButton) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        
        let actionSheet = UIAlertController(title: "FotoDiario", message: "Escoge tu foto", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Cámara", style: .default, handler: {(action: UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            } else {
                print("La cámara no está disponible.")
            }
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Galería de fotos", style: .default, handler: {(action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageViewImagen.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func botonAgregarEntrada(_ sender: UIButton) {
        
        guard let titulo = textFieldTitulo.text, let entradaDiario = textViewEntrada.text, let foto = imageViewImagen.image, titulo != "", entradaDiario != "", foto != nil else {
            let alert = UIAlertController(title: "No deje campos vacíos", message: "Por favor llene todos los campos y escoja una foto.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert, animated: true)
            return
        }
        
        locationManager.stopUpdatingLocation()
        
        let imagenData = imageViewImagen.image!.pngData() as NSData?
        
        saveEntrada(titulo: textFieldTitulo.text!, entradaDiario: textViewEntrada.text, foto: imagenData!, fecha: Date(), ubicacionLatitud: latitud, ubicacionLongitud: longitud)
        recoverData()
        print("salvado")
        performSegue(withIdentifier: "unwindAPrincipal", sender: self)
        
    }

}
