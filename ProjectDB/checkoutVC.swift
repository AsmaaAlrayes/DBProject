//
//  checkoutVC.swift
//  ProjectDB
//
//  Created by Asmaa Alrayes on 12/18/18.
//  Copyright © 2018 Asmaa Alrayes. All rights reserved.
//


import Foundation
import UIKit
import FirebaseDatabase

struct checkoutCellData {
    let image : UIImage?
    let message : String?
    let location : String?
}

var priceString = 0.0
class checkoutVC: UITableViewController {
    var data = [checkoutCellData]()
    var array = ["asmaa"]
    var nnn = "asas"
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //#imageLiteral(resourceName: "Rest")
        data = []
        // data = [CellData.init(image: #imageLiteral(resourceName: "Rest"), message: "helloooo asmaaaa", location: "KWT"),CellData.init(image: #imageLiteral(resourceName: "Rest"), message: nnn, location: "KWT")]
        
        self.tableView.estimatedRowHeight = 500
        print("88888888")
        //print(shoppingCart[0])
        
//        print(shoppingCart.count)
//        print(shoppingCart[0].name)
        
        //***********
        //------print to table----------------------------------------------------------------------------------
      
        // iterate over all keys
        if shoppingCart.count != 0 {
            for key in 0...(shoppingCart.count-1){
                print(key)
                priceString = priceString + (shoppingCart[key].price as NSString).doubleValue
                self.data.append(checkoutCellData.init(image: #imageLiteral(resourceName: "Rest"), message: shoppingCart[key].name, location: shoppingCart[key].price))
                
            }
            self.data.append(checkoutCellData.init(image: #imageLiteral(resourceName: "Rest"), message: "", location: ""))
            
            self.data.append(checkoutCellData.init(image: #imageLiteral(resourceName: "Rest"), message: "The Total is  ", location: String(priceString)+" KD"))
        }
        self.tableView.reloadData()
        
        //-------------------------------------------------------------------------------------------------
        
        self.tableView.register(checkoutCustomCell.self, forCellReuseIdentifier: "custom")
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! checkoutCustomCell
        
        cell.mainimage = data[indexPath.row].image
        cell.message = data[indexPath.row].message
        cell.location = data[indexPath.row].location
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Shopping Cart"
    }
    
    
    
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("*********************")
//        print("pressed")
//        //row = indexPath.row
//        
//        
//        //if cell pressed
//        //=================
//        
//        
//        //shoppingCart.append(data[indexPath.row].message!);
//        
//        shoppingCart.append(data[indexPath.row].message!);
//        
//        
//        //print (shoppingCart)
//        print (shoppingCart, separator: ", ", terminator: ".")
//        
//        
//        
//        
//        //Show alert message (to go to cart, or continue adding meals)
//        
//        let alert = UIAlertController(title: "Proceed to Order", message: "Go to Shopping Cart", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Continue Adding Food", style: .cancel, handler: nil))
//        
//        self.present(alert, animated: true)
//        
//        //now I need to add a new view controller which I will display the products passed from shoppingCartArray
//        //then create a connection from dishes view to the new view controller "Checkout"
//        //I had also created a new cacao touc swift file with checkoutVC
//        
//        
//        //this is the function for yes which will go to another view controller (checkout)
//        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
//            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//            let destination = storyboard.instantiateViewController(withIdentifier: "checkout") as! checkoutVC
//            self.navigationController?.pushViewController(destination, animated: true)
//            
//            
//            //I still need to pass the data as well (pass the array shoppingCart to be printed
//            
//        }))
//        
//    }

    
}
