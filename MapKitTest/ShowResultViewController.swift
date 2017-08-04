//
//  ShowResultViewController.swift
//  MapKitTest
//
//  Created by Abhishek Jaykrishna Khapare on 7/17/17.
//  Copyright © 2017 Abhishek Jaykrishna Khapare. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ShowResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , MKMapViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    var destTitle = [String]()
    var destAddress = [String]()
    var destLatitude = [String]()
    var destLongitude = [String]()
    var averageRating = [String]()
    var totalRating = [String]()
    var totalReviews = [String]()
    
    var locationTerm = ""
    var searchTerm = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //setting delegates
        mapView.delegate = self
        mapView.showsPointsOfInterest = true
        mapView.showsScale = true
        mapView.showsUserLocation = true
        
        
        //data parsing
        let urlString = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20local.search%20where%20zip%3D%27\(locationTerm)%27%20and%20query%3D%27\(searchTerm)%27&format=json&callback="
        let url = URL.init(string:urlString)!
        DispatchQueue.global(qos: .userInitiated).async {
            
        self.fetchData(url : url)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }//main
        }//global
    }
    
    
    
    func fetchData(url : URL)
    {
        let model = Model()
        model.makeNetworkCall(urlString: url){
            titleName,avgRating,address,latitude,longitude,rating,reviews in
            
            self.destTitle = titleName
            self.destAddress = address
            self.destLongitude = longitude
            self.destLatitude = latitude
            self.totalReviews = reviews
            self.totalRating = rating
            self.averageRating = avgRating
            
          self.showPins()
            }//networkCall
        
    }//fetchData
    
    func showPins()
    {
        //show pins
        for i in 0..<self.destTitle.count {
            let latitude = self.destLatitude[i]
            let longitude = self.destLongitude[i]
            
            let coordinates = CLLocationCoordinate2D.init(latitude: CLLocationDegrees(latitude)!, longitude: CLLocationDegrees(longitude)!)
            
            let span = MKCoordinateSpanMake(0.1, 0.1)
            
            let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(CLLocationDegrees(latitude)!, CLLocationDegrees(longitude)!)
            
            
            let region: MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
            
            
            
            self.mapView.setRegion(region, animated: true)
            
            //default annotation pin
            /*let annotation = MKPointAnnotation()
             annotation.coordinate.latitude = CLLocationDegrees(latitude)!
             annotation.coordinate.longitude = CLLocationDegrees(longitude)!
             let coordinate = CLLocationCoordinate2D.init(latitude: CLLocationDegrees(latitude)!, longitude: CLLocationDegrees(longitude)!)
             annotation.title = destTitle[i]
             annotation.subtitle = destAddress[i]*/
            
            let annotation = AnnotationDetails(coordinate: coordinates, title: self.destTitle[i], subTitle: self.destAddress[i], averageRating: self.averageRating[i], totalRating: self.totalRating[i], totalReviews: self.totalReviews[i])
            
            self.mapView.addAnnotation(annotation)
        }
    }
    
    
    //delete row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            destTitle.remove(at: indexPath.row)
             destAddress.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    //select a row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let latitude = destLatitude[indexPath.row]
        let longitude = destLongitude[indexPath.row]
        let coordinates = CLLocationCoordinate2D.init(latitude: CLLocationDegrees(latitude)!, longitude: CLLocationDegrees(longitude)!)
        
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(CLLocationDegrees(latitude)!, CLLocationDegrees(longitude)!)
        
        let region: MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        mapView.setRegion(region, animated: true)
        let annotation = AnnotationDetails(coordinate: coordinates, title: destTitle[indexPath.row], subTitle: destAddress[indexPath.row], averageRating: averageRating[indexPath.row], totalRating: totalRating[indexPath.row], totalReviews: totalReviews[indexPath.row])
        
        mapView.addAnnotation(annotation)
        mapView.selectAnnotation(annotation, animated: true)
        
    }
    
    /*func mapView(_ mapView: MKMapView!,viewFor annotation: MKAnnotation!) -> MKAnnotationView! {
        
        let reuseId = "pin"
        let annotation = annotation as? AnnotationDetails
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.animatesDrop = true
            pinView!.pinTintColor = .purple
            pinView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
        }
        else {
            pinView!.annotation = annotation
        }
        
        return pinView
    }*/
    
   /* var titleName = ""
    var subTitle = ""
    var index = ""
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
       // view.annotation?.coordinate
        titleName = ((view.annotation?.title)!)!
        subTitle = ((view.annotation?.subtitle)!)!
        
        
    }*/
    
     func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
     let pin = CustomAnnotationView(annotation: annotation, reuseIdentifier: "pin1")
     return pin
     }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        //print("Tapped")
            performSegue(withIdentifier: "Segue2", sender: view)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Segue2" {
            let dest = segue.destination as! DetailCallOutView
            let view = sender as! CustomAnnotationView
            let annotation = view.annotation as! AnnotationDetails
            
            dest.title = annotation.title!
            dest.subTitle = annotation.subtitle!
            dest.averageRatinglabel = annotation.averageRating!
            dest.totalRating = annotation.totalRating!
            dest.totalReview = annotation.totalReviews!
            
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return destAddress.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.addresslabel.text = destAddress[indexPath.row]
        cell.nameLabel.text = destTitle[indexPath.row]
        
        return cell
        
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
