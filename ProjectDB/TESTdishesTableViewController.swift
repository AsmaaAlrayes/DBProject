//
//  TESTdishesTableViewController.swift
//  ProjectDB
//
//  Created by Asmaa Alrayes on 12/16/18.
//  Copyright © 2018 Asmaa Alrayes. All rights reserved.
//


import Foundation
import UIKit
import FirebaseDatabase

struct dishesCellData {
    let image : UIImage?
    let message : String?
    let location : String?
}
//var shoppingCart = [String]()
//var shoppingCart: [String: String] = [:]
//var shoppingCart = [(String, String)]()

var shoppingCart:[(name: String, price: String)] = []
//var shoppingCart:[Any]

var nameofrest = ""
class TESTdishesTableViewController: UITableViewController {
    var data = [dishesCellData]()
    var array = ["asmaa"]
    var nnn = "asas"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //#imageLiteral(resourceName: "Rest")
        data = []
        // data = [CellData.init(image: #imageLiteral(resourceName: "Rest"), message: "helloooo asmaaaa", location: "KWT"),CellData.init(image: #imageLiteral(resourceName: "Rest"), message: nnn, location: "KWT")]
        
        self.tableView.estimatedRowHeight = 500
        
        //------Database----------------------------------------------------------------------------------
        let ref = Database.database().reference()
        //1st
       ref.child("rest").child(String(rowinrest+1)).child("dishes").child("1").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let name = value?["name"] as? String ?? ""
            var location = value?["price"] as? String ?? ""
            location = location + " KD"
        print(rowinrest)
        print(name)
        print(location)
             self.data.append(dishesCellData.init(image: #imageLiteral(resourceName: "Rest"), message: name, location: location))
            self.tableView.reloadData()
            

            
        })
        

        //-------------------------------------------------------------------------------------------------
        
        self.tableView.register(dishesCustomCell.self, forCellReuseIdentifier: "custom")
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! dishesCustomCell
        
        cell.mainimage = data[indexPath.row].image
        cell.message = data[indexPath.row].message
        cell.location = data[indexPath.row].location
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("*********************")
        print("pressed")
        //row = indexPath.row
        
        
        //if cell pressed
        //=================
        
        
        //shoppingCart.append(data[indexPath.row].message!);
        
        //shoppingCart.append(data[indexPath.row].message!);
        var alican = (name: data[indexPath.row].message!, data[indexPath.row].location!)
        shoppingCart.append(alican)
        
        //shoppingCart.append((data[indexPath.row].message!, data[indexPath.row].location!))
       
        
        //print (shoppingCart)
        print (shoppingCart, separator: ", ", terminator: ".")
        
        
        
        
        //Show alert message (to go to cart, or continue adding meals)
        
        let alert = UIAlertController(title: "Proceed to Order", message: "Go to Shopping Cart", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue Adding Food", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
        
        //now I need to add a new view controller which I will display the products passed from shoppingCartArray
        //then create a connection from dishes view to the new view controller "Checkout"
        //I had also created a new cacao touc swift file with checkoutVC
        
        
        //this is the function for yes which will go to another view controller (checkout)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let destination = storyboard.instantiateViewController(withIdentifier: "checkout") as! checkoutVC
            self.navigationController?.pushViewController(destination, animated: true)
            
            
            //I still need to pass the data as well (pass the array shoppingCart to be printed
            
        }))

    }
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        
//        
//        //------Database----------------------------------------------------------------------------------
//        let ref = Database.database().reference()
//        //1st
//        ref.child("rest").child(String(rowinrest+1)).observeSingleEvent(of: .value, with: { (snapshot) in
//            let value = snapshot.value as? NSDictionary
//            nameofrest = value?["name"] as? String ?? ""
//            
//            
//        })
//        
//        return nameofrest
//    }
}
