//
//  CustomAnnotationView.swift
//  MapKitTest
//
//  Created by Abhishek Jaykrishna Khapare on 7/17/17.
//  Copyright © 2017 Abhishek Jaykrishna Khapare. All rights reserved.
//

import UIKit
import MapKit

class CustomAnnotationView: MKAnnotationView {

    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        self.image = UIImage(named: "Image.png")
        
        self.canShowCallout = true
        //detailCalloutAccessoryView = UIView()
        self.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

}
