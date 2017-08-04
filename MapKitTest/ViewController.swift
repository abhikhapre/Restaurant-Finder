//
//  ViewController.swift
//  MapKitTest
//
//  Created by Abhishek Jaykrishna Khapare on 7/17/17.
//  Copyright © 2017 Abhishek Jaykrishna Khapare. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate{
    
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var textField: UITextField!
    
    
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBAction func searchButton(_ sender: UIButton) {
        
        
    }
    
    @IBAction func currentLocationButton(_ sender: UIButton) {
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(locations.last!, completionHandler: {(placemark, error) -> Void in
            if error == nil && placemark!.count > 0{
                print(placemark![0].postalCode!)
                self.zipCodeTextField.text = placemark![0].postalCode
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    /* alert actions */
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "segue", (textField.text?.isEmpty)!{
            if identifier == "segue", (zipCodeTextField.text?.isEmpty)!{
                handleBothFields()
                return false
            }
            handleUnnamedSearchKeyField()
            //self.performSegue(withIdentifier: "segue", sender: nil)
            return false
        }else if identifier == "segue", (zipCodeTextField.text?.isEmpty)!{
            handleUnnamedZipCodeField()
            return false
        }else {
            return super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
        }
    }
    private func handleBothFields(){
        let alert = UIAlertController(title: "Invalid Search key and Zip Code" , message: "Please Enter Search key and the zip code", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        alert.textFields?.first?.placeholder = "Search key"
        alert.textFields?.last?.placeholder = "zip code"
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.textField.text = alert.textFields?.first?.text
            self.zipCodeTextField.text = alert.textFields?.last?.text
            self.performSegue(withIdentifier: "segue", sender: nil)
            
        }))
        
        present(alert, animated: true)
        
    }
    private func handleUnnamedZipCodeField(){
        let alert = UIAlertController(title: "Invalid zip code" , message: "Please enter zip code", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        alert.textFields?.last?.placeholder = "zip code"
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.zipCodeTextField.text = alert.textFields?.last?.text
            self.performSegue(withIdentifier: "segue", sender: nil)
            
        }))
        
        present(alert, animated: true)
        
    }
    private func handleUnnamedSearchKeyField(){
    let alert = UIAlertController(title: "Invalid search key" , message: "Please enter Search Key", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        alert.textFields?.first?.placeholder = "Search key"
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.textField.text = alert.textFields?.first?.text
            self.performSegue(withIdentifier: "segue", sender: nil)
        }))
        
    present(alert, animated: true)
        
    }//alert ends here
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segue"{
            let dest:ShowResultViewController = segue.destination as! ShowResultViewController
            dest.locationTerm = zipCodeTextField!.text!
            dest.searchTerm = textField!.text!
            
           // print(titleName)
            
        }
        
    }
    
}

