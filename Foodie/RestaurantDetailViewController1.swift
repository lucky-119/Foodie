//
//  RestaurantDetailViewController1.swift
//  Foodie
//
//  Created by Lakshay Arora on 10/09/17.
//  Copyright © 2017 Lakshay Arora. All rights reserved.
//

import UIKit
import MapKit

class RestaurantDetailViewController1: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var mapView: MKMapView!
    
    
    var restaurant:RestaurantMO!

    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantImageView.image = UIImage(data: (restaurant.image)!)
        tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue:
            240.0/255.0, alpha: 0.2)
        tableView.separatorColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue:
            255.0/255.0, alpha: 0.8)
        title = restaurant.name
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RestaurantDetailTableViewCell
        
        switch indexPath.row
        {
        case 0:
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text = restaurant.name
        case 1:
            cell.fieldLabel.text = "Location"
            cell.valueLabel.text = restaurant.location
        case 2:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = restaurant.type
        case 3:
            cell.fieldLabel.text = "Contact No"
            cell.valueLabel.text = restaurant.phone
        case 4:
            cell.fieldLabel.text = "Visited Before"
            cell.valueLabel.text = (restaurant.isVisited) ? "Yes" : "No"
        case 5:
            cell.fieldLabel.text = "Rating"
            if(restaurant.rating == "" )
            {
                cell.valueLabel.text = "N/A"
            }
            else
            {
                cell.valueLabel.text = restaurant.rating
            }
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        
        
        cell.backgroundColor = UIColor.clear
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showReview"
        {
            let destinationController  = segue.destination as! ReviewViewController
            destinationController.restaurants = restaurant
        }
    }
    
    @IBAction func close(segue: UIStoryboardSegue)
    {
        
    }
    
    @IBAction func ratingButtonTapped(segue: UIStoryboardSegue)
    {
        if let rating = segue.identifier{
            
            restaurant.isVisited = true
            switch rating{
            case "great":
                restaurant.rating = "Absolutely love it! Must Try."
            case "good":
                restaurant.rating = "Pretty good"
            case "dislike":
                restaurant.rating = "Not Good"
            default:
                break;
            }
        }
        tableView.reloadData()
    }
    
    func showMap()
    {
        performSegue(withIdentifier: "showMap", sender: self)
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
