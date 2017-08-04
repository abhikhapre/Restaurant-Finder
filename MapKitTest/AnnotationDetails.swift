//
//  AnnotationDetails.swift
//  MapKitTest
//
//  Created by Abhishek Jaykrishna Khapare on 7/17/17.
//  Copyright © 2017 Abhishek Jaykrishna Khapare. All rights reserved.
//

import UIKit
import MapKit

class AnnotationDetails: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    
    var title: String?
    
    var subtitle: String?
    var averageRating : String?
    var totalRating: String?
    var totalReviews: String?
    
    init(coordinate : CLLocationCoordinate2D , title: String?, subTitle:String?,averageRating:String,totalRating:String,totalReviews:String)
    {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subTitle
        self.totalRating = totalRating
        self.totalReviews = totalReviews
        self.averageRating = averageRating
        
        super.init()
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
