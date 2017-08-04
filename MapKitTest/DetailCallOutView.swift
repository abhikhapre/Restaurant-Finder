//
//  DetailCallOutView.swift
//  MapKitTest
//
//  Created by Abhishek Jaykrishna Khapare on 7/17/17.
//  Copyright © 2017 Abhishek Jaykrishna Khapare. All rights reserved.
//

import UIKit

class DetailCallOutView: UIViewController {

    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var averageRating: UILabel!
    @IBOutlet weak var totalRatingslabel: UILabel!
    @IBOutlet weak var totalReviewsLabel: UILabel!
    @IBOutlet weak var lastReviewLabel: UILabel!
    
    
    var titleName:String?
    var subTitle:String?
    var totalRating:String?
    var averageRatinglabel:String?
    var totalReview:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let data = ShowResultViewController()
        
       // namelabel.text = titleName!
        addressLabel.text = subTitle!
        averageRating.text = averageRatinglabel!
        totalRatingslabel.text = totalRating!
        totalReviewsLabel.text = totalReview!
        
        
        // Do any additional setup after loading the view.
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
