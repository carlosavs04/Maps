//
//  Marcador.swift
//  Maps
//
//  Created by imac on 07/03/23.
//

import UIKit
import MapKit

class Marcador: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    override init() {
        coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    }
}
