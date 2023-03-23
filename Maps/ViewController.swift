//
//  ViewController.swift
//  Maps
//
//  Created by imac on 01/03/23.
//

import UIKit
import MapKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var lblPais: UILabel!
    @IBOutlet weak var scrCiudades: UIScrollView!
    @IBOutlet weak var imvCiudad: UIImageView!
    @IBOutlet weak var mapCiudad: MKMapView!
    let ciudades = ["Berlín", "Cd. de México", "París", "Tokyo", "Washington"]
    let paises = ["Alemania", "México", "Francia", "Japón", "Estados Unidos"]
    let imagenes = ["Ciudad Berlin.jpg", "Ciudad Mexico.jpg", "Ciudad Paris.jpg", "Ciudad Tokio.jpg", "Ciudad Washington.jpg"]
    let latitudes = [52.51917, 19.43260, 48.85661, 35.68949, 38.89511]
    let longitudes = [13.40609, -99.13320, 2.35222, 139.69170, -77.03637]
    var indice = 0
    let pin = Marcador()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scrCiudades.contentSize = CGSize(width: 0, height: mapCiudad.frame.origin.y + mapCiudad.frame.height + 10)
        setearMapa()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ciudades.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ciudades[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        indice = row
        lblPais.text = "País: " + paises[indice]
        imvCiudad.image = UIImage(named: imagenes[indice])
        setearMapa()
    }
    
    func setearMapa() {
        var region = MKCoordinateRegion()
        mapCiudad.removeAnnotation(pin)
        
        region.center.latitude = latitudes[indice]
        region.center.longitude = longitudes[indice]
        region.span.latitudeDelta = 0.15
        region.span.longitudeDelta = 0.15
        pin.coordinate = region.center
        pin.title = "Latitud: " + String(latitudes[indice])
        pin.subtitle =  "Longitud: " + String(longitudes[indice])
        
        mapCiudad.setRegion(region, animated: true)
        mapCiudad.addAnnotation(pin)
    }

}

