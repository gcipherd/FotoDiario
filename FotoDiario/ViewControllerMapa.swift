//
//  ViewControllerMapa.swift
//  FotoDiario_v2
//
//  Created by Sergio Morales on 3/17/19.
//  Copyright © 2019 Sergio Morales. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewControllerMapa: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    //var entradas: [Entrada] = []
    
    @IBOutlet weak var mapa: MKMapView!
    var puntos : [MKPointAnnotation] = [MKPointAnnotation]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapa.mapType = .standard
        
        locationManager.delegate = self
        
        if CLLocationManager.locationServicesEnabled() {
            comprobarAutorizacionUbicacion()
        }
    }
    
    func comprobarAutorizacionUbicacion() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .authorizedWhenInUse:
            mapa.showsUserLocation = true
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            centrarVista()
            break
        case .authorizedAlways:
            mapa.showsUserLocation = true
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            centrarVista()
            break
        case .denied:
            let alert = UIAlertController(title: "Se necesitan permisos", message: "Es recomendado que nos de permiso de obtener su ubicación", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert, animated: true)
            break
        case .restricted:
            let alert = UIAlertController(title: "Se necesitan permisos", message: "Es recomendado que nos de permiso de obtener su ubicación", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert, animated: true)
            break
        }
    }
    
    func centrarVista() {
        if let ubicacion = locationManager.location?.coordinate {
        
            let region = MKCoordinateRegion.init(center: ubicacion, latitudinalMeters: 100_000, longitudinalMeters: 100_000)
            mapa.setRegion(region, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        comprobarAutorizacionUbicacion()
    }

}
