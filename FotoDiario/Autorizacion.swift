//
//  Autorizacion.swift
//  FotoDiario_v2
//
//  Created by Sergio Morales on 4/2/19.
//  Copyright © 2019 Sergio Morales. All rights reserved.
//

import Foundation
import CoreLocation

struct Autorizacion {
    var locationManager = CLLocationManager()
    
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
            //Aqui no hago algo
            break
        case .denied:
            //el prro no dio permiso
            break
        case .restricted:
            //sigue siendo gacho
            break
        }
    }
}

