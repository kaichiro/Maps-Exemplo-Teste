//
//  VCTerceira.swift
//  MyPhomeApp
//
//  Created by Aluno on 23/03/2019.
//  Copyright © 2019 kcfg23. All rights reserved.
//

import UIKit
import MapKit

class VCTerceira:
    UIViewController,
    MKMapViewDelegate,
    UIGestureRecognizerDelegate
{
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {

        let ponto = gestureRecognizer.location(in: vrMap)
        
        let coordenadas = vrMap.convert(ponto, toCoordinateFrom: vrMap)
        
        let pino = MKPointAnnotation()
        pino.title = "nova anotação"
        pino.coordinate = coordenadas
        vrMap.addAnnotation(pino)
        
        print("Um long press ocorreu")
        
        return true
    }

    @IBOutlet weak var vrMap: MKMapView!
    
    @IBAction func trataEventoSegmented(_ sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0)
        {
            vrMap.mapType = .standard
        }
        else {
            if(sender.selectedSegmentIndex == 1)
            {
                vrMap.mapType = .satellite
            }
            else
            {
                vrMap.mapType = .hybrid
            }
        }
    }
    
    @IBAction func handleCall(_ sender: UIButton) {
//        if let url = URL(string: "tel//\()"
    }
    
    func criaPino()
    {
        let pino = MKPointAnnotation()
        pino.title = "UFG Mobile"
        
        let coordenadas = CLLocationCoordinate2D(latitude: -16.603314, longitude: -49.267128)
        pino.coordinate = coordenadas
        
        vrMap.addAnnotation(pino)
     
        let zoom = MKCoordinateSpanMake(0.002, 0.002)
        let regiao = MKCoordinateRegion( center: pino.coordinate, span: zoom)
        
        vrMap.setRegion(regiao, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vrMap.delegate = self

        // Do any additional setup after loading the view.
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("Um pino foi selecionado no MAP")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        criaPino()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
