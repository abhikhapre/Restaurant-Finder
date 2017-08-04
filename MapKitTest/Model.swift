//
//  Model.swift
//  MapKitTest
//
//  Created by Abhishek Jaykrishna Khapare on 7/20/17.
//  Copyright © 2017 Abhishek Jaykrishna Khapare. All rights reserved.
//

import Foundation
import CoreData

class Model{
    
    //var titleName = [String]()
    var destTitle = [String]()
    var destAddress = [String]()
    var destLatitude = [String]()
    var destLongitude = [String]()
    var averageRating = [String]()
    var totalRating = [String]()
    var totalReviews = [String]()
    
    
    
    
    
    func makeNetworkCall(urlString:URL, secondParameter:@escaping([String],[String],[String],[String],[String],[String],[String])->Void){
       let task = URLSession.shared.dataTask(with: urlString as URL){
            data,response,error in
        
        
        do{
            //  let data = try Data.init(contentsOf: url!)
            
            //parsing the data
            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : Any]
            
            let query = json["query"] as! [String : Any]
            
            let results = query["results"] as! [String : Any]
            let result = results["Result"] as! [[String : Any]]
            
            
            for temp in result{
                
                let rating = temp["Rating"] as! [String : Any]
                self.averageRating.append(rating["AverageRating"] as! String)
                self.totalRating.append(rating["TotalRatings"] as! String)
                self.totalReviews.append(rating["TotalReviews"] as! String)
                // reviewsIntro.append(rating["LastReviewIntro"] as! String)
                
                //
                
                self.destTitle.append(temp["Title"] as! String)
                self.destAddress.append(temp["Address"] as! String)
                
                             //print(address)
                
                self.destLatitude.append(temp["Latitude"] as! String)
                self.destLongitude.append(temp["Longitude"] as! String)
                //
                //print(titleName)
                //  performSegue(withIdentifier: "segue", sender: self)
                
                
            }
        }catch let error{
            print(error)
        }
        
        secondParameter(self.destTitle,self.averageRating,self.destAddress,self.destLatitude,self.destLongitude,self.totalRating,self.totalReviews)
        
//        let pin = ShowResultViewController()
//        pin.showPins()
//
        
        }
        task.resume()
        
        
    }
}
