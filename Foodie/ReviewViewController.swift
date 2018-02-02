//
//  ReviewViewController.swift
//  Foodie
//
//  Created by Lakshay Arora on 12/09/17.
//  Copyright © 2017 Lakshay Arora. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var closeButton: UIButton!
    
    var restaurants: RestaurantMO!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantImageView.image = UIImage(data: (restaurants.image as? Data)!)
        backgroundImageView.image = UIImage(data: (restaurants.image as? Data)!)
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
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
